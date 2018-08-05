<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use himiklab\thumbnail\EasyThumbnailImage;

/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Questions */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Questions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="questions-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'title',
            [
                'label' => 'Image Question',
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
            ],
            [
                'label' => 'Answer',
                'value' => function($model){
                    return $model->answer->choice;
                }
            ],
            'answer.choice',
            'unit.unit',
            [
                'label' => 'Choices',
                'value' => function($model){
                    $return = '';
                    $return .= '<ul>';
                    foreach ($model->questionChoices as $key => $choice) {
                        $return .= '<li>'.$choice->choice.'</li>';
                    }
                    $return .= '</ul>';

                    return $return;
                },
                'format' => 'raw'
            ],
            
        ],
    ]) ?>

</div>
