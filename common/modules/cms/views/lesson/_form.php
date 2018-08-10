<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\tinymce\TinyMce;
use \file\components\AttachmentsInput;

/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Lesson */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lesson-form">
<div class="panel panel-default">
  <div class="panel-body">
    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>
        <?= $form->field($model, 'purpose')->textArea(['rows' => 6]) ?>


        <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

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
</div>
    

</div>
<?php

$this->registerJs(
    '$("document").ready(function(){
    	var count = $("#input-id").fileinput("getFilesCount");
		console.log(count);
    })'
	);

?>
