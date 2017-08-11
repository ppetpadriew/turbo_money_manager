<?php
namespace Turbo\MoneyManager\Assets;

use yii\web\AssetBundle;

class ChartJsAsset extends AssetBundle
{
    public $sourcePath = '@bower/chart.js/dist';
    public $baseUrl = '@web/public';

    public $js = [
        'Chart.min.js'
    ];
}
