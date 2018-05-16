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
            $table = Yii::$app->request->get('table','ga_platfrom');
            $sql   = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name ='{$table}' and TABLE_SCHEMA='game_admin'";
            $command = Yii::$app->db->createCommand($sql);
            $table_field = $command->queryAll();
            $fields = array();
            $select = array();//下拉框
            foreach($table_field as $k=>$v){
                if(stripos($v['COLUMN_COMMENT'],'|')!==false){
                    $comment = explode('|',$v['COLUMN_COMMENT']);
                    $fields[$v['COLUMN_NAME']] = $comment[0];
                    $select_item = explode(',',$comment[1]);
                    foreach($select_item as $s=>$it){
                        $item = explode(':',$it);
                        $select[$v['COLUMN_NAME']][] = array('id'=>$item[0],'name'=>$item[1]);
                    }
                }else{
                    $fields[$v['COLUMN_NAME']] = $v['COLUMN_COMMENT'];
                }

            }
        }

        $sql   = "SELECT table_name as id,table_comment as name from information_schema.`TABLES` where TABLE_SCHEMA='game_admin'";
        $command = Yii::$app->db->createCommand($sql);
        $config_table_id = $command->queryAll();

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

      $sql   = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name ='{$table}' and TABLE_SCHEMA='game_admin'";
      $command = Yii::$app->db->createCommand($sql);
      $table_field = $command->queryAll();
      $fields = array();
      $select = array();//下拉框
      foreach($table_field as $k=>$v){
          if(stripos($v['COLUMN_COMMENT'],'|')!==false){
                $comment = explode('|',$v['COLUMN_COMMENT']);
              $fields[$v['COLUMN_NAME']] = $comment[0];
              $select_item = explode(',',$comment[1]);
              foreach($select_item as $s=>$it){
                  $item = explode(':',$it);
                  $select[$v['COLUMN_NAME']][] = array('id'=>$item[0],'name'=>$item[1]);
              }
          }else{
              $fields[$v['COLUMN_NAME']] = $v['COLUMN_COMMENT'];
          }
      }

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
        $table = Yii::$app->request->post('table','ga_platform','trim');
        $fields = Yii::$app->request->post('fields','','trim');
      //  var_dump($fields);
        $sql   = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name ='{$table}' and TABLE_SCHEMA='game_admin'";
        $command = Yii::$app->db->createCommand($sql);
        $table_field = $command->queryAll();
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


        $logic_path = './static/js/logic/'.$controller;//目前就用到index.js
        if(!is_dir($logic_path)){
            mkdir($logic_path,0755,true);
        }
        $logic_file = $logic_path.'/index.js';
        echo $logic_file;
        if(!file_exists($logic_file)){//不允许覆盖
            $res = file_put_contents($logic_file,$template_content);
            if($res){
                $response = array(
                    'status'=>0,
                    'msg'=>Yii::t('app','create_js_file_success')
                );
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','create_js_file_fail')
                );
            }
        }else{
            $response = array(
                'status'=>-2,
                'msg'=>Yii::t('app','js_file_exist')
            );
        }
        return $this->asJson($response);

   }



}