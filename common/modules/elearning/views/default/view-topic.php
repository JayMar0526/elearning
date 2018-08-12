<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\modules\cms\models\QuestionChoices as QC;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */

$this->title = 'E-Learning Class';

$opt = empty($qry) ? false : true ;

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

    			<?= Yii::$app->session->getFlash('msg') ?>

        		 	<!--======================================================== Active form ================================================-->
        		 <?php if($datas) { ?>
    		 	<div class='col-md-10 col-md-offset-1 bg-info'>

        		 	<?php $form = ActiveForm::begin(['id' => 'my-form',]); ?>
        		 	<p>
        		 	<table class='table table-bordered table-condensed table-hover' style='font-size: 18pt; margin: 0 auto;'>

        		 	<?php
        		 		
	        		 		foreach($datas as $data) {
	        		 			$choices = QC::getChoices($data->question_id);
	        		 			$image = QC::getImage($data->question_id);
	        		 			
	        		 			$image = empty($image->files[0]->url) ? '' :  Html::img($image->files[0]->url,[], ['alt'=>'Lesson']);
	        		?>
	        		 	<tr>
	        		 		<?= $form->field($datas[$data->question_id], '['.$data->question_id.']quiz_id')->hiddenInput(['value' => $data->quiz_id],['id' => $data->question_id])->label(false)?>
	        		 		<?= $form->field($datas[$data->question_id], '['.$data->question_id.']question_id')->hiddenInput(['value' => $data->question_id],['id' => $data->question_id])->label(false)?>

	        		 		<th style="text-align: justify;"><?= $datas[$data->question_id]->qtitle.' '.$image; ?></th>

							<th>
	        		 		<?php 
	        		 			$choices = ArrayHelper::map($choices, 'id', 'choice');
        		 				if($data->qtype == 1){
        		 					echo $form->field($datas[$data->question_id], '['.$data->question_id.']answer')->textInput(['disabled' => $opt, 'class' => 'form-control input-lg'])->label(false);
        		 				} elseif ($data->qtype == 2) {
        		 					# code...
        		 				} else {
        		 					echo $form->field($datas[$data->question_id], '['.$data->question_id.']answer')->radioList($choices,
        		 						[
                                      'itemOptions' => ['disabled' => $opt],
			                                'item' => function($index, $label, $name, $checked, $value) {

			                                    $return = '<label class="modal-radio">';
			                                    $return .= '<input type="radio" name="' . $name . '" value="' . $value . '" tabindex="3">';
			                                    $return .= '<i></i>';
			                                    $return .= '<span>' . $label . '</span>';
			                                    $return .= '</label>';

			                                    return $return;
			                                }
			                            ])->label(false);
        		 				}

		        		 		if($data->correct_answer == $data->answer) { 
		        		 			echo '<span class="text-success pull-right" style="position: relative; top:-60px;">&#10004;</span>'; 
		        		 		} else {
		        		 		 	echo '<span class="text-danger pull-right" style="position: relative; top:-60px;">&#x2716;</span>'; 
		        		 		} 
	        		 		?>
	        		 		</th>




	        		 	</tr>
	        		<?php
	        		 		} /* End foreach $datas */
        		 		
        		 	?>
	        		</table>
		        	</p>
	        		<div class="form-group text-right">
				        <?= empty($qry) ? Html::submitButton('i-submit', ['class' => 'btn btn-lg btn-success']) : "" ; ?>
				        
				    </div>

	        		<?php ActiveForm::end(); ?>

	        	</div>
	        	<?php } /* End if statement of $datas */ ?>

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
<style type="text/css">
img {
	min-width: 100px;
	max-width: auto;
	min-height: 100px;
	max-height: auto;

}
</style>