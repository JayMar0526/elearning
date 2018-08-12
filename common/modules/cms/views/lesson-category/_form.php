<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \file\components\AttachmentsInput;

/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\LessonCategory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lesson-category-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?php
    echo '<label>Upload Image (Only jpeg, png and gif format acceptable)</label>';
    echo AttachmentsInput::widget([
            'id' => 'file-input', // Optional
            'model' => $model,
            'options' => [ // Options of the Kartik's FileInput widget
                'multiple' => false, // If you want to allow multiple upload, default to false
            ],
            'pluginOptions' => [ // Plugin options of the Kartik's FileInput widget 
                'maxFileCount' => 5, // Client max files
                // 'minFileCount' => 3, # Comment for a while
                'validateInitialCount' => true,
                'dropZoneEnabled' => false,
                'allowedFileExtensions'=> ['jpg', 'png', 'gif'],
                'showPreview' => true,
                'browseLabel' => 'Select file',
                'overwriteInitial' => false,
                'showUpload' => false,
                'showRemove' => false,
                'fileActionSettings' => [
                    'showUpload' => false,
                ],
            ]
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
