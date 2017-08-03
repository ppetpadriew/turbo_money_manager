<?php
namespace app\assets;


use yii\web\AssetBundle;

class ChartJsAsset extends AssetBundle
{
    public $sourcePath = '@bower/chart.js/dist';

    public $js = [
        'Chart.min.js'
    ];
}