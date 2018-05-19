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
 * 搜索表单生成
 * Class FormBuilder
 * @package backend\services\helpers
 */
class FormSearchList {

    public static function get_config_search_list_type(){
        $config = array(
            'search_none'=>'0.请选择',
            'text_input'=>'1.普通文本',
            'select_input'=>'2.下拉框',
            'time_range'=>'3.时间',
            'text_select'=>'4.文本多选',
            'text_search'=>'5.下拉搜索',
        );
        return $config;
    }

 

    /**
     * 普通文本框
     * @param $field
     * @param $name
     * @return mixed
     */
    public static  function text_input($field,$name){
        $input = <<<EOT
        <div class="form-group">
            <label class="control-label">[name]：</label>
            <input placeholder="文本" class="form-control" name="[field]" id="[field]" value="<?=Yii::\$app->request->get('[field]')?>" type="text">
        </div>

EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

 
 

    /**
     * 下拉框
     * @param $field
     * @param $name
     * @return mixed
     */
    public static function select_input($field,$name){
        $input = <<<EOT
        <div class="form-group">
        <label class="control-label">平台：</label>
        <select id="[field]" name="[field]" class="form-control">
        <option value="">请选择</option>
          <?php
              foreach(\$config_[field]_id as \$k=>\$vo){
                  ?>
                  <option value="<?=\$vo['id']?>" <?php if(\$vo['id']==\$form['[field]']){ echo "selected";}?>><?=\$vo['name']?></option>
              <?php }?>
        </select>
	    </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

 
    public static function time($field,$name){

        $input = <<<EOT
       <div class="form-group">
            <label class="control-label col-md-4">[name]：</label>
            <div class="col-md-4">
            <input placeholder="[name]" class="form-control date-range-[field] date-ico" type="text" value="<?=Yii::\$app->request->get('[field]')?>">
            </div>
	   </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

    /***
     * 时间范围搜索
     */
    public static function time_range($field,$name){
        $input = <<<EOT
        <div class="form-group">
            <label class="control-label">[name]：</label>
            <span class="date-range">
            <input placeholder="开始时间" class="form-control date-range00 date-ico" name="begin_[field]" type="text" value="<?=Yii::\$app->request->get('begin_[field]')?>">
            <input placeholder="结束时间" class="form-control date-range01 date-ico" name="end_[field]" type="text" value="<?=Yii::\$app->request->get('end_[field]')?>">
            </span>
        </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

    


}