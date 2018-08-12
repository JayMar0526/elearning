<?php

namespace common\modules\cms\models;

use Yii;

/**
 * This is the model class for table "question_choices".
 *
 * @property int $id
 * @property int $question_id
 * @property string $choice
 * @property int $order
 *
 * @property Questions $question
 */
class QuestionChoices extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'question_choices';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['question_id', 'choice'], 'required'],
            [['question_id', 'order'], 'integer'],
            [['choice'], 'string', 'max' => 255],
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
            'question_id' => 'Question ID',
            'choice' => 'Choice',
            'order' => 'Order',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuestion()
    {
        return $this->hasOne(Questions::className(), ['id' => 'question_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getChoices($id)
    {
        $query = QuestionChoices::find()->where(['question_id' => $id])->all();
        return $query;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getImage($id)
    {
        $query = Questions::find()->where(['id' => $id])->one();
        return $query;
    }


}
