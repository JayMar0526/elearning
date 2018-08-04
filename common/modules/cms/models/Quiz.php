<?php

namespace common\modules\cms\models;

use Yii;

/**
 * This is the model class for table "quiz".
 *
 * @property int $id
 * @property int $stud_id
 * @property int $topic_id
 * @property string $date_taken
 *
 * @property Student $stud
 * @property Topic $topic
 * @property StudAnswers[] $studAnswers
 */
class Quiz extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'quiz';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['stud_id', 'topic_id', 'date_taken'], 'required'],
            [['stud_id', 'topic_id'], 'integer'],
            [['date_taken'], 'safe'],
            [['stud_id'], 'exist', 'skipOnError' => true, 'targetClass' => Student::className(), 'targetAttribute' => ['stud_id' => 'id']],
            [['topic_id'], 'exist', 'skipOnError' => true, 'targetClass' => Topic::className(), 'targetAttribute' => ['topic_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'stud_id' => 'Stud ID',
            'topic_id' => 'Topic ID',
            'date_taken' => 'Date Taken',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStud()
    {
        return $this->hasOne(Student::className(), ['id' => 'stud_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTopic()
    {
        return $this->hasOne(Topic::className(), ['id' => 'topic_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudAnswers()
    {
        return $this->hasMany(StudAnswers::className(), ['quiz_id' => 'id']);
    }
}
