<?php

namespace common\modules\cms\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\modules\cms\models\ClassroomCode;

/**
 * ClassroomCodeSearch represents the model behind the search form of `common\modules\cms\models\ClassroomCode`.
 */
class ClassroomCodeSearch extends ClassroomCode
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'user_id'], 'integer'],
            [['code'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = ClassroomCode::find();
        if(Yii::$app->user->can('Teacher')){
            $query->andFilterWhere(['user_id' => Yii::$app->user->id]);
        }

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code]);

        return $dataProvider;
    }
}
