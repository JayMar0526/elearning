<?php
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = 'E-Learning Class';
?>
<?php $this->beginContent('@common/modules/elearning/views/default/_sidebar.php', ['categories' => $categories, 'lesson' => $lesson]) ?>
<div class="elearning-default-index">

    <div class="body-content">
	        <div class="row">
	        	<div class='col-md-12'>
		        	<?= nl2br($lesson->purpose) ?>
		        	<p class='text-center'>
				        <?= Html::img($lesson->files[0]->url,['width' => '350px', 'height' => '350px'], ['alt'=>'Lesson']) ?>
				    </p>
				<div>

	        </div> <!-- End row -->
    </div><!-- End of body content -->
</div> 
<?php $this->endContent() ?>