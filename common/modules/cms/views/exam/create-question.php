<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\modules\cms\models\Unit;
use kartik\select2\Select2;
use wbraganca\dynamicform\DynamicFormWidget;
use \file\components\AttachmentsInput;


/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Questions */
/* @var $form yii\widgets\ActiveForm */

$js = '
jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        jQuery(this).html("#: " + (index + 1))
    });
});

jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .panel-title-address").each(function(index) {
        jQuery(this).html("#: " + (index + 1))
    });
});
';

$this->registerJs($js);
?>

<div class="questions-form">
	<div class="panel panel-default">
	  <div class="panel-body">



	  
	    <?php $form = ActiveForm::begin(['id' => 'dynamic-form']); ?>

	    <?php //$form->field($model, 'topic_id')->textInput() ?>

	    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

	    <?php
	    echo '<label>Image Question (Only jpeg, png and gif format acceptable)</label>';
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

	    <?php //$form->field($model, 'ans')->textInput(['maxlength' => true]) ?>

	    <?= $form->field($model, 'unit_id')->widget(Select2::classname(), [
	            'data' => ArrayHelper::map(Unit::find()->all(), 'id', 'unit'),
	            'options' => ['placeholder' => '    Nothing Selected   ',
	            'multiple' => false,
	            'class'=>'unit-select'],
	            'pluginOptions' => [
	                'allowClear' => true
	            ],
	        ])->label('Type of Question');
	    ?>

	    <div class="padding-v-md">
	        <div class="line line-dashed"></div>
	    </div>
	    <?php DynamicFormWidget::begin([
	        'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
	        'widgetBody' => '.container-items', // required: css class selector
	        'widgetItem' => '.item', // required: css class
	        'limit' => 10, // the maximum times, an element can be cloned (default 999)
	        'min' => 0, // 0 or 1 (default 1)
	        'insertButton' => '.add-item', // css class
	        'deleteButton' => '.remove-item', // css class
	        'model' => $modelsChoices[0],
	        'formId' => 'dynamic-form',
	        'formFields' => [
	            'choice',
	        ],
	    ]); ?>
	    <div class="panel panel-default">
	        <div class="panel-heading">
	        	<b>Choices</b> <i class='text-red'>(Maximum of 10 choices per question)</i>
	            <button type="button" class="pull-right add-item btn btn-success btn-xs"><i class="fa fa-plus"></i> Add Choices</button>
	        </div>
	        <div class="container-items"><!-- widgetContainer -->
	            <?php foreach ($modelsChoices as $index => $modelsChoice): ?>
	                   
	                        <?php
	                            // necessary for update action.
	                            if (!$modelsChoice->isNewRecord) {
	                                echo Html::activeHiddenInput($modelsChoice, "[{$index}]id");
	                            }
	                        ?>
	                        <table class="table item text-center">
	                        	<tr>
	                        		<td>
	                        			 <span class="panel-title-address">Address: <?= ($index + 1) ?></span>
	                        		</td>
	                        		<td>
	                        			<?= $form->field($modelsChoice, "[{$index}]choice")->textInput(['maxlength' => true, 'class' => 'form-control input-sm'])->label(false) ?>
	                        		</td>
	                        		<td>
	                        			<button type="button" class="remove-item btn btn-danger btn-sm">remove</button>
	                        		</td>
	                        	</tr>
	                        </table>
	                    
	            <?php endforeach; ?>
	        </div>
	    </div>
	    <?php DynamicFormWidget::end(); ?>

	    <div class="form-group">
	        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
	    </div>

	    <?php ActiveForm::end(); ?>
		</div>
	</div>
</div>
