<?php
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="site-index">

	<div class="jumbotron">
        <h1>Welcome to E-Learning Class!</h1>

        <p class="lead">Build your knowledge for the success of your future.</p>

        
    </div>

    <div class="body-content jumbotron">
    		<?= Html::a('I\'m a teacher', ['/user/login'], ['class' => 'btn btn-success']) ?> <?= Html::a('I\'m a student', ['/site/student-login'], ['class' => 'btn btn-success']) ?>
    </div>

    
</div>
