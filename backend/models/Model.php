<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-21
 * Time: 上午12:09
 * To change this template use File | Settings | File Templates.
 */

namespace backend\models;

use yii\helpers\ArrayHelper;
use backend\services\helpers\Tree;

/***
 * 模型父类
 * Class Model
 * @package backend\models\
 */
class Model extends \yii\db\ActiveRecord{


    /**
     * 自动完成搜索
     * @param $keywords
     * @return array
     */
    public function getAutoCompeleteSearch($keywords){
        $where = ['like', 'name',$keywords];
        //  var_dump($where);
        $attach_cate =  static::find()->select('id,name')->andFilterWhere($where)->limit(30)->asArray(true)->all();
        $result  = array();
        foreach($attach_cate as $key=>$v){
            $result[] = array(
                'id'=>$v['id'],
                'label'=>$v['name'],
                'value'=>$v['name']
            );
        }
        return $result;
    }

    /**
     * Select2多项搜索
     * @param $keywords
     * @return array
     */
    public   function getSelect2search($keywords){
        $where = ['like', 'name',$keywords];
        //  var_dump($where);
        $attach_cate =  static::find()->select('id,name')->andFilterWhere($where)->limit(30)->asArray(true)->all();
        $result  = array();
        foreach($attach_cate as $key=>$v){
            $result[] = array(
                'id'=>$v['id'],
                'name'=>$v['name'],
                'full_name'=>$v['name'],
                'text'=>$v['name']
//                'label'=>$v['name'],
//                'value'=>$v['name']
            );
        }
        return $result;
    }

    public static function get_config_id(){
        $config_id = static::find()->select('id,name')->limit(100)->asArray(true)->all();
        $config_id = ArrayHelper::index($config_id,'id');
        return $config_id;
    }


    /**
     * 获取菜单配置
     * @param null $parentid
     * @param null $app_id
     * @return mixed
     */
    public static function get_config_menu($parentid=null){
        $tree = new Tree();
        $admin_menu = static::find()->select('id,name,parent_id as parentid')->asArray(true)->all();
        foreach ($admin_menu as $r) {
            if($parentid !=null){
                $r['selected'] = $r['id'] == $parentid ? 'selected' : '';
            }else{
                $r['selected'] = '';
            }
            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$name</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str);
        return $select_categorys;
    }

}