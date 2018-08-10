<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;
use yii\helpers\Url;
use yii\bootstrap\Modal;

use frontend\assets\AppAsset;

frontend\assets\AppAsset::register($this);

/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\ClassroomCode */

$this->title = $model->code;
$this->params['breadcrumbs'][] = ['label' => 'Classroom Codes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="classroom-code-view">
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
    <h1><?= Html::encode($this->title) ?></h1>
<div class="panel panel-default">
  <div class="panel-body">
    <p>
        <?= Html::a('Update Classroom', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete Classroom', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
        <?= Html::button('Add New Student', ['value'=>Url::to(['/cms/student/create-student', 'id' => $model->id]), 'class' => 'btn btn-success modalButton']); ?>
    </p>


    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'ln',
            'fn',
            'mn',

            // ['class' => 'yii\grid\ActionColumn'],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete}',
                'buttons'=>[
                    'view' => function ($url, $model) {
                                return Html::button('view', ['value'=>Url::to(['/cms/student/view', 'id' => $model->id]), 'class' => 'btn btn-xs btn-primary btn-flat modalButton']);
                            },
                    'update' => function ($url, $model) {
                                return Html::button('edit', ['value'=>Url::to(['/cms/student/update', 'id' => $model->id]), 'class' => 'btn btn-xs btn-primary btn-flat modalButton']);
                            },
                    'delete' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'delete'), Yii::$app->urlManager->createUrl(['/cms/student/delete?id='.$model->id]), ['title' => Yii::t('yii', 'Delete'), 'class' => 'btn btn-danger btn-flat btn-xs ',
                                        'data' => [
                                        'confirm' => 'Are you sure you want to delete this project?',
                                        'method' => 'post',
                                    ]]);
                            }
                    ]]
            ],
    ]); ?>
  </div>
</div>

    


</div>
