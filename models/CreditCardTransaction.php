<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "credit_card_transaction".
 *
 * @property integer $id
 * @property string $type
 * @property double $amount
 * @property string $transaction_date
 * @property string $update_date
 * @property integer $user_id
 * @property integer $account_id
 *
 * @property User $user
 * @property Account $account
 * @property Transaction[] $transactions
 */
class CreditCardTransaction extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'credit_card_transaction';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'amount', 'user_id', 'account_id'], 'required'],
            [['type'], 'string'],
            [['amount'], 'number'],
            [['transaction_date', 'update_date'], 'safe'],
            [['user_id', 'account_id'], 'integer'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['account_id'], 'exist', 'skipOnError' => true, 'targetClass' => Account::className(), 'targetAttribute' => ['account_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'type' => Yii::t('app', 'Type'),
            'amount' => Yii::t('app', 'Amount'),
            'transaction_date' => Yii::t('app', 'Transaction Date'),
            'update_date' => Yii::t('app', 'Last Update On'),
            'user_id' => Yii::t('app', 'Created By'),
            'account_id' => Yii::t('app', 'Account'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccount()
    {
        return $this->hasOne(Account::className(), ['id' => 'account_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTransactions()
    {
        return $this->hasMany(Transaction::className(), ['credit_card_transaction_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return CreditCardTransactionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CreditCardTransactionQuery(get_called_class());
    }
}
