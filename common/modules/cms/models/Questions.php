<?php

namespace common\modules\cms\models;

use Yii;

/**
 * This is the model class for table "questions".
 *
 * @property int $id
 * @property int $topic_id
 * @property string $title
 * @property string $ans
 * @property int $unit_id
 *
 * @property QuestionChoices[] $questionChoices
 * @property Topic $topic
 * @property Unit $unit
 * @property StudAnswers[] $studAnswers
 */
class Questions extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'questions';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['topic_id', 'title', 'unit_id'], 'required'],
            [['topic_id', 'unit_id'], 'integer'],
            [['title', 'ans'], 'string', 'max' => 255],
            [['topic_id'], 'exist', 'skipOnError' => true, 'targetClass' => Topic::className(), 'targetAttribute' => ['topic_id' => 'id']],
            [['unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => Unit::className(), 'targetAttribute' => ['unit_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'topic_id' => 'Topic ID',
            'title' => 'Title',
            'ans' => 'Ans',
            'unit_id' => 'Unit ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestionChoices()
    {
        return $this->hasMany(QuestionChoices::className(), ['question_id' => 'id']);
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
    public function getUnit()
    {
        return $this->hasOne(Unit::className(), ['id' => 'unit_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudAnswers()
    {
        return $this->hasMany(StudAnswers::className(), ['question_id' => 'id']);
    }
}
