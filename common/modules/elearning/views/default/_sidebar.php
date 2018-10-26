<?php

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\web\View;
use common\modules\cms\models\Topic;
use common\modules\cms\models\Quiz;
use yii\bootstrap\Modal;
use yii\helpers\Url;

/**
 * @var View 	$this
 * @var string 	$content
 */

$this->title = $lesson->title;

$menuItems[] = ['label' => '<h4 class="text-center"><i class="glyphicon glyphicon-home"></i> HOME</h4>', 'url' => ['/elearning/default/home'], 'options' => ['style' => 'background-color: #c4c4c4']];
foreach($categories as $category){
    $menuItems[] = ['label' => '<strong>'.$category->lessonCategory->title.'</strong>', 'options' => ['style' => 'background-color: #c9ddff']];

    $topics = Topic::find()->where(['lesson_id' => $category->lesson_id, 'category_id' => $category->category_id])->orderBy(['sort' => SORT_ASC])->all();
    foreach($topics as $topic){
        
        if($topic->sort == 2){
            $modelQuiz = Quiz::find()->where(['topic_id' => $topic->id, 'stud_id' => Yii::$app->session->get('studId')])->all();
            if($modelQuiz){
                $menuItems[] = ['label' => '<ul><li>'.$topic->title.'</li></ul>', 'url' => ['/elearning/default/view-topic', 'id' => $topic->id]];
            } else {
                // $menuItems[] = ['label' => '<ul><li>'.$topic->title.'</li></ul>', 'url' => ['/elearning/default/view-topic', 'id' => $topic->id]];
                $menuItems[] = '&nbsp;'.Html::button('<ul><li>'.$topic->title.'</li></ul>', ['value'=>Url::to(['/elearning/default/post-exam', 'id' => $topic->id]), 'class' => 'btn-link modalButton']);
            }
        }else{
            $menuItems[] = ['label' => '<ul><li>'.$topic->title.'</li></ul>', 'url' => ['/elearning/default/view-topic', 'id' => $topic->id]];
        }
        
    }

}

?>
<?php 
        Modal::begin([
            'header' => '<b>' . Yii::t('app', $this->title) . '</b>',
            'id'=>'modalView', 
            'size'=>'modal-lg',
            'clientOptions' => ['backdrop' => 'static', 'keyboard' => FALSE]
            ]);
        echo "<div id='modalContentView'></div>";
        Modal::end();
?>
<div class='row'>
    <h1 class="ribbon">
       <strong class="ribbon-content"><?= $this->title ?></strong>
    </h1>
</div>

<div class="row">
    <div class="col-md-3">
        <div class="panel panel-default">
            <div class="panel-body">
                
                <?= Nav::widget([
                    'encodeLabels' => false,
                    'options' => ['class' => 'nav-pills nav-stacked',],
                    'items' => $menuItems,
                ]) ?>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="panel panel-default">
            <div class="panel-body">
                <?= $content ?>
            </div>
        </div>
    </div>
</div>
