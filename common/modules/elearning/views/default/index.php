<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */

$this->title = 'E-Learning Class';
?>
<div class="elearning-default-index">
    <div class="jumbotron">
        <h1>Welcome to E-Learning!</h1>

        <p class="lead">Build your knowledge for the success of your future.</p>

        
    </div>

    <div class="body-content">
    	<div class="panel panel-default col-md-6 col-md-offset-3">
			<div class="panel-body">

					<?php $form = ActiveForm::begin(); ?>

					    <?= $form->field($model, 'cr_id')->textInput(['maxlength' => true, 'autocomplete' => 'off']) ?>

					    <?= $form->field($model, 'ln')->textInput(['maxlength' => true, 'autocomplete' => 'off']) ?>

					    <?= $form->field($model, 'fn')->textInput(['maxlength' => true, 'autocomplete' => 'off']) ?>
					    

					    <div class="form-group">
					        <?= Html::submitButton('Let me in', ['class' => 'btn btn-success']) ?>
					    </div>

					<?php ActiveForm::end(); ?>
			</div>
		</div>
    </div>
</div>
