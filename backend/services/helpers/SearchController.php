<?php
/**
 * Created by JetBrains PhpStorm.
 * User: xiaoming
 * Date: 18-1-14
 * Time: 下午11:21
 * To change this template use File | Settings | File Templates.
 */

namespace backend\services\helpers;

/***
 * 搜索
 * Class FormBuilder
 * @package backend\services\helpers
 */
class SearchController {

    public static function get_config_search_builder_type(){
        $config = array(
            'search_none'=>'0.请选择',
            'search_text'=>'1.文本搜索',
            'search_select'=>'2.下拉框搜索',
            'search_like'=>'3.like搜索',
            'search_time'=>'4.时间搜索',

        );
        return $config;
    }




}