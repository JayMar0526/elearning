<?php

namespace common\modules\cms\models;

use Yii;

/**
 * This is the model class for table "cr_code".
 *
 * @property int $id
 * @property string $code
 *
 * @property Student[] $students
 */
class ClassroomCode extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'cr_code';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code'], 'required'],
            [['code'], 'string', 'max' => 45],
            [['code'], 'unique'],
            [['user_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'code' => 'Code',
            'user_id' => 'User',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudents()
    {
        return $this->hasMany(Student::className(), ['cr_id' => 'id']);
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if($insert){
                $this->user_id = Yii::$app->user->id;
            }
            return true;            
        }
        return false;
    }
}
