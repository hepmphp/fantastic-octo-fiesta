<?php
/**
 * Created by JetBrains PhpStorm.
 * User: xiaoming
 * Date: 18-1-14
 * Time: 下午4:41
 * To change this template use File | Settings | File Templates.
 */

namespace backend\controllers;
use backend\controllers\BaseController;
use Yii;
use backend\services\helpers\FormBuilder;
use backend\services\helpers\FormBuilderSearch;
use backend\services\helpers\FormSearchList;
use backend\services\helpers\FormValidator;
use backend\services\helpers\InfoSchema;
use backend\services\helpers\SearchController;
use  backend\models\GaadminMenu;
use yii\base\View;

/***
 * 生成路径说明
视图
//modules/cms/view/cms-cate/create
//modules/cms/view/cms-cate/index
模型
//modules/cms/models/CmsAttach.php
//models/GaAdminMenu.php

 控制器
//module/controllers/CmsArticleController.php  //模块
//controllers/GaAdminMenuController            //后台

 js
//web/static/js/login/cms/article
//web/static/js/logic/ga-admin-mneu
 */

/***
 *  开发工具
 * Class DeveloperController
 * @package backend\controllers
 */
class DeveloperController extends BaseController{

    public function actionIndex(){
        $modules =  scandir(Yii::$app->basePath."/modules/");
        $modules = array_filter($modules,function($i){
                if($i=='.'||$i=='..'){
                    return false;
                }else{
                    return true;
                }
            }
        );
        $fields = array();
        $select = array();
        //print_r(Yii::$app);
        if(Yii::$app->request->get('search')){
            $table = Yii::$app->request->get('table','ga_platform');
            list($fields,$select) = (new InfoSchema())->get_all_fields($table);
        }
        $config_table_id = (new InfoSchema())->get_table();
        return $this->render('index',
            [
             'config_modules_id'=>$modules,
             'config_table_id'=>$config_table_id,
             'config_form_builder_type'=>FormBuilder::get_config_form_builder_type(),
             'config_form_validator_type'=>FormValidator::get_config_form_validator_type(),
             'config_search_builder_type'=>SearchController::get_config_search_builder_type(),
             'config_search_list_type'=>FormSearchList::get_config_search_list_type(),
             'fields'=>$fields,
             'config_menu'  => (new GaadminMenu)->get_config_menu(null,1)
            ]
        );
    }

  public function actionPreview(){
      $create_file = Yii::$app->request->get('create_file','0');
      $module_id = Yii::$app->request->get('module_id','');
      $table = Yii::$app->request->get('table','ga_platform');
      $get_fields = Yii::$app->request->get('fields');
     // $get_fields = explode(',',$get_fields);
      $get_form_builder_types = Yii::$app->request->get("form_builder_types");
     // $get_form_builder_types = explode(',',$get_form_builder_types);
      $config_fied_builder_types = array();
      foreach($get_fields as $k=>$field){
          $config_fied_builder_types[$field] = $get_form_builder_types[$k];
      }
      list($fields,$select) = (new InfoSchema())->get_all_fields($table);
      //生成html
      $form_html = '';
      foreach($fields as $field=>$name){
          $fb_func = $config_fied_builder_types[$field];
          if(empty($fb_func)){
              continue;
          }

          if(isset($select[$field])){
              $form_html .= FormBuilder::$fb_func($field,$name,$select[$field])."\n";
          }else{
              $form_html .= FormBuilder::$fb_func($field,$name)."\n";
          }
      }

      $html = <<<HTML
<div class="container col-sm-12" style="margin-top: 10px;">
    <div class="form-horizontal">
        <input type="hidden" id="id" value="<?=\$form['id']?>">
        [form_html]
    </div>
</div>
HTML;

        $css = array();
        $js = array();

        //包含 时间 日期 单图 多图 富文本 文本多选 下拉搜索 自动注入js
        if(in_array('date_time',$get_form_builder_types)
           ||in_array('date',$get_form_builder_types)
        ){
            $js[] = '/static/js/logic/lib/date_picker.js';
        }

        if(in_array('image',$get_form_builder_types)){

            //"/static/js/logic/lib/image_upload_callback.js"
            //"/static/js/logic/lib/image_upload_callback.js"
            $js[] = '/static/js/logic/lib/image_upload.js';
        }
        if(in_array('image_mutil',$get_form_builder_types)){

        }
        if(in_array('text_rich',$get_form_builder_types)){
            $css[] = "/static/js/umeditor/themes/default/css/umeditor.css";
            $js[] = "/static/js/umeditor/lang/zh-cn/zh-cn.js";
            $js[] = "/static/js/umeditor/umeditor.config.js";
            $js[] = "/static/js/umeditor/umeditor.js";
        }

        if(in_array('text_multi_select',$get_form_builder_types)){
            $css[] = "/static/js/select2/css/select2.min.css";
            $js[] = "/static/js/select2/js/select2.full.min.js";
        }
        if(in_array('text_search',$get_form_builder_types)){
            $css[] = '/static/js/autocomplete/jquery-ui.css';
            $js[] = '/static/js/autocomplete/jquery-ui.js';
        }
        $css_js = '';
        $css_register= 'AppCurdAsset::addCss($this,"%s");';
        $js_register= 'AppCurdAsset::addScript($this,"%s");';
        $js_register_head = 'AppCurdAsset::addScriptHead($this,"%s");';
        if(!empty($css) ||!empty($js)){
            $php_html = <<<EOT
<?php
    use backend\assets\AppCurdAsset;
    AppCurdAsset::register(\$this);
    [css_js]

?>
EOT;
            foreach($css as $c){
                $css_js[] = sprintf($css_register,$c);
            }
            foreach($js as $j){
                if(strpos($j,'lang')!==false){
                    $css_js[] = sprintf($js_register,$j);
                }else if(strpos($j,'umeditor')!==false){
                    $css_js[] = sprintf($js_register_head,$j);
                }else{
                    $css_js[] = sprintf($js_register,$j);
                }
            }
            foreach($css_js as $k=>&$v){
                if($k==0){
                    continue;
                }
                $v = "\t".$v;
            }
            $php_html = str_replace('[css_js]',implode("\n",$css_js),$php_html);
            $html = $php_html."\n".$html;

        }


        $html = str_replace(array('[form_html]'),array($form_html),$html);

      if($create_file==1){
          $controller = str_replace('_','-',$table);
          $controller_arr = explode('-',$controller);
          if(!empty($module_id)){//非管理后台的 为模块快发 cms_attach_cate 对应的目录为 cms/attach-cate/index.js
              $controller = implode('-',$controller_arr);
              $view_path = Yii::$app->viewPath."/../modules/%s/views/%s/";
              $view_path = sprintf($view_path,$module_id,$controller);
          }else{
              $view_path =  Yii::$app->viewPath.'/'.$controller.'/';
          }
//          echo $view_path;exit();
          if(!is_dir($view_path)){
              mkdir($view_path,0755,true);
          }


          //视图
          //modules/cms/view/cms-cate/create
          $view_file = $view_path.'/create.php';
        //  echo $view_file;
          if(!file_exists($view_file)){//不允许覆盖
              $res = file_put_contents($view_file,$html);
              if($res){
                  $response = array(
                      'status'=>0,
                      'msg'=>Yii::t('app','视图创建成功')
                  );
              }else{
                  $response = array(
                      'status'=>-2,
                      'msg'=>Yii::t('app','视图创建失败')
                  );
              }
          }else{
              $response = array(
                  'status'=>-1,
                  'msg'=>Yii::t('app','视图已存在,请手动覆盖')
              );
          }
          return $this->asJson($response);
      }else{
          highlight_string($html);
//          $this->layout = 'main_curd.php';
//          return $this->render('preview',['form_html'=>$form_html]);
      }
      //echo FormBuilder::mutil_checkbox('stauts','状态',$select['status']);

  }

    /**
     *  生成js
     */
    public function actionCreateJs(){
        $create_file = Yii::$app->request->get('create_file','0');
        $module_id =  Yii::$app->request->get('module_id');
        $table = Yii::$app->request->get('table','ga_platform');
        $fields = Yii::$app->request->get('fields','');
//        $fields = explode(',',$fields);
        $preview = Yii::$app->request->get('preview',1);
        $get_form_builder_types = Yii::$app->request->get("form_builder_types");
//        $get_form_builder_types = explode(',',$get_form_builder_types);
     //  var_dump($fields);exit();
        $table_field = (new InfoSchema())->get_table_field($table);
        $template_js = Yii::$app->viewPath.'/developer/template/js/index.js';
        $template_content = file_get_contents($template_js);
       // echo $template_content;
        $form_name = str_replace(' ','',ucwords(str_replace('_',' ',$table)));
        $from_data = $form_name.':{';
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
        if($create_file==1){
            $logic_path = './static/js/logic/'.$controller;//目前就用到index.js
            if(!is_dir($logic_path)){
                mkdir($logic_path,0755,true);
            }
            $logic_file = $logic_path.'/index.js';
            if(!file_exists($logic_file)){//不允许覆盖
                $res = file_put_contents($logic_file,$template_content);
                if($res){
                    $response = array(
                        'status'=>0,
                        'msg'=>Yii::t('app','create_js_file_success')
                    );
                }else{
                    $response = array(
                        'status'=>-2,
                        'msg'=>Yii::t('app','js_file_exist')
                    );
                }

            }else{
                $response = array(
                    'status'=>-2,
                    'msg'=>Yii::t('app','js_file_exist')
                );
            }
            return $this->asJson($response);
        }else{


            highlight_string($template_content);
//            $this->layout = 'main_curd.php';
//            return $this->render('preview_js',['data'=>$template_content]);
        }
   }

   /**
    * 生成搜索列表
    */
   public function actionCreateList(){
       $create_file = Yii::$app->request->get('create_file','0');
        $module_id =  Yii::$app->request->get('module_id');
        $table = Yii::$app->request->get('table','ga_platform');
        $fields = Yii::$app->request->get('fields','');
//        $fields = explode(',',$fields);
        $preview = Yii::$app->request->get('preview',1);

        $search_list_types = Yii::$app->request->get("search_list_types");
//        $search_list_types = explode(',',$search_list_types);
        $config_search_list_types = array();
        foreach($fields as $k=>$field){
            $config_search_list_types[$field] = $search_list_types[$k];
        }

        list($db_fields,$select) = (new InfoSchema())->get_all_fields($table);
        //  var_dump($fields);exit();
        $table_field = (new InfoSchema())->get_table_field($table);
        $template_js = Yii::$app->viewPath.'/developer/template/html/list.php';
        $template_content = file_get_contents($template_js);
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
        if($create_file==1){
            $controller = str_replace('_','-',$table);
            $controller_arr = explode('-',$controller);
            if(!empty($module_id)){//非管理后台的 为模块快发 cms_attach_cate 对应的目录为 cms/attach-cate/index.js
               // unset($controller_arr[0]);
                $controller = implode('-',$controller_arr);
                $view_path = Yii::$app->viewPath."/../modules/%s/views/%s/";
                $view_path = sprintf($view_path,$module_id,$controller);
            }else{
                $view_path =  Yii::$app->viewPath.'/'.$controller.'/';
            }

            if(!is_dir($view_path)){
                mkdir($view_path,0755,true);
            }
            //视图
            //modules/cms/view/cms-cate/create
            $view_file = $view_path.'/index.php';
           // echo $view_file;
            if(!file_exists($view_file)){//不允许覆盖
                $res = file_put_contents($view_file,$template_content);
                if($res){
                    $response = array(
                        'status'=>0,
                        'msg'=>Yii::t('app','列表创建成功')
                    );
                }else{
                    $response = array(
                        'status'=>-2,
                        'msg'=>Yii::t('app','列表创建失败')
                    );
                }
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','列表已存在,请手动覆盖')
                );
            }
            return $this->asJson($response);
        }else{
            highlight_string($template_content);
        }

   }


   public function actionCreateController(){
       $create_file = Yii::$app->request->get('create_file','0');
       $table = Yii::$app->request->get('table','ga_platform');
       $fields = Yii::$app->request->get('fields');
       $search_builder_types = Yii::$app->request->get('search_builder_types');
       $form_builder_types = Yii::$app->request->get('form_builder_types');
       $module_id =  Yii::$app->request->get('module_id');
//       $fields = explode(',',$fields);
//       $search_builder_types = explode(',',$search_builder_types);
//       $form_builder_types = explode(',',$form_builder_types);

       $table_arr = explode('_',$table);
       $table_arr = array_map(function($a){
           $a = ucfirst($a);
           return $a;
       },$table_arr);

       $controller_name_arr = $table_arr;
      // unset($controller_name_arr[0]);//去掉表前缀
       $controller_name = implode('',$controller_name_arr);

       $tpl = Yii::$app->viewPath.'/developer/template/html/controller.php';
       $content = file_get_contents($tpl);

       //替换模块名称 非后台的 全部替换成对应的模块
       $model = 'backend\models';//backend\models\GaAdminGroup
       $namespace = 'backend\controllers';
       $controller_path = Yii::$app->viewPath."/../controllers/";
       if(!empty($module_id)){
           $module_id = strtolower($module_id);
           $namespace = sprintf('backend\modules\%s\controllers',$module_id);
           $model =  sprintf('backend\modules\%s\models',$module_id);
           $controller_path = Yii::$app->viewPath."/../modules/{$module_id}/controllers/";
       }
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

        if($create_file==1){
            //$controller_path
            $controller_file = $controller_path.$controller_name."Controller.php";
            if(!file_exists($controller_file)){//不允许覆盖
                $res = file_put_contents($controller_file,$content);
                if($res){
                    $response = array(
                        'status'=>0,
                        'msg'=>Yii::t('app','控制器创建成功')
                    );
                }else{
                    $response = array(
                        'status'=>-2,
                        'msg'=>Yii::t('app','控制器创建失败')
                    );
                }
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','控制器已存在,请手动覆盖')
                );
            }
            return $this->asJson($response);


        }else{
            highlight_string($content);
        }


 //      控制器
//module/controllers/CmsArticleController.php  //模块
//controllers/GaAdminMenuController            //后台
       /***
        * 搜索选项
        *  fields:title,addtime
           form_builder_types:search_text,search_time
           table:cms_ad
        */
       // $id = Yii::$app->request->get('id');
       // if($id){
       //    $where['id'] = $id;
       // }
       //文本搜索
       //like搜索 $and_where[] = ['like','name',$name];
       //时间搜索 $and_where[] = ['>=','begin_time',$begin_time];
       //时间搜索 $and_where[] = ['<','end_time',$end_time];
       // var_dump($content);

   }

    /**
     * 生成模型
     */
    public function actionCreateModel(){
        $create_file = Yii::$app->request->get('create_file','0');
        $module_id =  Yii::$app->request->get('module_id');
        $table = Yii::$app->request->get('table','ga_platform');
        $fields = Yii::$app->request->get('fields');
        $form_validator_types = Yii::$app->request->get('form_validator_types');

       // $fields = explode(',',$fields);
       // $form_validator_types = explode(',',$form_validator_types);

        $table_arr = explode('_',$table);
        $table_arr = array_map(function($a){
            $a = ucfirst($a);
            return $a;
        },$table_arr);
        $model_name_arr = $table_arr;
      //  unset($model_name_arr[0]);
        $model_name = implode('',$model_name_arr);

        $tpl = Yii::$app->viewPath.'/developer/template/html/model.php';
        $content = file_get_contents($tpl);

        //替换模块名称 非后台的 全部替换成对应的模块
        if(!empty($module_id)){
            $module_id = strtolower($module_id);
            $namespace = sprintf('backend\modules\%s\models',$module_id);
            $model_path = Yii::$app->viewPath."/../modules/$module_id/models/";
        }else{
            $namespace = 'backend\models';
            $model_path = Yii::$app->viewPath."/../models/";
        }
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

        $rules = [];
        //替换搜索项
        //验证规则
        $rules[] = FormValidator::required_all($fields);

        foreach($fields as $k=>$field){
             $form_validator_type = $form_validator_types[$k];
            if(empty($form_validator_type)){
                continue;
            }
            $rules[] = "\t\t\t\t".FormValidator::$form_validator_type($field);
        }
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
            array($namespace,$model_name,$table,"\n".implode("\n",$rules),"\n".implode("\n",$attributes),$config_str,$beforesave),
            $content);

        // 模型
        //modules/cms/models/CmsAttach.php
        //models/GaAdminMenu.php
        if($create_file==1){
            $model_file = $model_path."{$model_name}.php";
            if(!file_exists($model_file)){//不允许覆盖
                $res = file_put_contents($model_file,$content);
                if($res){
                    $response = array(
                        'status'=>0,
                        'msg'=>Yii::t('app','模型创建成功')
                    );
                }else{
                    $response = array(
                        'status'=>-2,
                        'msg'=>Yii::t('app','模型创建失败')
                    );
                }
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','模型已存在,请手动覆盖')
                );
            }
            return $this->asJson($response);
        }else{
            highlight_string($content);
        }
}


    public function actionCreateMenu(){
        $table = Yii::$app->request->get('table','ga_platform');
        $create_file = Yii::$app->request->get('create_file','0');
        $parent_id = Yii::$app->request->get('parent_id','0');
        $root_action = 'index';
        $actions = array(
            'index',
            'create',
            'update',
            'delete',
        );
        $config_action_name = array(
            'index'=>'列表',
            'create'=>'添加',
            'update'=>'修改',
            'delete'=>'删除',
        );
        //
        $controller = str_replace('_','-',$table);
        $controller_arr = explode('-',$controller);
        if($controller_arr[0]!='ga'){//非管理后台的 为模块快发 cms_attach_cate 对应的目录为 cms/attach-cate/index.js
            $module = $controller_arr[0];
            //unset($controller_arr[0]);
            $controller = $module.'/'.implode('-',$controller_arr);
        }

        $table_data = (new InfoSchema())->get_table('yii_admin',$table);
        $root_menu = ['model'=>$controller,'action'=>'index','listorder'=>0,'name'=>$table_data['name'].$config_action_name['index'],'parentid'=>$parent_id];
        $menu_data = array();
        foreach($actions as $action){
            $menu_data[] = ['model'=>$controller,'action'=>$action,'listorder'=>0,'name'=>$table_data['name'].$config_action_name[$action],'parentid'=>$parent_id];
        }
        if($create_file){
            //检查是否存在

               $admin_menu =  GaAdminMenu::find()->where($root_menu)->asArray()->one();
               print_r($admin_menu);


        }else{
            echo Yii::$app->db->createCommand()->insert('`ga_admin_menu`',$root_menu)->getRawSql()."<br/>\n";
            foreach($menu_data as $m_data){
                echo Yii::$app->db->createCommand()->insert('`ga_admin_menu`',$m_data)->getRawSql()."<br/>\n";
            }
        }

    }











}