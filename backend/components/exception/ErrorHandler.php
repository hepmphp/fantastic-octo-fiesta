<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-11
 * Time: 上午9:32
 * To change this template use File | Settings | File Templates.
 */

namespace backend\components\exception;
use Yii;
/***
 * 自定义异常处理
 * Class ErrorHandler
 * @package backend\components\exception
 */
class ErrorHandler extends \yii\base\ErrorHandler{

    public $errorView = '@app/views/error-handler/error.php';
    public function renderException($exception)
    {
        if(Yii::$app->request->getIsAjax()){
            echo( json_encode( array('status' =>$exception->getCode(),'msg'  =>$exception->getMessage())));
            return false;
        }else{
            echo  Yii::$app->getView()->renderFile($this->errorView,['exception' => $exception,],$this);
        }
    }
}