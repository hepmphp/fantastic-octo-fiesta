<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-9-25
 * Time: 上午10:47
 * To change this template use File | Settings | File Templates.
 */

namespace backend\services\helpers;


class Ip {
    static function convertIpToString($ip)
    {
        $long = 4294967295 - ($ip - 1);
        return long2ip(-$long);
    }
    static function convertIpToLong($ip)
    {
        return sprintf("%u", ip2long($ip));
    }
}