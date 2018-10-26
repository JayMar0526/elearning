<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */

$this->title = Yii::$app->name;

?>
<div class="elearning-default-post-exam">

    <div class="body-content">

	 	<?php $form = ActiveForm::begin(['id' => 'my-form',]); ?>
			 <div class="row">
			 	<div class='col-md-12'>
				 	<label> Ilagay ang <i>Code</i> para mabuksan ang pagsusulit : </label>
				 	<?= Html::passwordInput('code', null, ['class' => 'w3-input w3-border', 'required' => true]); ?>
				</div>
				<br><br>
				<div class="col-md-12 text-right">
					<?= Html::submitButton('i-submit', ['class' => 'btn btn-success']) ?>
			    </div>
			</div>
		<?php ActiveForm::end(); ?>

    </div><!-- End of body content -->
</div>
