<?php

namespace common\modules\cms\models;

use Yii;

/**
 * This is the model class for table "stud_answers".
 *
 * @property int $id
 * @property int $quiz_id
 * @property int $question_id
 * @property string $answer
 *
 * @property Quiz $quiz
 * @property Questions $question
 */
class QuizAnswers extends \yii\db\ActiveRecord
{
    public $qtitle;
    public $qtype;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'stud_answers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['quiz_id', 'question_id'], 'required'],
            [['quiz_id', 'question_id'], 'integer'],
            [['answer'], 'string', 'max' => 45],
            [['quiz_id'], 'exist', 'skipOnError' => true, 'targetClass' => Quiz::className(), 'targetAttribute' => ['quiz_id' => 'id']],
            [['question_id'], 'exist', 'skipOnError' => true, 'targetClass' => Questions::className(), 'targetAttribute' => ['question_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'quiz_id' => 'Quiz ID',
            'question_id' => 'Question ID',
            'answer' => 'Answer',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuiz()
    {
        return $this->hasOne(Quiz::className(), ['id' => 'quiz_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestion()
    {
        return $this->hasOne(Questions::className(), ['id' => 'question_id']);
    }
}
