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

    <h1><?= Html::encode($this->title) ?></h1>

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

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            'passing_grade',
            'instruction:ntext',
            [
                'label' => 'Image',
                'value' => function($model){
                    $return = '';
                    foreach($model->files as $file){
                         $return .= $file->url.'<br>';
                    }
                    return $return;
                },
                'format' => 'raw'
            ]
        ],
    ]) ?>

</div>
