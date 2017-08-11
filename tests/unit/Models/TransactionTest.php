<?php
namespace Turbo\MoneyManager\Tests\Models;

use app\tests\fixtures\TransactionFixture;
use yii\codeception\DbTestCase;

class TransactionTest extends DbTestCase
{
    public function globalFixtures()
    {
        return [
            TransactionFixture::className()
        ];
    }

    public function testThisMonth()
    {
        expect(true)->equals(false);
    }
}
