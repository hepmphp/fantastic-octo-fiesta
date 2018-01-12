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
use app\models\GaAdminUser;
use backend\controllers\BaseController;
use yii\data\Pagination;
use backend\services\helpers\Log;
use backend\components\exception\LogicException;

class GaAdminMenuController extends BaseController{

    public function init(){
        //parent::init();
        if(Yii::$app->request->get('iframe')==1){
            $this->layout = false;
        }
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
             'menu_data'    => json_encode($menu_data,true),
             'config_status'=> $mAdminMenu->get_config_status(),
             'config_menu'  => $mAdminMenu->get_config_menu()
         ]);
    }

    /**
     *  添加
     * @return string
     */
    public function actionCreate(){
        if(Yii::$app->request->isPost){//Yii::$app->request->isPost

            $model = new GaAdminMenu();
            $model->load(Yii::$app->request->post());
            if($model->validate()){
                $res = $model->save();
                if ($res) {
                    $response = array(
                        'status'=>0,
                        'msg'=>Yii::t('app','create_success'),
                        'data'=>array(),
                    );
                }else{
                    $commandQuery = clone $model;
                    $response = array(
                        'status'=>-1,
                        'msg'=>Yii::t('app','db_error'),
                        'data'=>$model->errors,
                        'last_sql'=>$commandQuery->find()->createCommand()->getRawSql(),
                    );
                }
            }else{
                $response = array(
                    'status'=>-2,
                    'msg'=>$model->firstErrors,
                    'data'=>$model->errors,
                );
            }
            $this->asJson($response);

        }else{
            $parentid = Yii::$app->request->get('parentid');
            $mAdminMenu = new GaAdminMenu();
            return $this->render('create',[
                'config_status'=>$mAdminMenu->get_config_status(),
                'config_menu'  =>$mAdminMenu->get_config_menu($parentid)
            ]);
        }
    }

    /**
     * 更新
     * @return string
     */
    public function actionUpdate(){

        if(Yii::$app->request->isPost){//Yii::$app->request->isPost
            $model = $this->findModel(Yii::$app->request->post('id'));
            $model->load(Yii::$app->request->post());
            if($model->validate()){
                $res = $model->save();
                if ($res) {
                    $response = array(
                        'status'=>0,
                        'msg'=>Yii::t('app','update_success'),
                        'data'=>array(),
                    );
                }else{
                    $commandQuery = clone $model;
                    $response = array(
                        'status'=>-1,
                        'msg'=>Yii::t('app','db_error'),
                        'data'=>$model->errors,
                        'last_sql'=>$commandQuery->find()->createCommand()->getRawSql(),
                    );
                }
            }else{
                $response = array(
                    'status'=>-2,
                    'msg'=>$model->firstErrors,
                    'data'=>$model->errors,
                );
            }
            $this->asJson($response);

        }else{
            $model = $this->findModel(Yii::$app->request->get('id'));
            $parentid = Yii::$app->request->get('parentid');
            $mAdminMenu = new GaAdminMenu();
            return $this->render('create',[
                'form'=>$model->attributes,//表单参数
                'config_status'=>$mAdminMenu->get_config_status(),
                'config_menu'  =>$mAdminMenu->get_config_menu($parentid)
            ]);
        }
    }

    public function actionDelete(){
        $res = $this->findModel(Yii::$app->request->post('id'))->delete();
        if($res){
            $response = array(
                'status'=>0,
                'msg'=>Yii::t("app","delete_success")
            );
        }else{
            $response = array(
                'status'=>-1,
                'msg'=>Yii::t("app",'delete_fail')
            );
        }
        $this->asJson($response);
    }

    /**
     * Finds the GaAdminLog model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GaAdminLog the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = GaAdminMenu::findOne($id)) !== null) {
            return $model;
        } else {
            throw new LogicException(LogicException::DATA_NOT_FUND);
        }
    }



    public function actionAjaxGetConfigMenu(){//ajax-get-config-menu
        $menu_id = Yii::$app->request->get('menu_id');
        $config_menu =(new GaAdminMenu())->get_config_menu($menu_id);
        if(!empty($config_menu)){
            $response = array(
                'status'=>0,
                'msg'=>'',
                'data'=>$config_menu
            );
        }else{
            $response = array(
                'status'=>-1,
                'msg'=>Yii::t('app','get_data_fail'),
                'data'=>array()
            );
        }
        $this->asJson($response);
    }


}