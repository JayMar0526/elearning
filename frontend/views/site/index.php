<?php
use yii\helpers\Html;
/* @var $this yii\web\View */

$this->title = Yii::$app->name;
?>
<div class="site-index">

	<div class="jumbotron">
        <h1>Welcome to <?= $this->title ?></h1>

        <p class="lead">Build your knowledge for the success of your future.</p>

        
    </div>

    <div class="body-content jumbotron">
    		<?= Html::a('Click me to Login', ['/user/login'], ['class' => 'btn btn-success']) ?>
    </div>

    
</div>
