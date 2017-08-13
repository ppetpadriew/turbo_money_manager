<?php
namespace Turbo\MoneyManger\Tests\Acceptance;

use AcceptanceTester;
use yii\helpers\Url as Url;

class AboutCest
{
    public function ensureThatAboutWorks(AcceptanceTester $I)
    {
        $I->amOnPage(Url::toRoute('/site/about'));
        $I->see('About', 'h1');
    }
}
