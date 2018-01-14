<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-11
 * Time: 上午9:47
 * To change this template use File | Settings | File Templates.
 */

namespace backend\components\exception;
use yii\base\UserException;

class LogicException extends UserException{
    //逻辑异常对照表
    CONST USER_EXEIST = 1000;
    CONST DATA_NOT_FUND = 2000;//数据库没找到记录
    CONST PAGE_ERROR = 3000;
    static $codeMessage = array(
        '1000'=>'用户名已存在',
        '2000'=>'数据库没找到记录'
    );

    public function __construct($code,$msg='',\Exception $previous=null){
        if($msg){
            parent::__construct($msg,$code,$previous);
        }else{
            parent::__construct(self::$codeMessage[$code],$code,$previous);
        }
    }

    public function getName(){
        return 'LogicException';
    }

}