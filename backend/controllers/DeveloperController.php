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
use backend\services\helpers\InfoSchema;
/***
 *  开发工具
 * Class DeveloperController
 * @package backend\controllers
 */
class DeveloperController extends BaseController{

    public function actionIndex(){
        $fields = array();
        $select = array();
        if(Yii::$app->request->get('search')){
            $table = Yii::$app->request->get('table','ga_platform');
            list($fields,$select) = (new InfoSchema())->get_all_fields($table);
        }
        $config_table_id = (new InfoSchema())->get_table();
        return $this->render('index',
            [
             'config_table_id'=>$config_table_id,
             'config_form_builder_type'=>FormBuilder::get_config_form_builder_type(),
             'fields'=>$fields
            ]
        );
    }

  public function actionPreview(){
      $table = Yii::$app->request->get('table','ga_platform');
      $get_fields = Yii::$app->request->get('fields');
      $get_fields = explode(',',$get_fields);
      $get_form_builder_types = Yii::$app->request->get("form_builder_types");
      $get_form_builder_types = explode(',',$get_form_builder_types);
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
              $form_html .= FormBuilder::$fb_func($field,$name,$select[$field]);
          }else{
              $form_html .= FormBuilder::$fb_func($field,$name);
          }
      }
      $this->layout = 'main_curd.php';

      return $this->render('preview',['form_html'=>$form_html]);
      //echo FormBuilder::mutil_checkbox('stauts','状态',$select['status']);

  }

    /**
     *  生成js
     */
    public function actionCreateJs(){
        $table = Yii::$app->request->get('table','ga_platform');
        $fields = Yii::$app->request->get('fields','');
        $fields = explode(',',$fields);
        $preview = Yii::$app->request->get('preview',1);
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
        if($controller_arr[0]!='ga'){//非管理后台的 为模块快发 cms_attach_cate 对应的目录为 cms/attach-cate/index.js
            $module = $controller_arr[0];
            unset($controller_arr[0]);
            $controller = $module.'/'.implode('-',$controller_arr);
        }
        $template_content = str_replace(array('[controller]','[form_data]','[from_name]'),array($controller,$from_data,$form_name),$template_content);
        if($preview!=1){
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
                return $this->asJson($response);
            }
        }else{
            $this->layout = 'main_curd.php';
            return $this->render('preview_js',['data'=>$template_content]);
        }
   }

   /**
    * 生成搜索列表
    */
   public function actionCreateList(){
        $table = Yii::$app->request->get('table','ga_platform');
        $fields = Yii::$app->request->get('fields','');
        $fields = explode(',',$fields);
        $preview = Yii::$app->request->get('preview',1);

        $get_form_builder_types = Yii::$app->request->get("form_builder_types");
        $get_form_builder_types = explode(',',$get_form_builder_types);
        $config_fied_builder_types = array();
        foreach($fields as $k=>$field){
          $config_fied_builder_types[$field] = $get_form_builder_types[$k];
        }
        list($db_fields,$select) = (new InfoSchema())->get_all_fields($table);
        //  var_dump($fields);exit();
        $table_field = (new InfoSchema())->get_table_field($table);
        $template_js = Yii::$app->viewPath.'/developer/template/html/list.php';
        $template_content = file_get_contents($template_js);
        //搜索框
        $form_search = '';
        foreach($db_fields as $field=>$name){
            $fb_func = $config_fied_builder_types[$field];
            if(empty($fb_func)){
                continue;
            }
            if(isset($select[$field])){
                $form_search .= FormBuilderSearch::$fb_func($field,$name,$select[$field]);
            }else{
                $form_search .= FormBuilderSearch::$fb_func($field,$name);
            }
        }
     
        $tr_header = '';
        $tr_td = '';    
        //print_r($db_fields);
        foreach($db_fields as $k=>$name){
            if(in_array($k,$fields)){
                if(strpos($k,'time')!==false){
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
        highlight_string($template_content);
   }


   public function actionCreateController(){
       $table = Yii::$app->request->get('table','ga_platform');
       $fields = Yii::$app->request->get('fields');
       $form_builder_types = Yii::$app->request->get('form_builder_types');
       $fields = explode(',',$fields);
       $form_builder_types = explode(',',$form_builder_types);

       $table_arr = explode('_',$table);
       $table_arr = array_map(function($a){
           $a = ucfirst($a);
           return $a;
       },$table_arr);

       $controller_name = implode('',$table_arr);

       $tpl = Yii::$app->viewPath.'/developer/template/html/controller.php';
       $content = file_get_contents($tpl);

       //替换模块名称 非后台的 全部替换成对应的模块
       if($table_arr[0]!='ga'){
           $table_arr[0] = strtolower($table_arr[0]);
           $namespace = sprintf('backend\modules\%s\controllers',$table_arr[0]);
       }else{
           $namespace = 'backend\controllers';
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
       $where_time_range = <<<EOT
           \$begin_[field] = Yii::\$app->request->get('begin_[field]');
           \$end_[field] = Yii::\$app->request->get('end_[field]');
           if(\$begin_[field]){
              \$begin_[field] = strtotime(\$begin_[field]);
               \$and_where[] = ['>=','begin_time',\$begin_[field]];
           }
           if(\$end_[field]){
               \$end_[field] = strtotime(\$end_[field])+86400;
               \$and_where[] = ['<','end_time',\$end_[field]];
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
       foreach($fields as $k=>$field){
            $form_builder_type = $form_builder_types[$k];
            if($form_builder_type=='search_text'){
                $where_str .= str_replace('[field]',$field,$where_tpl);
            }else if($form_builder_type=='search_time'){
                $where_str .= str_replace('[field]',$field,$where_time_range);
            }else if($form_builder_type=='search_like'){
                $where_str .= str_replace('[field]',$field,$where_like);
            }
       }
       //[search]//
       $content = str_replace(
           array('app_templdate','GaAdminGroup','//[search]//'),
           array($namespace,$controller_name,$where_str),
           $content);
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
       highlight_string($content);






   }





}