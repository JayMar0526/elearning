<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\Questions */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="questions-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
    	if($model->unit_id != 1){
    		echo $form->field($model, 'ans')->widget(Select2::classname(), [
	            'data' => $choices,
	            'options' => ['placeholder' => '    Nothing Selected   ',
	            'multiple' => false,
	            'class'=>'ans-select'],
	            'pluginOptions' => [
	                'allowClear' => true
	            ],
	        ]);
	    }else{
    		echo $form->field($model, 'ans')->textInput(['maxlength' => true]);
    	}
    ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
