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
            [['lesson_id', 'title', 'instruction'], 'required'],
            [['lesson_id'], 'integer'],
            [['instruction'], 'string'],
            [['title'], 'string', 'max' => 255],
            [['passing_grade'], 'string', 'max' => 45],
            [['lesson_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lessons::className(), 'targetAttribute' => ['lesson_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'lesson_id' => 'Lesson ID',
            'title' => 'Title',
            'passing_grade' => 'Passing Grade',
            'instruction' => 'Instruction',
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
        return $this->hasOne(Lessons::className(), ['id' => 'lesson_id']);
    }
}
