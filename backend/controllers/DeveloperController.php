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

        return $this->render('index',['config_table_id'=>$config_table_id,'fields'=>$fields]);
    }

      public function actionGetTableField(){

          $table = Yii::$app->request->get('table','ga_platfrom');
          $sql   = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name ='{$table}' and TABLE_SCHEMA='game_admin'";
          $command = Yii::$app->db->createCommand($sql);
          $table_field = $command->queryAll();
          $fields = array();
          $select = array();//下拉框
          foreach($table_field as $k=>$v){
              if(stripos($v['COLUMN_COMMENT'],'|')!==false){
                    $comment = explode('|',$v['COLUMN_COMMENT']);
                    echo "<pre>";
                    print_r($comment);
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

          echo "<pre>";
          print_r($fields);
          print_r($select);
          echo FormBuilder::mutil_checkbox('stauts','状态',$select['status']);

      }




}