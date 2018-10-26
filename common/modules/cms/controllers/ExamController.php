<?php

namespace common\modules\cms\controllers;

use Yii;
use common\modules\cms\models\Questions;
use common\modules\cms\models\QuestionChoices;
use common\modules\cms\models\Topic;
use common\modules\cms\models\QuestionsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use common\models\MultipleModel;
use yii\helpers\ArrayHelper;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\ForbiddenHttpException;


/**
 * ExamController implements the CRUD actions for Questions model.
 */
class ExamController extends Controller
{
    /**
     * {@inheritdoc}
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
                'only' => ['index', 'view', 'create', 'update', 'delete', 'view-question','question-answer', 'create-exam', 'create-question'],
                'rules' => [
                    [
                       
                        'allow' => true,
                        'roles' => ['Administrator'],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Questions models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new QuestionsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Questions model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }


    /**
     * Displays a single Questions model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionViewQuestion($id)
    {

        return $this->renderAjax('view-question', [
            'model' => $this->findModel($id)
        ]);
    }

    /**
     * Updates an existing Questions model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionQuestionAnswer($id)
    {
        $model = $this->findModel($id);

        $choices = $model->questionChoices;
        $choices = ArrayHelper::map($choices, 'id', 'choice');


        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(Yii::$app->request->referrer);
        }

        return $this->renderAjax('question-answer', [
            'model' => $model,
            'choices' => $choices
        ]);
    }

    public function actionUpdateExam($id)
    {

        $model = Questions::findOne($id);
        $modelsChoices = $model->questionChoices;

        $modelTopic = $model->topic;

        $searchModel = new QuestionsSearch();
        $searchModel->topic_id = $model->topic_id;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);


        if ($model->load(Yii::$app->request->post())) {

            $oldIDs = ArrayHelper::map($modelsChoices, 'id', 'id');
            $modelsChoices = MultipleModel::createMultiple(QuestionChoices::classname(), $modelsChoices);
            MultipleModel::loadMultiple($modelsChoices, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($modelsChoices, 'id', 'id')));

            // echo '<pre>';
            // print_r(array_filter(ArrayHelper::map($modelsChoices, 'id', 'id')));
            // print_r($oldIDs);
            // print_r($deletedIDs);
            // // print_r(ArrayHelper::map($modelsChoices, 'id', 'id'));
            // exit;

            // validate all models
            $valid = $model->validate();
            $valid = MultipleModel::validateMultiple($modelsChoices) && $valid;

            $transaction = \Yii::$app->db->beginTransaction();
            try {
                if ($flag = $model->save()) {
                    if (!empty($deletedIDs)) {
                        QuestionChoices::deleteAll(['id' => $deletedIDs]);
                    }
                    foreach ($modelsChoices as $modelChoices) {
                        $modelChoices->question_id = $model->id;
                        if (! ($flag = $modelChoices->save())) {
                            $transaction->rollBack();
                            break;
                        }
                    }
                }
                if ($flag) {
                    $transaction->commit();
                    return $this->redirect(['create-exam', 'id' => $model->topic->id]);
                }
            } catch (Exception $e) {
                $transaction->rollBack();
            }
        }

        return $this->render('create-exam', [
            'modelTopic' => $modelTopic,
            'model' => $model,
            'modelsChoices' => (empty($modelsChoices)) ? [new QuestionChoices] : $modelsChoices,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Creates a new Questions model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateExam()
    {
        $topicId = Yii::$app->request->queryParams['id'];
        $modelTopic = Topic::findOne(['id' => $topicId]);

        $searchModel = new QuestionsSearch();
        $searchModel->topic_id = $topicId;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        $model = new Questions();
        $modelsChoices = [new QuestionChoices];
        $topicId = Yii::$app->request->queryParams['id'];
        if ($model->load(Yii::$app->request->post())) {
            $model->topic_id = $topicId;
            $modelsChoices = MultipleModel::createMultiple(QuestionChoices::classname());
            MultipleModel::loadMultiple($modelsChoices, Yii::$app->request->post());
           
                $transaction = \Yii::$app->db->beginTransaction();

                try {

                    if ($flag = $model->save(false)) {
                        foreach ($modelsChoices as $modelsChoice) {
                            $modelsChoice->question_id = $model->id;
                            if (! ($flag = $modelsChoice->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['create-exam', 'id' => $modelTopic->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
        }
        
        return $this->render('create-exam', [
            'modelTopic' => $modelTopic,
            'model' => $model,
            'modelsChoices' => (empty($modelsChoices)) ? [new QuestionChoices] : $modelsChoices,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Creates a new Questions model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateQuestion()
    {
        $model = new Questions();
        $modelsChoices = [new QuestionChoices];
        $topicId = Yii::$app->request->queryParams['id'];
        if ($model->load(Yii::$app->request->post())) {
            $model->topic_id = $topicId;
            $modelsChoices = MultipleModel::createMultiple(QuestionChoices::classname());
            MultipleModel::loadMultiple($modelsChoices, Yii::$app->request->post());

           
                $transaction = \Yii::$app->db->beginTransaction();

                try {

                    if ($flag = $model->save(false)) {
                        foreach ($modelsChoices as $modelsChoice) {
                            $modelsChoice->question_id = $model->id;
                            if (! ($flag = $modelsChoice->save(false))) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
                         return $this->redirect(Yii::$app->request->referrer);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }



            // return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->renderAjax('create-question', [
            'model' => $model,
            'modelsChoices' => (empty($modelsChoices)) ? [new QuestionChoices] : $modelsChoices
        ]);
    }

    

    /**
     * Creates a new Questions model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Questions();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Questions model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Questions model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(Yii::$app->request->referrer);
    }

    /**
     * Finds the Questions model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Questions the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Questions::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
