<?php

namespace common\modules\cms\models;

use Yii;

/**
 * This is the model class for table "student".
 *
 * @property int $id
 * @property string $ln
 * @property string $fn
 * @property string $mn
 * @property int $cr_id
 *
 * @property Quiz[] $quizzes
 * @property CrCode $cr
 */
class Student extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'student';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ln', 'fn', 'cr_id'], 'required'],
            [['cr_id'], 'safe'],
            [['ln', 'fn', 'mn'], 'string', 'max' => 45],
            [['cr_id'], 'exist', 'skipOnError' => true, 'targetClass' => ClassroomCode::className(), 'targetAttribute' => ['cr_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ln' => 'Lastname',
            'fn' => 'Firstname',
            'mn' => 'Middlename',
            'cr_id' => 'Classroom Code',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getQuizzes()
    {
        return $this->hasMany(Quiz::className(), ['stud_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCr()
    {
        return $this->hasOne(ClassroomCode::className(), ['id' => 'cr_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFullName()
    {
        return $this->fn." ".$this->ln;
    }
}
