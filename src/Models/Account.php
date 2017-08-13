<?php
namespace Turbo\MoneyManger\Models;

use Turbo\MoneyManager\Models\ActiveRecord;
use Turbo\MoneyManager\Models\CreditCardTransaction;
use Turbo\MoneyManager\Models\Transaction;
use Turbo\MoneyManager\Models\User;
use Yii;

/**
 * This is the model class for table "account".
 *
 * @property integer $id
 * @property string $name
 * @property string $image_path
 * @property integer $user_id
 *
 * @property User $user
 * @property CreditCardTransaction[] $creditCardTransactions
 * @property DebtTransaction[] $debtTransactions
 * @property Transaction[] $transactions
 */
class Account extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'account';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'user_id'], 'required'],
            [['image_path'], 'string'],
            [['user_id'], 'integer'],
            [['name'], 'string', 'max' => 60],
            [
                ['user_id'],
                'exist',
                'skipOnError' => true,
                'targetClass' => User::className(),
                'targetAttribute' => ['user_id' => 'id']
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'image_path' => Yii::t('app', 'Image'),
            'user_id' => Yii::t('app', 'Owner'),
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
    public function getCreditCardTransactions()
    {
        return $this->hasMany(CreditCardTransaction::className(), ['account_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDebtTransactions()
    {
        return $this->hasMany(DebtTransaction::className(), ['account_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTransactions()
    {
        return $this->hasMany(Transaction::className(), ['account_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return AccountQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new AccountQuery(get_called_class());
    }
}
