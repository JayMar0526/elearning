<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\modules\cms\models\QuestionChoices as QC;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */

$this->title = 'E-Learning Class';
?>
<?php $this->beginContent('@common/modules/elearning/views/default/_sidebar.php', ['categories' => $categories, 'lesson' => $lesson]) ?>
<div class="elearning-default-index">

    <div class="body-content">

	        	<div class='col-md-12'>
	        		<?= empty($model->files[0]->url) ? Html::img($model->lessonCategory->files[0]->url,['width' => '160', 'height' => '130', 'class' => 'pull-right'], ['alt'=>'Lesson']) : Html::img($model->files[0]->url,['width' => '130', 'height' => '130', 'class' => 'pull-right w3-circle'], ['alt'=>'Lesson'])?>
        		 	<div class="w3-panel-12 w3-round-xxlarge w3-teal w3-center-align" style="font-size: 30pt; text-align: center; text-shadow:4px 4px 0 #444; width: 95%; margin-top: 3%; position: initial;">
        		 		<?= $model->title ?>
        		 	</div>
        		 	<br>
	        		<?= nl2br($model->instruction) ?>
	        	
    		 	</div>


        		 	<!--======================================================== Active form ================================================-->
    		 	<div class='col-md-10 col-md-offset-1 bg-info'>

        		 	<?php $form = ActiveForm::begin(); ?>
        		 	<p>
        		 	<table class='table table-bordered table-condensed table-hover' style='font-size: 18pt; margin: 0 auto;'>

        		 	<?php
        		 		if($datas) {
	        		 		foreach($datas as $data) {
	        		?>
	        		 	<tr>
	        		 		<?= $form->field($datas[$data->question_id], '['.$data->question_id.']quiz_id')->hiddenInput(['value' => $data->quiz_id],['id' => $data->question_id])->label(false)?>
	        		 		<?= $form->field($datas[$data->question_id], '['.$data->question_id.']question_id')->hiddenInput(['value' => $data->question_id],['id' => $data->question_id])->label(false)?>
	        		 		<th style="text-align: justify;"><?= $datas[$data->question_id]->qtitle; ?></th>

	        		 		<?php 
	        		 			$choices = QC::getChoices($data->question_id);
	        		 			$choices = ArrayHelper::map($choices, 'id', 'choice');
        		 				if($data->qtype == 1){
        		 					echo '<th>'.$form->field($datas[$data->question_id], '['.$data->question_id.']answer')->textInput()->label(false).'</th>';
        		 				} elseif ($data->qtype == 2) {
        		 					# code...
        		 				} else {
        		 					echo '<th>'.$form->field($datas[$data->question_id], '['.$data->question_id.']answer')->radioList($choices)->label(false).'</th>';
        		 				}
		        		 		
	        		 		?>

	        		 	</tr>
	        		<?php
	        		 		} /* End foreach $datas */
        		 		} /* End if statement of $datas */
        		 	?>
	        		</table>
		        	</p>
	        		<div class="form-group text-right">
				        <?= Html::submitButton('i-submit', ['class' => 'btn btn-lg btn-success']) ?>
				    </div>

	        		<?php ActiveForm::end(); ?>
	        	</div>

	        		<!--======================================================== End Active form ================================================-->
				
	        		<?php // empty($model->lessonCategory->files[0]->url) ? '' : Html::img($model->lessonCategory->files[0]->url,['width' => '20%', 'height' => '100', 'class' => 'pull-left'], ['alt'=>'Lesson'])?>
        		 	
				

    </div><!-- End of body content -->
</div> 
<?php $this->endContent() ?>
<?php

$this->registerJs('
	$("input:radio").addClass("w3-radio");
');
?>