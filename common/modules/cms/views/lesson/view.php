<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use himiklab\thumbnail\EasyThumbnailImage;
use frontend\assets\AppAsset;

frontend\assets\AppAsset::register($this);
/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Lesson */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Lessons', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lesson-view">
<?php 
        Modal::begin([
            'header' => '<b>' . Yii::t('app', $this->title) . '</b>',
            'id'=>'modalView', 
            'size'=>'modal-lg',
            'clientOptions' => ['backdrop' => 'static', 'keyboard' => FALSE]
            ]);
        echo "<div id='modalContentView'></div>";
        Modal::end();
?>
    
<div class="panel panel-default">
  <h1><?= Html::encode($this->title) ?></h1>
  <div class="panel-body">
    <p>
        <?= Html::a('Update Lesson', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete Lesson', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
        <?= Html::button('Add New Topic', ['value'=>Url::to(['/cms/topic/create-topic', 'id' => $model->id]), 'class' => 'btn btn-success modalButton']); ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'code',
            'title',
            [
                'attribute' => 'purpose',
                'format' => 'raw',
            ],
            [
                'label' => 'Image',
                'value' => function($model){
                    foreach($model->files as $file){
                        return EasyThumbnailImage::thumbnailImg(
                            $file->path,
                            100,
                            100,
                            EasyThumbnailImage::THUMBNAIL_OUTBOUND,
                            ['alt' => $file->name]
                        );
                    }
                },
                'format' => 'raw'
            ]
        ],
    ]) ?>

    <div class="row">
    <h1>Mga Talakayin</h1>
        <div class='col-md-12'>
            <div class="table-responsive">
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    [
                        'label' => 'Lesson Category',
                        'value' => function($model){
                            return $model->lessonCategory->title;
                        },
                        'format' => 'raw'
                    ],
                    'title',
                    'passing_grade',
                    // 'instruction:ntext',


                    [
                        'class' => 'yii\grid\ActionColumn',
                        'template' => '{view} {update} {delete} {exam}',
                        'buttons'=>[
                            'view' => function ($url, $model) {
                                        return Html::button('view', ['value'=>Url::to(['/cms/topic/view', 'id' => $model->id]), 'class' => 'btn btn-xs btn-primary btn-flat modalButton']);
                                    },
                            'update' => function ($url, $model) {
                                        return Html::button('edit', ['value'=>Url::to(['/cms/topic/update', 'id' => $model->id]), 'class' => 'btn btn-xs btn-primary btn-flat modalButton']);
                                    },
                            'delete' => function ($url, $model) {
                                        return Html::a(Yii::t('yii', 'delete'), Yii::$app->urlManager->createUrl(['/cms/topic/delete?id='.$model->id]), ['title' => Yii::t('yii', 'Delete'), 'class' => 'btn btn-danger btn-flat btn-xs ',
                                                'data' => [
                                                'confirm' => 'Are you sure you want to delete this project?',
                                                'method' => 'post',
                                            ]]);
                                    },
                            'exam' => function ($url, $model) {
                                        return Html::a(empty($model->questions) ? 'create exam' : 'view exam', ['/cms/exam/create-exam', 'id' => $model->id], ['class' => empty($model->questions) ? 'btn btn-warning btn-xs' : 'btn btn-info btn-xs']);
                                    },
                            ]
                    ]],
            ]); ?>
            </div>
        </div>
    </div>
  </div>
</div>
    
    
    

</div>
