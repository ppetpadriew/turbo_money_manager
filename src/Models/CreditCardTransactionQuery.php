<?php
namespace Turbo\MoneyManager\Models;

/**
 * This is the ActiveQuery class for [[CreditCardTransaction]].
 *
 * @see CreditCardTransaction
 */
class CreditCardTransactionQuery extends ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return CreditCardTransaction[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return CreditCardTransaction|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
