<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppCurdAsset extends AssetBundle
{

    public $basePath = '@webroot';
    public $baseUrl = '@web';
//    public $baseUrl = 'http://192.168.71.21:40003/';
    public $css = [
        //全局样式
        'static/css/bootstrap.min.css',
        'static/css/style.css',
        'static/css/screen.css',
//        //图标
//        'static/css/font-awesome.min.css',
//        //表格表单
        'static/js/bootstrap-table/bootstrap-table.min.css',
        'static/css/form.css',
//        //日期
        'static/js/date/daterangepicker.css',
//        //mobile样式
        'static/css/mobile.css',

    ];
   // public $cssOptions = ['condition' => 'lte IE9'];
    public $js = [
         //全局js
        '/static/js/jquery.min.js',
        '/static/js/bootstrap.min.js',
        '/static/js/layer/layer.js',

        //Bootstrap table
//        '/static/js/bootstrap-table/bootstrap-table.min.js',
//        '/static/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js',
//        '/static/js/table-demo.js',
        //日期
//        '/static/js/date/moment.min.js',
//        '/static/js/date/jquery.daterangepicker.js',

        //通用
//        '/static/js/common.js',
    ];

    public $depends = [
//        'yii\web\YiiAsset',
//        'yii\bootstrap\BootstrapAsset',
    ];

    //定义按需加载JS方法，注意加载顺序在最后
    public static function addScript($view, $jsfile) {
        $view->registerJsFile($jsfile, [AppCurdAsset::className(), 'depends' => 'backend\assets\AppCurdAsset']);
    }

    //定义按需加载css方法，注意加载顺序在最后
    public static function addCss($view, $cssfile) {
        $view->registerCssFile($cssfile, [AppCurdAsset::className(), 'depends' => 'backend\assets\AppCurdAsset']);
    }

    /**
     * @var string
     * <!--全局样式-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/screen.css" rel="stylesheet">
    <!--图标-->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!--表单表格-->
    <link href="js/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <!--日期-->
    <link href="js/date/daterangepicker.css" rel="stylesheet">
    <!--mobile 样式-->
    <link href="css/mobile.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

     */
}
