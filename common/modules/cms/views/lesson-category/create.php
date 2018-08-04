<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\modules\cms\models\LessonCategory */

$this->title = 'Create Lesson Category';
$this->params['breadcrumbs'][] = ['label' => 'Lesson Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lesson-category-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
