<?php
namespace Turbo\MoneyManager\Tests\Unit\Models;

use Turbo\MoneyManager\Tests\Fixtures\TransactionFixture;
use yii\codeception\DbTestCase;

class TransactionTest extends DbTestCase
{
    public function globalFixtures()
    {
        return [
//            TransactionFixture::className()
        ];
    }

    public function testThisMonth()
    {
        expect(true)->equals(true);
    }
}
