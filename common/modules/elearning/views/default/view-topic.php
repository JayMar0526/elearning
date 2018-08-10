<?php
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = 'E-Learning Class';
?>
<?php $this->beginContent('@common/modules/elearning/views/default/_sidebar.php', ['categories' => $categories, 'lesson' => $lesson]) ?>
<div class="elearning-default-index">

    <div class="body-content">
	        	<div class='col-md-12'>
	        		<span class='pull-left'><?= Html::img($model->files[0]->url,['width' => '150', 'height' => '150'], ['alt'=>'Lesson'])?></span>

	        		<p class="ribbon" style="font-size: 20px !important;">
		               <strong class="ribbon-content"><?= $model->title ?></strong>
		            </p>
        		 	<p> <?= nl2br($model->instruction) ?></p>

				<div>

    </div><!-- End of body content -->
</div> 
<?php $this->endContent() ?>