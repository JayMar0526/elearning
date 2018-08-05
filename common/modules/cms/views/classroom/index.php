<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\cms\models\ClassroomCodeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Classroom Codes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="classroom-code-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Classroom Code', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'code',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete}',
                'buttons'=>[
                    'view' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'view students'), Yii::$app->urlManager->createUrl(['/cms/classroom/view', 'id' => $model->id]), ['title' => Yii::t('yii', 'View Students'), 'class' => 'btn btn-primary btn-xs']);
                            },
                    'update' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'edit'), Yii::$app->urlManager->createUrl(['/cms/classroom/update', 'id' => $model->id]), ['title' => Yii::t('yii', 'Edit Lesson'), 'class' => 'btn btn-primary btn-xs']);
                            },
                    'delete' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'delete'), Yii::$app->urlManager->createUrl(['/cms/classroom/delete?id='.$model->id]), ['title' => Yii::t('yii', 'Delete'), 'class' => 'btn btn-danger btn-flat btn-xs ',
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
    <?php Pjax::end(); ?>
</div>
