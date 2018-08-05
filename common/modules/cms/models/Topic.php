<?php

namespace common\modules\cms\models;

use Yii;

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
}
