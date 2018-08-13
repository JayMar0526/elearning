<?php

namespace common\modules\cms\models;

use Yii;
use yii\helpers\Html;

/**
 * This is the model class for table "topic".
 *
 * @property int $id
 * @property int $lesson_id
 * @property string $title
 * @property string $passing_grade
 * @property string $instruction
 *
 * @property Questions[] $questions
 * @property Quiz[] $quizzes
 * @property Lessons $lesson
 */
class Topic extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'topic';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lesson_id', 'instruction'], 'required'],
            [['lesson_id', 'category_id', 'passing_grade'], 'integer'],
            [['instruction'], 'string'],
            [['title'], 'string', 'max' => 255],
            [['lesson_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lesson::className(), 'targetAttribute' => ['lesson_id' => 'id']],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => LessonCategory::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'category_id' => 'Category',
            'lesson_id' => 'Lesson ID',
            'title' => 'Title',
            'passing_grade' => 'Passing Grade',
            'instruction' => 'Description/Panuto',
        ];
    }

    public function behaviors()
    {
        return [
            'fileBehavior' => [
                'class' => \file\behaviors\FileBehavior::className()
            ]
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestions()
    {
        return $this->hasMany(Questions::className(), ['topic_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizzes()
    {
        return $this->hasMany(Quiz::className(), ['topic_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLesson()
    {
        return $this->hasOne(Lesson::className(), ['id' => 'lesson_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLessonCategory()
    {
        return $this->hasOne(LessonCategory::className(), ['id' => 'category_id']);
    }

    public function getMessage($score, $passing_grade){

        if($score >= $passing_grade){
            $message = '<br>
             <div class="col-md-10 col-md-offset-1 alert alert-dismissable" style="background:#3ce2fc;">
             <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
             <div class="col-md-3">'.
             Html::img('@web/image/gif3.gif',['width' => 200, 'height'=>140]).
             '
             </div>
             <div class="col-md-9 pull-right" style="text-align:center;"><font style="font-family:ravie; font-size:30px; text-shadow:1px 1px #fff;">Score : '.$score.'/'.count($this->questions).'<br>CONGRATULATIONS</font></div>
             </div>';
        } else {
            $message= '<br>
             <div class="col-md-10 col-md-offset-1 alert alert-dismissable" style="background:#f46977;">
             <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
             <div class="col-md-3">'.
             Html::img('@web/image/nexttime.gif',['width' => 200, 'height'=>140]).
             '
             </div>
             <div class="col-md-9 pull-right" style="text-align:center;"><font style="font-family:ravie; font-size:30px; text-shadow:1px 1px #fff;">Score : '.$score.'/'.count($this->questions).'<br>PLEASE DO BETTER NEXT TIME.</font></div>
             </div>';
        }

        return $message;
    }
}
