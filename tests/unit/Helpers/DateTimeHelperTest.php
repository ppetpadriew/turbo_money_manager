<?php
namespace Turbo\MoneyManger\Tests\Unit\Helpers;

use Codeception\Test\Unit;
use Turbo\MoneyManager\Helpers\DateTime;

class DateTimeHelperTest extends Unit
{
    public function testNow()
    {
        // It should get current date and uses `Y-m-d H:i:s` as default format
        $dateTimeHelper = new DateTime();
        $result = $dateTimeHelper->now();

        expect($result)->equals(date('Y-m-d H:i:s', time()));

        // It should return the date as the format we given.
        $result = $dateTimeHelper->now('m');

        expect($result)->equals(date('m'));
    }

    public function testFirstDateOfMonth()
    {
        // It should return first date of current month
        $dateTimeHelper = new DateTime();
        
        $result = $dateTimeHelper->firstDateOfMonth();
        
        expect($result)->equals(date('Y-m-01'));

        // It should return first date of the given month
        $result = $dateTimeHelper->firstDateOfMonth('02');

        expect($result)->equals(date('Y-02-01'));
    }

    public function testLastDateOfMonth()
    {
        // It should return last date of current month
        $dateTimeHelper = new DateTime();
        
        $result = $dateTimeHelper->lastDateOfMonth();
        
        expect($result)->equals(date('Y-m-t'));

        // It should return last date of given month
        $result = $dateTimeHelper->lastDateOfMonth('03');

        expect($result)->equals(date('Y-03-t'));
    }
}
