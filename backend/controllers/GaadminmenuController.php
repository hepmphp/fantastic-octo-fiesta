<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-5
 * Time: 下午5:19
 * To change this template use File | Settings | File Templates.
 */

/**

 **/
namespace backend\controllers;
use Yii;
use app\models\GaAdminMenu;
use backend\controllers\BaseController;
use yii\data\Pagination;

class GaadminmenuController extends BaseController{

    public function init(){
        //parent::init();
        if(Yii::$app->request->get('iframe')==1){
            $this->layout = false;
        }

    }

    public function actionLog(){
        echo __FILE__;
    }

    /**
     * 搜索条件
     */
    public function get_search_where(){
        $where = array();
        if(Yii::$app->request->get('search')){
            $id = Yii::$app->request->get('id');
            if($id){
                $where['id'] = $id;
            }
        }
        return $where;
    }

    public function actionIndex(){

        $where = $this->get_search_where();
        /*
        $page = new Pagination([
            'defaultPageSize' => 3,
            'totalCount' => $mAdminMenu->count(),
        ]);

         $data = $mAdminMenu->orderBy('id ASC')
                             ->offset($page->offset)
                             ->limit($page->limit)
                             ->all();*/
        $mAdminMenu = new GaAdminMenu();
        $menu_data = $mAdminMenu->getMenuData($where);
      //  echo "<pre>";
      //  print_r($menu_data);
         return $this->render('index', [
                'menu_data' => json_encode($menu_data,true),
         ]);
    }

    public function actionCreate(){
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            $model = new GaAdminMenu();
            if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->save()) {
                $response = array(
                    'status'=>0,
                    'msg'=>'',
                    'data'=>array(),
                );
            }else{
                $commandQuery = clone $model;
                $response = array(
                    'status'=>-1,
                    'msg'=>'error',
                    'data'=>$model->errors,
                    'lastSql'=>$commandQuery->find()->createCommand()->getRawSql(),
                );
            }
            $this->asJson($response);

        }else{
            return $this->render('create',[]);
        }
    }

    public function actionUpdate(){

    }

    public function actionDelete(){

    }
}