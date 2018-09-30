<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-8-12
 * Time: 上午9:58
 * To change this template use File | Settings | File Templates.
 */

namespace backend\services\helpers;

use Yii;
use backend\services\helpers\InfoSchema;
class CurdHelper {
    /**
     * 获取js
     * @param $module_id  模块id
     * @param $table      表名
     * @param $fields     字段
     * @param $get_form_builder_types 生成类型
     * @return mixed|string
     */
    public static function get_js($module_id,$table,$fields,$get_form_builder_types){
        $table_field = (new InfoSchema())->get_table_field($table);
        $template_js = Yii::$app->viewPath.'/developer/template/js/index.js';
        $template_content = file_get_contents($template_js);
        // echo $template_content;
        $form_name = str_replace(' ','',ucwords(str_replace('_',' ',$table)));
        $from_data = $form_name.':{';
        $from_data_str = array();
        foreach($table_field as $v){
            if(in_array($v['COLUMN_NAME'],$fields)){
                $from_data_str[] = "\t\t\t\t\t{$v['COLUMN_NAME']}:body.find('#{$v['COLUMN_NAME']}').val()";
            }
        }
        $from_data .= PHP_EOL.implode(','.PHP_EOL,$from_data_str);
        $from_data .= PHP_EOL."}";
        $controller = str_replace('_','-',$table);
        $controller_arr = explode('-',$controller);
        if(!empty($module_id)){//非管理后台的 为模块快发 cms_attach_cate 对应的目录为 cms/attach-cate/index.js
            $module = $controller_arr[0];
            //unset($controller_arr[0]);
            $controller = $module_id.'/'.implode('-',$controller_arr);
        }
        $template_content = str_replace(array('[controller]','[form_data]','[from_name]'),array($controller,$from_data,$form_name),$template_content);

        //是否启用了文本多选
        $mutil_select_js_tpl = <<<EOT
    $('#[field]').select2({
        ajax: {
            url: '?r=cms/cms-[api]/select2-search',
            dataType: 'json',
            // Additional AJAX parameters go here; see the end of this chapter for the full code of this example,
            processResults: function (data) {
                console.log(data.data);
                // Tranforms the top-level key of the response object from 'items' to 'results'
                return {
                    results: data.data
                };
            },
            placeholder: 'Search for a repository',
            escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
            minimumInputLength: 1,
            templateResult: formatRepo,
            templateSelection: formatRepoSelection
        }
    });
    function formatRepo (repo) {
        if (repo.loading) {
            return repo.full_name;
        }
        return repo.full_name;
    }

    function formatRepoSelection (repo) {
        return repo.full_name || repo.text;
    }

EOT;
        $mutil_select_js = <<<EOT
$( function() {
  [mutil_select_js]
});
EOT;
        $mutil_select_js_item = array();
        if(in_array('text_multi_select',$get_form_builder_types)){

            foreach($get_form_builder_types as $k=>$builder_type){
                $field = $fields[$k];
                if($builder_type=='text_multi_select'){
                    $mutil_select_js_item[] = str_replace(array('[field]','[api]'),array($field,str_replace('_ids','',$field)),$mutil_select_js_tpl)."\n";
                }
            }
            $mutil_select_js = str_replace('[mutil_select_js]',implode("",$mutil_select_js_item),$mutil_select_js);
            $template_content = $template_content."\n".$mutil_select_js;
        }

        //多图预览上传js处理
        $mutil_image_prive_tpl = <<<EOT
var [field] = new Array();
            body.find('#[field]').parent().find(".image-item").each(function(){
                if($(this).attr('src')){
                    [field].push($(this).attr("src"));
                }
            });
EOT;
        $mutil_image_prive_val_tpl = "body.find('#[field]').val()";
        if(in_array('image_mutil_priview',$get_form_builder_types)){
            foreach($get_form_builder_types as $k=>$builder_type){
                $field = $fields[$k];
                if($builder_type=='image_mutil_priview'){
                    $mutil_image_prive = str_replace(array('[field]'),array($field),$mutil_image_prive_tpl)."\n";
                    $mutil_image_prive_val = str_replace(array('[field]'),array($field),$mutil_image_prive_val_tpl);
                    if(!empty($mutil_image_prive)){
                        //mutil_image_prive_var
                        $template_content = preg_replace("/(var param)/",$mutil_image_prive."\n"."\t\t\t$1",$template_content);
                        $template_content = str_replace($mutil_image_prive_val,$field,$template_content);
                    }
                }
            }

        }
        //多图预览上传js处理结束

        //复选框js处理 转换成用,分隔的变量
        //多图预览上传js处理
        $mutil_select_tpl = <<<EOT
var [field] = new Array();
            body.find('input[name='[field]']:checked').each(function(){
                    [field].push($(this).val());
            });
EOT;
        $mutil_select_val_tpl = "body.find('#[field]').val()";
        if(in_array('mutil_checkbox',$get_form_builder_types)){
            foreach($get_form_builder_types as $k=>$builder_type){
                $field = $fields[$k];
                if($builder_type=='mutil_checkbox'){
                    $mutil_select = str_replace(array('[field]'),array($field),$mutil_select_tpl)."\n";
                    $mutil_select_val = str_replace(array('[field]'),array($field),$mutil_select_val_tpl);
                    var_dump($mutil_select_val);
                    if(!empty($mutil_select_val)){
                        var_dump($mutil_select);
                        //mutil_image_prive_var
                        $template_content = preg_replace("/(var param)/",$mutil_select."\n"."\t\t\t$1",$template_content);
                        $template_content = str_replace($mutil_select_val,$field.".join(','),",$template_content);
                    }
                }
            }

        }


        //


        $mutil_radio_val_tpl = "body.find('#[field]').val()";
        $mutil_radio_tpl = '$("input[name=\'[field]\']:checked").val()';
        if(in_array('multi_radio',$get_form_builder_types)){
            foreach($get_form_builder_types as $k=>$builder_type){
                $field = $fields[$k];
                if($builder_type=='multi_radio'){
                    $mutil_radio_val = str_replace(array('[field]'),array($field),$mutil_radio_val_tpl);
                    $mutil_radio_val_replace = str_replace(array('[field]'),array($field),$mutil_radio_tpl);
                    $template_content = str_replace($mutil_radio_val,$mutil_radio_val_replace.",",$template_content);
                }
            }

        }

        return $template_content;
    }

    /**
     * 获取视图路径
     * @param $module_id 模块id
     * @param $table     表名
     * @return string
     */
    public static function get_view_path($module_id,$table){
        $controller = str_replace('_','-',$table);
        $controller_arr = explode('-',$controller);
        if(!empty($module_id)){//非管理后台的 为模块快发 cms_attach_cate 对应的目录为 cms/attach-cate/index.js
            $controller = implode('-',$controller_arr);
            $view_path = Yii::$app->viewPath."/../modules/%s/views/%s/";
            $view_path = sprintf($view_path,$module_id,$controller);
        }else{
            $view_path =  Yii::$app->viewPath.'/'.$controller.'/';
        }

        if(!is_dir($view_path)){
            mkdir($view_path,0755,true);
        }
        return $view_path;
    }

    /**
     * 获取控制器内容
     * @param $namespace   命名空间
     * @param $model       模型的路径空间
     * @param $controller_name 控制器名称
     * @param $table           表名
     * @param $fields          字段
     * @param $search_builder_types 搜索
     * @param $form_builder_types   列表自动获取下拉选项
     * @return mixed
     */
    public static function get_controller($namespace,$model,$controller_name,$table,$fields,$search_builder_types,$form_builder_types){
        $tpl = Yii::$app->viewPath.'/developer/template/html/controller.php';
        $content = file_get_contents($tpl);
        // $id = Yii::$app->request->get('id');
        // if($id){
        //    $where['id'] = $id;
        // }
        //文本搜索
        //like搜索 $and_where[] = ['like','name',$name];
        //时间搜索 $and_where[] = ['>=','begin_time',$begin_time];
        //时间搜索 $and_where[] = ['<','end_time',$end_time];
        //   $where[] = ['like', 'name', $name];

        //搜索条件替换
        $where_tpl = <<<EOT
            \$[field] = Yii::\$app->request->get('[field]');
            if(\$[field]){
               \$where['[field]'] = \$[field];
            }
            \n
EOT;
        $where_select =  <<<EOT
            \$[field] = Yii::\$app->request->get('[field]');
            if(is_numeric(\$[field])){
               \$where['[field]'] = \$[field];
            }
            \n
EOT;

        $where_time_range = <<<EOT
           \$begin_[field] = Yii::\$app->request->get('begin_[field]');
           \$end_[field] = Yii::\$app->request->get('end_[field]');
           if(\$begin_[field]){
              \$begin_[field] = strtotime(\$begin_[field]);
               \$and_where[] = ['>=','[field]',\$begin_[field]];
           }
           if(\$end_[field]){
               \$end_[field] = strtotime(\$end_[field])+86400;
               \$and_where[] = ['<','[field]',\$end_[field]];
           }
           \n

EOT;
        $where_like = <<<EOT
             \$[field] = Yii::\$app->request->get('[field]');
              if(\$[field]){
                  \$and_where[] = ['like','[field]',\$[field]];
              }\n

EOT;
        $where_str = "\n";
        //替换搜索项
        $select_tree_str="";
        $select_tree_id_str="";
        foreach($fields as $k=>$field){
            $searc_builder_type = $search_builder_types[$k];
            if($searc_builder_type=='search_text'){
                $where_str .= str_replace('[field]',$field,$where_tpl);
            }else if($searc_builder_type=='search_select'){
                $where_str .= str_replace('[field]',$field,$where_select);
            }else if($searc_builder_type=='search_time'){
                $where_str .= str_replace('[field]',$field,$where_time_range);
            }else if($searc_builder_type=='search_like'){
                $where_str .= str_replace('[field]',$field,$where_like);
            }

            $form_builder_type = $form_builder_types[$k];
            if($form_builder_type=='select_tree'){
                $select_tree_str .= sprintf("\t\t\t\t'select_tree'=>%s::get_config_menu()",$controller_name).",\n";
                $select_tree_id_str .= sprintf("\t\t\t\t'select_tree'=>%s::get_config_menu(\$model['parent_id'])",$controller_name).",\n";
            }
        }

        //自动添加配置
        //get_config_[field]
        list($db_fields,$select) = (new InfoSchema())->get_all_fields($table);
        $config_str = array();
        // var_dump($select);
        foreach($select as $k=>$s){
            $config_str[] ="\t\t\t'config_{$k}'=>". sprintf("%s::get_config_%s()",$controller_name,$k).",\n";
        }
        //[search]//
        $content = str_replace(
            array('app_templdate','app_model','GaAdminGroup','//[search]//','//[config]//','//[select_tree]//','//[select_tree_id]//'),
            array($namespace,$model.'\\'.$controller_name,$controller_name,$where_str,implode("",$config_str),$select_tree_str,$select_tree_id_str),
            $content);
        return $content;

    }

    /**
     * 获取模型
     * @param $namespace   命名空间
     * @param $model_name  模型名称
     * @param $table       表名
     * @param $fields      字段
     * @param $form_validator_types 验证类型
     * @return mixed
     */
    public static function get_model($namespace,$model_name,$table,$fields,$form_validator_types){
        $tpl = Yii::$app->viewPath.'/developer/template/html/model.php';
        $content = file_get_contents($tpl);
        list($db_fields,$select) = (new InfoSchema())->get_all_fields($table);

        //状态配置
        $config_tpl = <<<EOT
public static function get_config_[field](){
            return [
                tpl
            ];
    }
EOT;
        $config_data= array();
        $config_str = '';
        foreach($select as $k=>$s){
            $formart_arr = array();
            foreach($s as $k2=>$s2){
                $formart_arr[] = "{$s2['id']}=>['id'=>{$s2['id']},'name'=>'{$s2['name']}'],\n";
            }
            $config_data[] = str_replace(array('[field]','tpl'),array($k,implode("\t\t\t\t",$formart_arr)),$config_tpl)."\n";
        }
        $config_str = implode("\n\t",$config_data);

        //生成验证规则
        $rules = [];
        $rules_filter = [];//过滤已经有自定义验证器的
        $form_validator_mutil= [];//验证分组
        //替换搜索项
        //验证规则
        foreach($fields as $k=>$field){
            $form_validator_type = $form_validator_types[$k];
            if(empty($form_validator_type)){
                continue;
            }
            $rules_filter[] = $field;
            if(in_array($form_validator_type,['default_int0','default_empty'])){
                $form_validator_mutil[$form_validator_type][] = $field;
                continue;
            }

            $rules[] = "\t\t\t\t".FormValidator::$form_validator_type($field);
        }
        foreach($form_validator_mutil as $form_validator_type=>$field){
            $rules[] = "\t\t\t\t".FormValidator::$form_validator_type($field);
        }

        $fields = array_diff($fields,$rules_filter);
        $rules[] = FormValidator::required_all($fields);
        $rules = array_reverse($rules);
        $attributes = [];//属性
        foreach($db_fields as $field=>$name){
            $attributes[] = "\t\t\t\t '{$field}' => Yii::t('app', '{$name}'),";
        }
        //beforeSave//自动添加时间
        $config_beforesave_tpl = <<<EOT
    public function beforeSave(\$insert){
        if(parent::beforeSave(\$insert)){
            if(\$this->isNewRecord){
                \$this->addtime = time();
            }
            //update_time//
            return true;
        }else{
            return false;
        }
    }
EOT;

        $beforesave = '';
        if(in_array('addtime',array_keys($db_fields))){
            $beforesave = $config_beforesave_tpl."\n";
        }
        if(in_array('update_time',array_keys($db_fields))){
            $beforesave = str_replace('//update_time//',"\$this->update_time=time();",$beforesave);
        }

        $content = str_replace(
            array('app_templdate','Model','[table]','[rule]','[field_comment]','//config_str//','//beforeSave//'),
            array($namespace,$model_name,$table,"\n"."\t\t\t".implode("\n",$rules),"\n".implode("\n",$attributes),$config_str,$beforesave),
            $content);

        return $content;
    }

    /**
     * 获取列表视图
     * @param $table  表
     * @param $fields 字段
     * @param $config_search_list_types 搜索类型
     * @return mixed
     */
    public static function get_search_list($table,$fields,$config_search_list_types){
        list($db_fields,$select) = (new InfoSchema())->get_all_fields($table);
        $table_field = (new InfoSchema())->get_table_field($table);
        $template = Yii::$app->viewPath.'/developer/template/html/list.php';
        $template_content = file_get_contents($template);
        //搜索框
        $form_search = '';
        foreach($db_fields as $field=>$name){
            $fb_func = $config_search_list_types[$field];

            if(strpos($fb_func,'search_none')!==false||empty($fb_func)){
                continue;
            }
            if(isset($select[$field])){
                $form_search .= FormSearchList::$fb_func($field,$name,$select[$field]);
            }else{
                $form_search .= FormSearchList::$fb_func($field,$name);
            }
        }

        $tr_header = "\n";
        $tr_td = "\n";
        $slect_keys = array_keys($select);
//        echo "<pre>";
//        var_dump($fields);
//        print_r($db_fields);
        foreach($db_fields as $k=>$name){
            if(in_array($k,$fields)){
                if(in_array($k,$slect_keys)){
                    $tr_td .= "\t\t\t<td><?=\$config_{$k}[\$vo['$k']]['name']?></td>\n";
                }else if(strpos($k,'time')!==false){
                    $tr_td .= "\t\t\t<td><?=date('Y-m-d H:i:s',\$vo['{$k}'])?></td>\n";
                }else{
                    $tr_td .= "\t\t\t<td><?=\$vo['{$k}']?></td>\n";

                }
                $tr_header .= "\t\t\t<th>{$name}</th>\n";
            }
        }
//        var_dump($form_search);
        //列表
        $template_content = str_replace(
            array('[search_field]','[tr_head]','[tr_td]'),
            array($form_search,$tr_header,$tr_td),
            $template_content);
        return $template_content;

    }
}