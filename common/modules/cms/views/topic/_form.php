<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \file\components\AttachmentsInput;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use common\modules\cms\models\LessonCategory;

/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Topic */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="topic-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?php //$form->field($model, 'lesson_id')->textInput() ?>

    <?= $form->field($model, 'category_id')->widget(Select2::classname(), [
            'data' => ArrayHelper::map(LessonCategory::find()->all(), 'id', 'title'),
            'options' => ['placeholder' => '    Nothing Selected   ',
            'multiple' => false,
            'class'=>'category-select'],
            'pluginOptions' => [
                'allowClear' => true
            ],
        ])->label('Kategorya');
    ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'passing_grade')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'instruction')->textarea(['rows' => 6]) ?>


    <?php
    echo '<label>Upload Image (Only jpeg, png and gif format acceptable)</label>';
    echo AttachmentsInput::widget([
            'id' => 'file-input', // Optional
            'model' => $model,
            'options' => [ // Options of the Kartik's FileInput widget
                'multiple' => false, // If you want to allow multiple upload, default to false
            ],
            'pluginOptions' => [ // Plugin options of the Kartik's FileInput widget 
                'maxFileCount' => 1, // Client max files
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
