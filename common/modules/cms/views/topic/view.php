<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use himiklab\thumbnail\EasyThumbnailImage;
/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Topic */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Topics', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="topic-view">
    <p class="<?= Yii::$app->request->isAjax ? "hidden" : "" ?>">
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
    <div class='table-responsive'>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            'passing_grade',
            [
                'label' => 'Panuto',
                'value' => function($model){
                    return nl2br($model->instruction);
                },
                'format' => 'raw'
            ],
            [
                'label' => 'Images Uploaded',
                'value' => function($model){
                    $return = '';
                    foreach($model->files as $file){
                         $return .= '<image src='.$file->url.' style="min-width: 100px; max-width:400px; min-height:50px; max-height:100px;">';
                    }
                    return $return;
                },
                'format' => 'raw'
            ],
        ],
    ]) ?>

    </div>

</div>
