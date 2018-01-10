<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-10
 * Time: 下午6:22
 * To change this template use File | Settings | File Templates.
 */

namespace backend\services\helpers;
use yii\base\UserException;
/**
 * 逻辑异常
 * Class LogicException
 * @package backend\services\helpers
 */
class LogicException  extends UserException{

    public function __construct($status,$msg='',$data=array())
    {
        json_encode( array('status' =>$status,'msg'=>$msg,'data'=>$data));
        //return false;
       // parent::__construct($m, $code, $previous);
    }

    public function getName()
    {
        return 'FileException';
    }
}