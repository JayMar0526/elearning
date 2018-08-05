<?php

namespace common\modules\elearning\controllers;

use Yii;
use common\modules\cms\models\Lesson;
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
                       
                        'allow' => Yii::$app->session->get('studId'),
                        'roles' => ['@'],
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
                return $this->redirect('elearning/default/home');
            }else{
                \Yii::$app->getSession()->setFlash('danger', 'The student is not exist.');
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
        $lessons = Lesson::find()->all();
        // echo Yii::$app->session->get('studId'); exit;
        return $this->render('home', ['lessons' => $lessons]);
    }
}
