<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-5
 * Time: 下午5:19
 * To change this template use File | Settings | File Templates.
 */

/**

 **/
namespace backend\controllers;
use Yii;
use yii\web\Controller;

class TestaController extends Controller{

    public function actionLog(){
        echo __FILE__;
    }

    public function actionDebug(){
        echo __FILE__;
    }
}