<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\cms\models\LessonSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lessons';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lesson-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
<div class="panel panel-default">
  <div class="panel-body">
    <p>
        <?= Html::a('Create Lesson', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <div class='table-responsive'>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'title',
            'code',

            // ['class' => 'yii\grid\ActionColumn'],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete}',
                'buttons'=>[
                    'view' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'view topics'), Yii::$app->urlManager->createUrl(['/cms/lesson/view', 'id' => $model->id]), ['title' => Yii::t('yii', 'View Topics'), 'class' => 'btn btn-primary btn-xs']);
                            },
                    'update' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'edit lesson'), Yii::$app->urlManager->createUrl(['/cms/lesson/update', 'id' => $model->id]), ['title' => Yii::t('yii', 'Edit Lesson'), 'class' => 'btn btn-primary btn-xs']);
                            },
                    'delete' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'delete'), Yii::$app->urlManager->createUrl(['/cms/lesson/delete?id='.$model->id]), ['title' => Yii::t('yii', 'Delete'), 'class' => 'btn btn-danger btn-flat btn-xs ',
                                        'data' => [
                                        'confirm' => 'Are you sure you want to delete this project?',
                                        'method' => 'post',
                                    ]]);
                            }
                    ],
                'contentOptions'=>['style'=>'width:100px;'],
            ],
        ],
    ]); ?>
    </div>
  </div>
</div>
    
    <?php Pjax::end(); ?>
</div>
