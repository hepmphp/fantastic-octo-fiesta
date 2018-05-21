<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-21
 * Time: 上午12:09
 * To change this template use File | Settings | File Templates.
 */

namespace backend\models;

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
                'name'=>$v['name'],
                'full_name'=>$v['name'],
                'text'=>$v['name']
//                'label'=>$v['name'],
//                'value'=>$v['name']
            );
        }
        return $result;
    }

    /**
     * Select2多项搜索
     * @param $keywords
     * @return array
     */
    public function getSelect2search($keywords){
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


}