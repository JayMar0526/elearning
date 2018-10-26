<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\Url;
use yii\bootstrap\Modal;
use frontend\assets\AppAsset;

frontend\assets\AppAsset::register($this);
/* @var $this yii\web\View */
/* @var $searchModel common\modules\cms\modelsQuestionsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Questions';
$this->params['breadcrumbs'][] = ['label' => 'Lessons', 'url' => ['/cms/lesson']];
$this->params['breadcrumbs'][] = ['label' => $modelTopic->lesson->title, 'url' => ['/cms/lesson/view', 'id' => $modelTopic->lesson_id]];
$this->params['breadcrumbs'][] = ['label' => $modelTopic->title, 'url' => ['/cms/lesson/view', 'id' => $modelTopic->lesson_id]];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="questions-index">
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

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?= $this->render('create-question', ['model' => $model, 'modelsChoices' => $modelsChoices]); ?>
<div class="panel panel-default">
  <div class="panel-body">
    <div class="table-responsive">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'title',
            [
                'label' => 'Image Question',
                'value' => function($model){
                    return ($model->files) ? HtmL::img($model->files[0]->url) : 'no image';
                },
                'format' => 'raw'
            ],
            'unit.unit',
            [
                'label' => 'Choices',
                'value' => function($model){
                    $return = '';
                    $return .= '<ul>';
                    foreach ($model->questionChoices as $key => $choice) {
                        $return .= '<li>'.$choice->choice.'</li>';
                    }
                    $return .= '</ul>';

                    return $return;
                },
                'format' => 'raw'
            ],

            [
                'label' => 'Answer',
                'value' => function($model){
                    $result = '';
                    if($model->unit_id != 1){
                        if(!empty($model->ans)){
                            $result = $model->answer->choice;
                        }
                    }else{
                        $result = $model->ans;
                    }
                    return $result;
                }
            ],

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{answer} {view} {update} {delete}',
                'buttons'=>[
                    'view' => function ($url, $model) {
                                return Html::button('view', ['value'=>Url::to(['/cms/exam/view-question', 'id' => $model->id]), 'class' => 'btn btn-xs btn-primary btn-flat modalButton']);
                            },

                    'update' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'update'), Yii::$app->urlManager->createUrl(['/cms/exam/update-exam?id='.$model->id]), ['title' => Yii::t('yii', 'update'), 'class' => 'btn btn-primary btn-flat btn-xs ']);
                            },

                    'delete' => function ($url, $model) {
                                return Html::a(Yii::t('yii', 'delete'), Yii::$app->urlManager->createUrl(['/cms/exam/delete?id='.$model->id]), ['title' => Yii::t('yii', 'Delete'), 'class' => 'btn btn-danger btn-flat btn-xs ',
                                        'data' => [
                                        'confirm' => 'Are you sure you want to delete this project?',
                                        'method' => 'post',
                                    ]]);
                            },
                    'answer' => function ($url, $model) {
                                return Html::button(empty($model->ans) ? 'add answer' : 'update answer', ['value'=>Url::to(['/cms/exam/question-answer', 'id' => $model->id]), 'class' => empty($model->ans) ? 'btn btn-xs btn-warning btn-flat modalButton' :  'btn btn-xs btn-info btn-flat modalButton']);
                            },
                    ],
                    'contentOptions' => ['width' => '100px']

            ]
        ],
    ]); ?>
</div>
  </div>
</div>
    
    <?php Pjax::end(); ?>
</div>
