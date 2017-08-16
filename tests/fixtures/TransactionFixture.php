<?php
namespace Turbo\MoneyManager\Tests\Fixtures;

use Turbo\MoneyManager\Models\Transaction;
use yii\test\ActiveFixture;

class TransactionFixture extends ActiveFixture
{
    public $modelClass = Transaction::class;
}
