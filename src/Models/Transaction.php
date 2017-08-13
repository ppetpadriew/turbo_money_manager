<?php
namespace Turbo\MoneyManager\Models;

use app\models\TransactionQuery;
use Turbo\MoneyManager\Helpers\DateTime;
use Turbo\MoneyManger\Models\Account;
use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "transaction".
 *
 * @property integer $id
 * @property string $type
 * @property integer $category_id
 * @property string $note
 * @property double $amount
 * @property string $transaction_date
 * @property string $update_date
 * @property integer $user_id
 * @property integer $person_id
 * @property integer $account_id
 * @property integer $credit_card_transaction_id
 *
 * @property Account $account
 * @property Category $category
 * @property CreditCardTransaction $creditCardTransaction
 * @property Person $person
 * @property User $user
 * @property TransactionImage[] $transactionImages
 */
class Transaction extends ActiveRecord
{
    /**
     * @var DateTime
     */
    private $dateTime;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transaction';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'category_id', 'note', 'amount', 'transaction_date', 'user_id', 'account_id'], 'required'],
            [['type'], 'string'],
            [['category_id', 'user_id', 'person_id', 'account_id', 'credit_card_transaction_id'], 'integer'],
            [['amount'], 'number'],
            [['transaction_date', 'update_date'], 'safe'],
            [['note'], 'string', 'max' => 150],
            [
                ['account_id'],
                'exist',
                'skipOnError' => true,
                'targetClass' => Account::className(),
                'targetAttribute' => ['account_id' => 'id']
            ],
            [
                ['category_id'],
                'exist',
                'skipOnError' => true,
                'targetClass' => Category::className(),
                'targetAttribute' => ['category_id' => 'id']
            ],
            [
                ['credit_card_transaction_id'],
                'exist',
                'skipOnError' => true,
                'targetClass' => CreditCardTransaction::className(),
                'targetAttribute' => ['credit_card_transaction_id' => 'id']
            ],
            [
                ['person_id'],
                'exist',
                'skipOnError' => true,
                'targetClass' => Person::className(),
                'targetAttribute' => ['person_id' => 'id']
            ],
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
            'type' => Yii::t('app', 'Type'),
            'category_id' => Yii::t('app', 'Category'),
            'note' => Yii::t('app', 'Note'),
            'amount' => Yii::t('app', 'Amount'),
            'transaction_date' => Yii::t('app', 'Transaction Date'),
            'update_date' => Yii::t('app', 'Last Update On'),
            'user_id' => Yii::t('app', 'Created By'),
            'person_id' => Yii::t('app', 'Person'),
            'account_id' => Yii::t('app', 'Account'),
            'credit_card_transaction_id' => Yii::t('app', 'Credit Card Transaction ID'),
        ];
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
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCreditCardTransaction()
    {
        return $this->hasOne(CreditCardTransaction::className(), ['id' => 'credit_card_transaction_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPerson()
    {
        return $this->hasOne(Person::className(), ['id' => 'person_id']);
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
    public function getTransactionImages()
    {
        return $this->hasMany(TransactionImage::className(), ['transaction_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return TransactionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new TransactionQuery(get_called_class());
    }

    public function setDateHelper(DateTime $dateTime)
    {
        $this->dateTime = $dateTime;
    }

    public function thisMonth()
    {
        $sql = "
            SELECT *
            FROM `transaction` t
            WHERE t.transaction_date 
              BETWEEN {$this->dateTimeHelper->firstDateOfMonth()} 
              AND {$this->dateTimeHelper->lastDateOfMonth()}
            ORDER BY t.transaction_date
        ";
        $command = Yii::$app->db->createCommand($sql);

        return $command->query();
    }

    public function getMonthlyExpenseByCategory()
    {
        $sql = '';
        $sql = '
            (SELECT category, FORMAT(SUM(`amount`), 4) as `expense`
            FROM transaction t
            JOIN category c ON c.id = t.category_id
            WHERE MONTH(t.transaction_date) = MONTH(NOW())
            AND YEAR(t.transaction_date) = YEAR(NOW())
            AND t.type = "Credit"
              and t.category_id != 53
              and t.exclude_from_report = 0
              
            group by t.category_id)
            UNION
            (select "Total" as category, format(sum(amount),4) as `expense`
            from transaction t
            where month(t.transaction_date) = month(NOW())
             and year(t.transaction_date) = year(NOW())
            and t.type = "Credit"
             and t.category_id != 53
             and t.exclude_from_report = 0
            )
        ';
    }
}
