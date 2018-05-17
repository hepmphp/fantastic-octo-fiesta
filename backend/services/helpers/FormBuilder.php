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

    public static function get_config_form_builder_type(){
        $config = array(
            'text_input'=>'1.普通文本',
            'password_input'=>'2.密码',
            'textarea_input'=>'3.文本框',
            'select_input'=>'4.下拉框',
            'multi_radio'=>'5.单选框',
            'mutil_checkbox'=>'6.复选框',
            'time'=>'7.时间',
            'image'=>'8.单图',
            'image_mutil'=>'9.多图',
            'text_rich'=>'10.富文本',
            'text_select'=>'11.文本多选',
            'text_search'=>'12.下拉搜索',
            ''=>'-------',
            'search_text'=>'1.文本搜索-控制器',
            'search_like'=>'2.like搜索-控制器',
            'search_time'=>'3.时间搜索-控制器'
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

    public static function time($field,$name){
        $input = <<<EOT
       <div class="form-group">
		<label class="control-label col-md-4">[name]：</label>
		  <div class="col-md-4">
		<input placeholder="[name]" class="form-control date-range-[field] date-ico" name="[field]" id="[field]"  type="text" value="<?=\$form['[field]']?>">
		</div>
	   </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;
    }

    public static function image($field,$name){
        $input = <<<EOT
            <div class="form-group">
            <label class="col-md-4 control-label">[name]：</label>
            <form name="image_form_[field]" id="image_form_[field]" action="" method="post" enctype="multipart/form-data" target="imageFrame">
              <div class="col-md-4">
                <input value="" name="[field]" class="imgPath form-control" type="text" id="pic_[field]">
              </div>
               <button type="button" class="btnImg btn btn-success">浏览</button>
               <input name="submitImg" id="submitImg" class="submitImg" style="display:none" type="file" accept=".jpg,.png,.gif,.jpeg">
               <iframe width="0" height="0" id="imageFrame" name="imageFrame" frameborder="0" scrolling="no"></iframe>
            </div>
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;

    }

    /**
     * 富文本编辑器
     * @param $field  字段
     * @param $name   字段名
     * @return mixed
     */
    public static function text_rich($field,$name){
        $input = <<<EOT
      <div class="form-group">
     <label class="col-sm-1 control-label">[name]：</label>
     </div>
     <div class="col-sm-12">
        <script id="editor" type="text/plain" name="[field]" id="[field]" value="{\$form['field']}" style="width:100%;height: 400px;">
        </script>
      </div>
      
EOT;
        $input = str_replace(array('[name]','[field]'),array($name,$field),$input);
        return $input;

    }


}