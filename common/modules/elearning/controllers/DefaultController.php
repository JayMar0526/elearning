<?php

namespace common\modules\elearning\controllers;

use Yii;
use common\modules\cms\models\Lesson;
use common\modules\cms\models\Topic;
use common\modules\cms\models\Quiz;
use common\modules\cms\models\QuizAnswers;
use common\modules\cms\models\Questions;
use common\modules\cms\models\Student;
use common\modules\cms\models\StudentSearch;
use yii\web\Controller;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\base\Model;
/**
 * Default controller for the `elearning` module
 */
class DefaultController extends Controller
{
	/**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            [
                'class' => AccessControl::className(),
                'only' => ['index'],
                'rules' => [
                    [
                       
                        'allow' => true,
                        'roles' => ['Student'],
                    ],
                ],
            ],
            [
                'class' => AccessControl::className(),
                'only' => ['home', 'view-lesson', 'view-topic'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['Teacher', 'Student', 'Administrator'],
                    ],
                ],
            ],
        ];
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {

        if(!empty(Yii::$app->session->get('studId'))){
            return $this->redirect(['/elearning/default/home']);
        }

        $model = new Student();
        if ($model->load(Yii::$app->request->post())) {
            $query = Student::find()->joinWith('cr')->where(['cr_code.code' => $model->cr_id, 'ln' => $model->ln, 'fn' => $model->fn])->One();
            if($query){
                Yii::$app->session->set('studId', $query->id);
                return $this->redirect(['/elearning/default/home']);
            }else{
                \Yii::$app->getSession()->setFlash('danger', 'The student is not exist or incorrect classroom code.');
            }
        }        
        
        return $this->render('index', [
                    'model' => $model
                ]);
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionHome()
    {
        // echo Yii::$app->session->get('studId'); exit;
        if(empty(Yii::$app->session->get('studId')) && Yii::$app->user->can('Student')){
            return $this->redirect('index');
        }else{
            $lessons = Lesson::find()->orderBy(['title' => SORT_ASC])->all();
            return $this->render('home', ['lessons' => $lessons]);
        }
        
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionViewLesson($id)
    {
        $categories = Lesson::getCategories($id);

        return $this->render('view-lesson', [
                'categories' => $categories,
                'lesson' => $this->findModel($id),
                ]);
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionViewTopic($id)
    {
        $model = Topic::find()->where(['id' => $id])->One();
        $categories = Lesson::getCategories($model->lesson_id);

        if(Yii::$app->session->get('studId')){
            $modelQuiz = Quiz::find()->where(['topic_id' => $id, 'stud_id' => Yii::$app->session->get('studId')])->all();
            
            if(empty($modelQuiz) && ($model->sort == 2)){
                Yii::$app->session->setFlash('danger','Sorry, You are not allowed to perform this action. You have to input the code by clicking the "Panghuling Pagsusulit" in side bar. Thank you ');
                return $this->redirect(['/elearning/default/view-lesson', 'id' => $model->lesson_id]);
            }
        }else {
            return $this->redirect(['/elearning/default/index']);
        }
        

        //Get the value if exist or not since the function post exam has been generated the value for quiz/topic;
        $modelQuiz = Quiz::getQuizLogs($id);

        

        $questions = $model->questions;
        $datas = [];
        $score = 0;

        $qry = QuizAnswers::find()->where(['quiz_id' => $modelQuiz->id])->exists();

        if($questions){
            foreach($questions as $question) {
                if(!empty($qry)) {
                    $modelExam = QuizAnswers::find()->where(['quiz_id' => $modelQuiz->id, 'question_id' => $question->id])->One();

                    if(strcasecmp($question->ans, $modelExam->answer) == 0){
                        $score++;
                    }

                } else {
                    $modelExam = new QuizAnswers();
                }
                $modelExam->quiz_id = $modelQuiz->id;
                $modelExam->qtitle = $question->title;
                $modelExam->question_id = $question->id;
                $modelExam->qtype = $question->unit_id;
                $modelExam->correct_answer = $question->ans;
                $modelExam->answerTitle = $question->answerTitle;
                $datas[$question->id] = $modelExam;
            }
        } 

       if (Yii::$app->request->post()) {

            if(Model::loadMultiple($datas, Yii::$app->request->post())) {
                    $score = 0;
                   foreach($datas as $d)
                    {
                        if(strcasecmp($d->correct_answer, $d->answer) == 0){
                            $score++;
                        }
                        $d->save(false);
                        
                    }
            }

            Yii::$app->session->setFlash('msg', $model->getMessage($score, $model->passing_grade));

            return $this->redirect(['view-topic', 'id' => $model->id]);

        } else {
            return $this->render('view-topic', [
                'model' => $model,
                'categories' => $categories,
                'lesson' => $this->findModel($model->lesson_id),
                'questions' => $questions,
                'datas' => $datas,
                'qry' => $qry,
                'score' => $score,
                ]);
        }
    }

    protected function findModel($id)
    {
        if (($model = Lesson::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionPostExam($id)
    {
        $modelTopic = Topic::find()->where(['id' => $id])->One();

        if (Yii::$app->request->post()) {

            $modelPost = Yii::$app->request->post();
            if($modelPost['code'] == $modelTopic->lesson->code){

                //Asign value;
                $modelQuiz = Quiz::getQuizLogs($id);

                //return to view topic
                Yii::$app->runAction('/elearning/default/view-topic', ['id' => $id]);
            }else {
                Yii::$app->session->setFlash('warning','Sorry, the code you entered is incorrect');
                return $this->redirect(Yii::$app->request->referrer);
            }
        }

        //return to post exam
        return $this->renderAjax('post-exam', ['id' => $id]);
        
    }

}
