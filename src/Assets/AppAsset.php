<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace Turbo\MoneyManager\Assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $sourcePath = '@webroot/src/static';
    public $css = [
        'css/bootswatch.css',
        'css/customized-bootswatch.css',
        'css/customized-datepicker.css',
        'css/ionicons.css',
        'css/site.css',
    ];
    public $js = [
        'js/app.chart.js',
//        'js/dashboard.js',
        'js/bundle.js'
    ];
    public $depends = [
//        'yii\web\YiiAsset',
//        'yii\bootstrap\BootstrapPluginAsset',
        ChartJsAsset::class
    ];
}
