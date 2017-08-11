<?php
namespace Turbo\MoneyManager\Models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use yii\db\Query;

/**
 * TransactionSearch represents the model behind the search form about `app\models\Transaction`.
 */
class TransactionSearch extends Transaction
{
    public $category;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['note', 'category'], 'safe'],
            [['amount'], 'number'],
        ];
    }

    /**
     * @inheritdoc
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
        $this->load($params, 'transaction');

         $query = new Query();
         $query
             ->select('*')
             ->from('transaction t')
             ->innerJoin('category c');
        if ($this->note) {
            $query->where(['like', 't.note', $this->note]);
        }

        if ($this->amount) {
            $query->orWhere(['like', 't.amount', $this->amount]);
        }

        if ($this->category) {
            $query->orWhere(['like', 'c.category', $this->category]);
        }
         return $query->all();
    }
}
