<?php
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = 'E-Learning Class';
?>
<div class="elearning-default-index">

    <div class="body-content">
	        <div class="row">
	        	<?php foreach($lessons as $lesson){ ?>
	        	<div class="col-md-3 col-sm-7 padleft-right">
					<div class="hover01 column">
		              	<div>
		              		<figure>
							    <?= Html::img($lesson->files[0]->url,[]); ?>
							    
							</figure>
							<span><?= $lesson->title?></span>
						</div>
	            	</div>
	            </div>
	              <?php } ?>
	        </div> <!-- End row -->
    </div><!-- End of body content -->
</div> 