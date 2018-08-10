<?php
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = 'E-Learning Class';
?>
<div class="site-index">

	<div class="jumbotron">
        <h1>Welcome to E-Learning Class!</h1>

        <p class="lead">Build your knowledge for the success of your future.</p>

        
    </div>

    <div class="body-content jumbotron">
    		<?= Html::a('Click me to Login', ['/user/login'], ['class' => 'btn btn-success']) ?>
    </div>

    
</div>
