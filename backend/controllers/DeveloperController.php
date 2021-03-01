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
use backend\services\helpers\CurdHelper;
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
        /*模块列表*/
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
      $get_form_builder_types = Yii::$app->request->get("form_builder_types");
      $config_fied_builder_types = array();
      foreach($get_fields as $k=>$field){
          $config_fied_builder_types[$field] = $get_form_builder_types[$k];
      }
      $html = FormBuilder::get_form_html($table,$config_fied_builder_types,$get_form_builder_types);
      if($create_file==1){
          $view_path = CurdHelper::get_view_path($module_id,$table);
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
          highlight_string($html);exit();
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
        $get_form_builder_types = Yii::$app->request->get("form_builder_types");
        $controller = str_replace('_','-',$table);

        $js = CurdHelper::get_js($module_id,$table,$fields,$get_form_builder_types);
        if($create_file==1){
            if(!empty($module_id)){
                $logic_path = "./static/js/logic/{$module_id}/{$controller}";//目前就用到index.js
            }else{
                $logic_path = './static/js/logic/'.$controller;//目前就用到index.js
            }
            if(!is_dir($logic_path)){
                mkdir($logic_path,0755,true);
            }
            $logic_file = $logic_path.'/index.js';
            if(!file_exists($logic_file)){//不允许覆盖
                $res = file_put_contents($logic_file,$js);
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

           highlight_string($js);exit();
			 
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

        $search_list_types = Yii::$app->request->get("search_list_types");
        $config_search_list_types = array();
        foreach($fields as $k=>$field){
            $config_search_list_types[$field] = $search_list_types[$k];
        }
        $template_content = CurdHelper::get_search_list($table,$fields,$config_search_list_types);

        if($create_file==1){
            $view_path = CurdHelper::get_view_path($module_id,$table);
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
            highlight_string($template_content);exit();
        }

   }


   public function actionCreateController(){
       $create_file = Yii::$app->request->get('create_file','0');
       $table = Yii::$app->request->get('table','ga_platform');
       $fields = Yii::$app->request->get('fields');
       $search_builder_types = Yii::$app->request->get('search_builder_types');
       $form_builder_types = Yii::$app->request->get('form_builder_types');
       $module_id =  Yii::$app->request->get('module_id');

       $table_arr = explode('_',$table);
       $table_arr = array_map(function($a){
           $a = ucfirst($a);
           return $a;
       },$table_arr);

       $controller_name_arr = $table_arr;
      // unset($controller_name_arr[0]);//去掉表前缀
       $controller_name = implode('',$controller_name_arr);
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
        $content = CurdHelper::get_controller($namespace,$model,$controller_name,$table,$fields,$search_builder_types,$form_builder_types);
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
            highlight_string($content);exit();
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
        $table_arr = explode('_',$table);
        $table_arr = array_map(function($a){
            $a = ucfirst($a);
            return $a;
        },$table_arr);
        $model_name_arr = $table_arr;
        $model_name = implode('',$model_name_arr);
        //替换模块名称 非后台的 全部替换成对应的模块
        if(!empty($module_id)){
            $module_id = strtolower($module_id);
            $namespace = sprintf('backend\modules\%s\models',$module_id);
            $model_path = Yii::$app->viewPath."/../modules/$module_id/models/";
        }else{
            $namespace = 'backend\models';
            $model_path = Yii::$app->viewPath."/../models/";
        }
        $content = CurdHelper::get_model($namespace,$model_name,$table,$fields,$form_validator_types);
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
            highlight_string($content);exit();
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