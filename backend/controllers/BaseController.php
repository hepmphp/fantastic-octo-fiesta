<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-6
 * Time: 下午12:45
 * To change this template use File | Settings | File Templates.
 */

namespace backend\controllers;
use Yii;
use app\models\GaAdminMenu;
use yii\web\Controller;


class BaseController extends Controller{

    /***
     *模块名 Yii::$app->controller->module->id;
     *控制器名 Yii::$app->controller->id
     *方法名 Yii::$app->controller->action->id;
     */
    public $layout = 'main_admin.php';

    public $current_menu = null;


    public $model = '';//通用的操作模型
    public function beforeAction($action){
        if(parent::beforeAction($action)){
            if(in_array($action->id,['create','update','delete','edit-password'])){
                $this->layout = 'main_curd.php';//使用curd布局
            }
            if($this->layout && Yii::$app->request->get('iframe')==1){
                $this->layout = 'main_content.php';//详情页
            }

            return true;
        }else{
            return false;
        }
    }

    public function afterAction($action,$result){
            //登录信息和权限检测
//        var_dump(Yii::$app->controller->module->id);
//        var_dump(Yii::$app->controller->id);
//        var_dump(Yii::$app->controller->action->id);
        $this->check();
        return parent::afterAction($action,$result);
    }


    /**
     *账号信息和权限检测
     */
    public function check(){
        $this->ip_check();
        header("Content-type:text/html;charset=utf-8");
        if(Yii::$app->controller->id !='site'&&empty(Yii::$app->session['admin_user.id'])){
            //跳转
            exit('长时间没操作,请重新登录');
           // $this->error('长时间没操作,请重新登录',U('index/login'),5000);
        }elseif(Yii::$app->controller->id !='site'){//检测账号是否过期
            if(
                (Yii::$app->session['admin_user.allow_mutil_login']===0) AND
                !empty(Yii::$app->session['admin_user.last_session_id']) AND
                (Yii::$app->session['admin_user.last_session_id']!=session_id())
            ){//用户组做登录限制
                Yii::$app->session->destroy();
                exit('你的账户在其它地方登录,请重新登录');
                //跳转
            }
        }
        if(Yii::$app->request->get('iframe')==1){
            $this->checkAccess();
        }
        /*
        $this->admin_menu = D('AdminUser')->getUserMenu($this->admin_user['id']);
        $top_menu = M('admin_menu')->where(array('parentid'=>0,'status'=>0))->order('listorder asc')->select();
        $tree_menu = D('AdminMenu')->get_menu_tree();
        $left_menu = M('admin_menu')->where(array('data'=>$this->current_menu['data'],'level'=>1))->order('listorder asc')->select();
        $this->assign('admin_menu',$this->admin_menu);


        $this->assign('method',$this->method);
        $this->assign('action',$this->action);
        $this->assign('index_menu',$this->index_menu);
        $this->assign('current_menu',$this->current_menu);
        $this->assign('top_menu',$top_menu);
        $this->assign('tree_menu',$tree_menu);
        $this->assign('left_menu',$left_menu);*/

    }

    /**
     * 菜单权限检测
     * @param bool $read_only
     * @return bool
     */
    public function checkAccess($read_only=false){
        if(Yii::$app->controller->id=='site'){
            return true;
        }

        $where_menu = array(
            'model'=>Yii::$app->controller->id,
            'action'=>Yii::$app->controller->action->id,
         //   ['<>','level',0]
        );
        $current_menu = GaAdminMenu::find()->where($where_menu)->limit(1)->asArray()->one();
        if(!in_array($current_menu['id'],Yii::$app->session['admin_user.mids']) && Yii::$app->controller->action->id != 'get_search_where'){//搜索条件拼接不做权限检测
            if(Yii::$app->request->isPost){
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','user_has_no_permission'),
                    'data'=>array(
                        'method'=>Yii::$app->controller->id,
                        'action'=>Yii::$app->controller->action->id,
                        'current_id'=>$current_menu['id'],
                        'mids'=>Yii::$app->session['admin_user.mids'],
                    ),
                );
                $this->asJson($response);
                return false;
            }else{
                $this->error('没有权限操作','',1000);
            }
        }else{
            return true;
        }
    }

    public function init(){//公用方法初始化
        //根据url参数设置layout


    }

    /**
     * ip检测
     */
    public function ip_check() {
        if(isset($_SERVER['SERVER_ADDR']) && $_SERVER['SERVER_ADDR']!='192.168.71.21'){//本地测试机
            if (!in_array(Yii::$app->request->getUserIP(),array())) {//ip 白名单 抽离到配置中
                //exit('deny ....');
            }
        }
    }

    /***
     *
     * 通用的添加方法
     * @param $model
     * @return \yii\web\Response
     */
    public function commonCreate($model){
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
                // $commandQuery = clone $model;
                $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','db_error'),
                    'data'=>$model->errors,
                    //   'last_sql'=>$commandQuery->find()->createCommand()->getRawSql(),
                );
            }
        }else{
            $response = array(
                'status'=>-2,
                'msg'=>implode("<br/>",$model->firstErrors),
                'data'=>$model->errors,
            );
        }
        return $this->asJson($response);
    }
    /***
     * 通用的更新方法
     * @param $model
     */
    public function commonUpdate(){
        $model = $this->findModel(Yii::$app->request->get('id'));
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
                'msg'=>implode("<br/>",$model->firstErrors),
                'data'=>$model->errors,
            );
        }
        return $this->asJson($response);
    }

    /**
     * 通用的删除方法
     */
    public function commonDelete(){
        $response = array(
            'status'=>-1,
            'msg'=>Yii::t('app','delete_fail'),
            'data'=>'',
        );
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(empty($ids_arr)){
            $res = $this->model->findAll($ids_arr)->limit(10)->delete();
            if($res){
                $response =array(
                    'status'=>0,
                    'msg'=>Yii::t('app','delete_success'),
                    'data'=>'',
                );
            }
        }
        $this->asJson($response);
    }
    /***
     * 通用逻辑删除
     */
    public function commonLogicDelete(){
        $response = array(
            'status'=>-1,
            'msg'=>Yii::t('app','delete_fail'),
            'data'=>'',
        );
        $status = Yii::$app->request->post('status','1');
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(!empty($ids_arr)){
            $res = $this->model->updateAll(['status'=>$status],['id'=>$ids_arr]);
            if($res){
             //   $m = clone $this->model;
                $response =array(
                    'status'=>0,
                    'msg'=>Yii::t('app','delete_success'),
                    'data'=>array() //$m->find()->createCommand()->getRawSql(),
                );
            }
        }

        $this->asJson($response);
    }




    /**
     * 获取操作日志类型
     */
    public function getLogType(){
        $action = '  '.strtolower(ACTION_NAME);
        $log_type = 1;
        //日志类型 1添加2修改3删除4登录成功5登录失败
        if(strpos($action,'add') !=false){
            $log_type = 1;
        }elseif(strpos($action,'edit') !=false){
            $log_type = 2;
        }elseif(strpos($action,'delete') !=false){
            $log_type = 3;
        }elseif((strpos($action,'import') !=false)){
            $log_type = 1;
        }
        return $log_type;
    }

    public function adminLog($user_id,$username,$info=''){
        if(Yii::$app->request->isPost){
            $data = array(
                'user_id'=>$user_id,
                'username'=>$username,
                'm'=>strtolower(MODULE_NAME),
                'a'=>strtolower(ACTION_NAME),
                'addtime'=>time(),
                'ip'=>get_client_ip(),
                'info'=>$info,
                'log_type'=>$this->getLogType(),
            );
            if(MODULE_NAME!='Index'){
                $log_filename = sprintf("%s.%s.%s",MODULE_NAME,ACTION_NAME,'log');//日志文件
                $file_log_text =  sprintf("管理员:%s 应用：%s模块%s方法%s<br>参数%s",var_export($this->admin_user,true),GROUP_NAME,MODULE_NAME,ACTION_NAME,var_export($_REQUEST,true));
                Service('Filelog')->write($file_log_text,$log_filename,'game_admin');//写日志
            }
            M('admin_log')->add($data);
        }
    }

}