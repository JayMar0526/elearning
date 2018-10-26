<?php

namespace common\modules\cms\controllers;

use Yii;
use common\modules\cms\models\Topic;
use common\modules\cms\models\TopicSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\ForbiddenHttpException;

/**
 * TopicController implements the CRUD actions for Topic model.
 */
class TopicController extends Controller
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
                'only' => ['index', 'view', 'create', 'update', 'delete', 'create-topic'],
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
     * Lists all Topic models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TopicSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Topic model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        if(Yii::$app->request->isAjax){
            return $this->renderAjax('view', [
                'model' => $this->findModel($id),
            ]);
        }else{
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new Student model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreateTopic()
    {
        $model = new Topic();
        $lessonId = Yii::$app->request->queryParams['id'];
        $model->instruction = '<span style="font-size: 30pt;" class="label label-info">Talaan ng Ispisipikasyon</span>

<center><img class="file-preview-image" src=" "></center>
<h2>Panuto: Basahin at unawain. I-click ang letra ng tamang sagot. </h2>
';/*'<span style="font-size: 30pt;" class="label label-info"></span>
<h2>Panuto: </h2>
//For container
<div class="col-md-12 bg-info lead"></div>
<center></center>';*/
        if ($model->load(Yii::$app->request->post())) {

            $model->lesson_id = $lessonId;

            if($model->save()){

                \Yii::$app->getSession()->setFlash('success', 'New topic successfully save.');
            }else{
                \Yii::$app->getSession()->setFlash('warning', 'New student failed to save.');
            }            
            return $this->redirect(['/cms/lesson/view', 'id' => $lessonId]);
        }

        if(Yii::$app->request->isAjax){
            return $this->renderAjax('create', [
                'model' => $model,
            ]);
        }else{
            return $this->render('create', [
                'model' => $model,
            ]);
        }
        
    }

    /**
     * Creates a new Topic model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Topic();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Topic model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $filePath = '';
        if($model) {
            $data = !empty($model->files[0]) ? $model->files[0]->url : 'walang nakitang image' ;
            $filePath = 'Pakilagay sa pagitan ng quotation ng <b>src=""</b> itong link --> '.$data;
        }



        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            \Yii::$app->getSession()->setFlash('success', 'You have successfully updated the record.');
            return $this->redirect(Yii::$app->request->referrer);
        }
        if(Yii::$app->request->isAjax){
            return $this->renderAjax('update', [
                'model' => $model,
                'filePath' => $filePath
            ]);
        }else{
            return $this->render('update', [
                'model' => $model,
                'filePath' => $filePath
            ]);
        }
    }

    /**
     * Deletes an existing Topic model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        // return $this->redirect(['index']);
        \Yii::$app->getSession()->setFlash('success', 'You have successfully deleted the record.');
        return $this->redirect(Yii::$app->request->referrer);
    }

    /**
     * Finds the Topic model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Topic the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Topic::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
