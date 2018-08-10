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
                'only' => ['home'],
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
        $modelQuiz = Quiz::getQuizLogs($id);
        // echo '<pre>'; print_r($modelQuiz); exit;
        $model = Topic::find()->where(['id' => $id])->One();
        $categories = Lesson::getCategories($model->lesson_id);

        $questions = $model->questions;

        foreach($questions as $question) {
            $modelExam = new QuizAnswers();
        }



        

        return $this->render('view-topic', [
                'model' => $model,
                'categories' => $categories,
                'lesson' => $this->findModel($model->lesson_id),
                'questions' => $questions
                ]);
    }

    protected function findModel($id)
    {
        if (($model = Lesson::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
