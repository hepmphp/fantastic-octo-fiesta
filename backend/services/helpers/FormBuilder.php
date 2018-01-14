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
 * 表单生成
 * Class FormBuilder
 * @package backend\services\helpers
 */
class FormBuilder {

    /**
     * 普通文本框
     * @param $field
     * @param $name
     * @return mixed
     */
    public static  function text_input($field,$name){
        $input = <<<EOT
        <div class="form-group">
          <label class="col-md-4 control-label" for="[field]">[name]</label>
          <div class="col-md-4">
          <input id="[field]" name="[field]" type="text" value="<?=\$form['[field]']?>" placeholder="[name]" class="form-control input-md">
          </div>
        </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

    /**
     * 密码框
     * @param $field
     * @param $name
     * @return mixed
     */
    public static function password_input($field,$name){
        $input = <<<EOT
        <div class="form-group">
          <label class="col-md-4 control-label" for="[field]">[name]</label>
          <div class="col-md-4">
          <input id="[field]" name="[field]" type="password" value="<?=\$form['[field]']?>" placeholder="[name]" class="form-control input-md">
          </div>
        </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

    /**
     * 文本
     * @param $field
     * @param $name
     * @return mixed
     */
    public static function textarea_input($field,$name){
        $input = <<<EOT
        <!-- Textarea -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="[field]">[name]</label>
          <div class="col-md-4">
            <textarea class="form-control" id="[field]" name="[field]">default text</textarea>
          </div>
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
        <!-- Select Basic -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="[field]">[name]</label>
          <div class="col-md-4">
            <select id="[field]" name="[field]" class="form-control">
              <option value="">请选择</option>
                <?php
                    foreach(\$config_[field]_id as \$k=>\$vo){
                        ?>
                        <option value="<?=\$vo['id']?>" <?php if(\$vo['id']==\$form['[field]']){ echo "selected";}?>><?=\$vo['name']?></option>
                    <?php }?>
            </select>
          </div>
        </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;

    }

    /**
     * 多选框
     * @param $field
     * @param $name
     * @param $items
     * @param int $is_inline
     * @return mixed
     */
    public static function multi_radio($field,$name,$items,$is_inline=1){
        $input = <<<EOT
<!-- Multiple Radios (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="[field]">[name]</label>
   <div class="col-md-4">
    [items]
  </div>
</div>
EOT;
        $item_html = <<<EOT
  <label class="[radio-inline]" for="[field]-[i]">
      <input type="radio" name="[field]" id="[field]-[i]" value="[v]">
      [v]
    </label>
EOT;
        if($is_inline==1){
            $item_html = str_replace('[radio-inline]','radio-inline',$item_html);
        }else{
            $item_html = str_replace('[radio-inline]','',$item_html);
        }
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        $item_html = str_replace(array('[field]'),array($field),$item_html);
        $items_html = '';
        foreach($items as $k=>$it){

            $items_html .= str_replace(array('[i]','[v]'),array($k,$it['name']),$item_html);
        }

        $input = str_replace('[items]',$items_html,$input);
        return $input;
    }

    /**
     * 多选框
     * @param $field
     * @param $name
     * @param $items
     * @param int $is_inline
     * @return mixed
     */
    public static function mutil_checkbox($field,$name,$items,$is_inline=1){
        $input = <<<EOT
<!-- Multiple Checkboxes (inline) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="[field]">[name]</label>
  <div class="col-md-4">
  [items]
  </div>
</div>

EOT;
        $item_html = <<<EOT
   <label class="[checkbox-inline]" for="[field]-[i]">
      <input type="checkbox" name="[field]" id="[field]-[i]" value="[v]">
      [v]
    </label>
EOT;
        if($is_inline==1){
            $item_html = str_replace('[checkbox-inline]','checkbox-inline',$item_html);
        }else{
            $item_html = str_replace('[checkbox-inline]','',$item_html);
        }
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        $item_html = str_replace(array('[field]'),array($field),$item_html);
        $items_html = '';
        foreach($items as $k=>$it){

            $items_html .= str_replace(array('[i]','[v]'),array($k,$it['name']),$item_html);
        }

        $input = str_replace('[items]',$items_html,$input);
        return $input;
    }
}