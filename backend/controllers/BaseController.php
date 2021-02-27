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
use backend\models\GaAdminLog;
use backend\models\GaAdminMenu;
use yii\web\Controller;
use backend\components\exception\LogicException;
use backend\services\helpers\Log;


class BaseController extends Controller{

    /***
     *模块名 Yii::$app->controller->module->id;
     *控制器名 Yii::$app->controller->id
     *方法名 Yii::$app->controller->action->id;
     */
    public $layout = '/main_admin.php';

    public $current_menu = null;
    public $model = '';//通用的操作模型
    public function beforeAction($action){
        if(parent::beforeAction($action)){
//            var_dump(Yii::$app->controller->module->id);
//            var_dump(Yii::$app->controller->id);
//            var_dump(Yii::$app->controller->action->id);
            //登录信息和权限检测
            $this->checkLogin();
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
//        var_dump(Yii::$app->controller->module->id);
//        var_dump(Yii::$app->controller->id);
//        var_dump(Yii::$app->controller->action->id);
        return parent::afterAction($action,$result);
    }


    /**
     *账号信息和权限检测
     */
    public function checkLogin(){
        $this->ip_check();
        header("Content-type:text/html;charset=utf-8");
        if(Yii::$app->controller->id !='site'&& empty(Yii::$app->session['admin_user.id'])){
            //跳转
            throw new LogicException(LogicException::PAGE_ERROR,'长时间没操作,请重新登录');
           // $this->error('长时间没操作,请重新登录',U('index/login'),5000);
        }else if(Yii::$app->controller->id !='site'){//检测账号是否过期
            if(
                (Yii::$app->session['admin_user.allow_mutil_login']===0) AND
                !empty(Yii::$app->session['admin_user.last_session_id']) AND
                (Yii::$app->session['admin_user.last_session_id']!=session_id())
            ){//用户组做登录限制
                Yii::$app->session->destroy();
                throw new LogicException(LogicException::PAGE_ERROR,'你的账户在其它地方登录,请重新登录');
            }
        }

        $this->checkAccess();
        if(Yii::$app->request->get('iframe')!=1 && Yii::$app->session['admin_user.mids']){
            $top_menu = GaAdminMenu::find()->where(['parentid'=>0,'status'=>0])->orderBy(['listorder'=>SORT_ASC])->asArray()->all();
            $where_left_menu = array(
                'top_menu_id'=>$this->current_menu['top_menu_id'],
                'level'=>1,
            );
            $left_menu = GaAdminMenu::find()->where($where_left_menu)->orderBy(['listorder'=>SORT_ASC])->asArray()->all();

            foreach($top_menu as $k=>$tm){
                if(!in_array($tm['id'],Yii::$app->session['admin_user.mids'])){
                    unset($top_menu[$k]);
                }
            }

            $menu = array(
                'top_menu'=>$top_menu,
                'left_menu'=>$left_menu
            );
            Yii::$app->session->set('menu',$menu);
            Yii::$app->session->set('current_top_menu_id',$this->current_menu['top_menu_id']);//当前菜单id
        }

       // var_dump(Yii::$app->session->get('menu'));
        //  var_dump(Yii::$app->cache->get('current_top_menu_id'));
      //  var_dump($left_menu);
      //  Yii::$app->cache->get('current_top_menu_id');
      //  echo "<pre>";
      //  print_r(Yii::$app->view->params['menu']);
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
        //requestedRoute
        if(Yii::$app->controller->module->id!='app-backend'){
            $model = Yii::$app->controller->module->id."/".Yii::$app->controller->id;
        }else{
            $model = Yii::$app->controller->id;
        }

        $where_menu = array(
            'model'=>$model,
            'action'=>Yii::$app->controller->action->id,
        );

        $this->current_menu = GaAdminMenu::find()->where($where_menu)->andWhere(['<>','level',0])->limit(1)->asArray()->one();
        //developer
        //不需要做权限检测的控制器和方法
        if(
            in_array(Yii::$app->controller->id,['developer'])
           || in_array(Yii::$app->controller->action->id, ['get_search_where'])
        ){
            return true;
        }
        if(!in_array($this->current_menu['id'],Yii::$app->session['admin_user.mids'])){
               /*
               $response = array(
                    'status'=>-1,
                    'msg'=>Yii::t('app','user_has_no_permission'),
                    'data'=>array(
                        'method'=>Yii::$app->controller->id,
                        'action'=>Yii::$app->controller->action->id,
                        'current_id'=>$current_menu['id'],
                        'mids'=>Yii::$app->session['admin_user.mids'],
                    ),
                );*/
                throw new LogicException(-1,Yii::t('app','user_has_no_permission'));
        }else{
            return true;
        }
    }

    public function init(){//公用方法初始化
        //根据url参数设置layout
		parent::init();

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
                return $this->ajaxReturn(0,Yii::t('app','create_success'));
            }else{
                return $this->ajaxReturn(-1,Yii::t('app','db_error'),['data'=>['errors'=>$model->errors]]);
            }
        }else{
            return $this->ajaxReturn(-2,implode("<br/>",$model->firstErrors),['data'=>['errors'=>$model->errors]]);
        }

    }
    /***
     * 通用的更新方法
     * @param $model
     */
    public function commonUpdate($model){
       // $model = $this->findModel(Yii::$app->request->get('id'));
        $model->load(Yii::$app->request->post());
        if($model->validate()){
            $res = $model->save();
            if ($res) {
                return $this->ajaxReturn(0,Yii::t('app','update_success'));
            }else{
                $commandQuery = clone $model;
                return $this->ajaxReturn(-1,Yii::t('app','db_error'),array('data'=>['errors'=>$model->errors,'last_sql'=>$commandQuery->find()->createCommand()->getRawSql()]));
            }
        }else{
            return $this->ajaxReturn(-2,implode("<br/>",$model->firstErrors),['data'=>['errors'=>$model->errors]]);
        }
    }

    /**
     * 通用的删除方法
     */
    public function commonDelete($model){
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(!empty($ids_arr)){
            //deleteAll
            $where = ['in', 'id', $ids_arr];
            $res = $model->deleteAll($where);
            if($res){
                return $this->ajaxReturn(0,Yii::t('app','delete_success'));
            }
        }else{
            return $this->ajaxReturn(-1,Yii::t('app','delete_fail'));
        }

    }
	
	
    /***
     * 通用逻辑删除
     */
    public function commonLogicDelete($model){
        $status = Yii::$app->request->post('status','-1');
        $ids = Yii::$app->request->post('ids');
        $ids_arr = explode(',',$ids);
        $ids_arr = array_map('intval',$ids_arr);
        if(!empty($ids_arr)){
            $res = $model->updateAll(['status'=>$status],['id'=>$ids_arr]);
            if($res){
                return $this->ajaxReturn(0,Yii::t('app','delete_success'));
            }else{
                return $this->ajaxReturn(-1,Yii::t('app','delete_fail'));
            }
        }else{
            return $this->ajaxReturn(-1,Yii::t('app','delete_fail'));
        }

    }
	
	 /***
     *
     * 通用的多个模型添加方法
     * @param $model
     * @return \yii\web\Response
     */
    public function commonMutipleCreate($all_models,$key=''){
        $main_model = $all_models[0];
        foreach($all_models as $model){
            $model->load(Yii::$app->request->post());
        }
        $is_valid = $main_model->validateMultiple($all_models);
        if($is_valid){
            $save_res = [];
            $save_id = [];
            foreach($all_models as $k=>$model){
                if($k>0 ){
                    $model->$key = $save_id[0];
                }
                $save_res[] = $model->save();
                $save_id[] = $model->primaryKey;
            }
            $save_res = array_filter($save_res);
            if(count($save_res)==count($all_models)){
                return $this->ajaxReturn(0,Yii::t('app','create_success'));
            }else{
                return $this->ajaxReturn(-1,Yii::t('app','db_error'),['data'=>['errors'=>$main_model->errors]]);
            }
        }else{
            $errors = [];
            foreach($all_models as $model){
                if(!empty($model->firstErrors)){
                    $errors = array_merge($errors,$model->firstErrors);
                }
            }
            return $this->ajaxReturn(-2,implode("<br/>",$errors),['data'=>['errors'=>$errors]]);
        }
    }

    /**
        * @param $all_models 所有的模型 模型1为主模型 其它为扩展模型
         * @return mixed
     */
    public function commonMutipleUpdate($all_models){
        $model = $all_models[0];
        $model_exts = array_slice($all_models,1);
        if( $model->load(Yii::$app->request->post())){
            foreach($model_exts as $model_ext){
                if(!empty($model_ext)){
                    $model_ext->load(Yii::$app->request->post());
                }else{
                    $model_ext->primaryKey = $model->primaryKey;
                    $model_ext->load(Yii::$app->request->post());
                }
            }
            $is_valid = $model->validateMultiple($all_models);
            if($is_valid){
                $save_res[] = $model->save();
                foreach($model_exts as $model_ext){
                    $save_res[] = $model_ext->save();
                }
                $save_res = array_filter($save_res);
                if(count($save_res)==count($model_exts)+1){
                    return $this->ajaxReturn(0,Yii::t('app','update_success'));
                }else{
                    $commandQuery = clone $model;
                    return $this->ajaxReturn(-1,Yii::t('app','db_error'),array('data'=>['errors'=>$model->errors,'last_sql'=>$commandQuery->find()->createCommand()->getRawSql()]));
                }
            }else{
                $errors = $model->firstErrors;
                foreach($model_exts as $model_ext){
                    if(!empty($model_ext->firstErrors)){
                        $errors = array_merge($errors,$model_ext->firstErrors);
                    }
                }
                return $this->ajaxReturn(-2,implode("<br/>",$errors),array('data'=>['errors'=>$errors]));
            }
        }
    }


    /**
     *Select2 搜索
     */
    public function actionSelect2Search(){
        $keywords = Yii::$app->request->get('term');
        $cate_names = $this->model->getSelect2Search($keywords);
        if($cate_names){
            return $this->ajaxReturn(0,'',$cate_names);

        }else{
            return $this->ajaxReturn(-1,'no data');
        }
    }

    /**
     * 自动完成搜索
     */
    public function actionAutoCompeleteSearch(){
        $keywords = Yii::$app->request->get('term');
        $data = $this->model->getAutoCompeleteSearch($keywords);
        if($data){
            return $this->ajaxReturn(0,'',$data);
        }else{
            return  $this->ajaxReturn(-1,'');
        }
    }

    /***
     * 统一接口返回
     * @param $status
     * @param $msg
     * @param array $data
     * @return \yii\web\Response
     */
    public function ajaxReturn($status,$msg,$data=array()){
        $this->adminLog(Yii::$app->session['admin_user.id'],Yii::$app->session['admin_user.username'],var_export($_POST,true));
        $response = array(
            'status'=>$status,
            'msg'=>$msg,
            'data'=>$data,
        );
        return $this->asJson($response);
    }

    /**
     * 获取操作日志类型
     */
    public function getLogType(){
        $action = '  '.strtolower(Yii::$app->controller->action->id);
        $log_type = 1;
        //日志类型 1添加2修改3删除4登录成功5登录失败
        if(strpos($action,'create') !=false){
            $log_type = 1;
        }elseif(strpos($action,'update') !=false){
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
            if(Yii::$app->controller->module->id!='app-backend'){
                $model = Yii::$app->controller->module->id."/".Yii::$app->controller->id;
            }else{
                $model = Yii::$app->controller->id;
            }
            $action = Yii::$app->controller->action->id;
            $data = array(
                'user_id'=>$user_id,
                'username'=>$username,
                'm'=>strtolower($model),
                'a'=>strtolower($action),
                'addtime'=>time(),
                'ip'=>Yii::$app->request->getUserIP(),
                'info'=>$info,
                'log_type'=>$this->getLogType(),
            );
            if($action!='Index'){
                $log_filename = sprintf("%s.%s.%s",str_replace('/','-',$model),$action,'log');//日志文件
                $file_log_text =  sprintf("管理员:%s 应用：%s模块%s方法%s<br>参数%s",
                    $user_id."-".$username,
                    Yii::$app->controller->module->id,
                    Yii::$app->controller->id,
                    Yii::$app->controller->action->id,
                    var_export($_REQUEST,true)
                );
                Log::write($file_log_text,$log_filename,'admin_log');
            }

            $admin_log = new GaAdminLog();
            $admin_log->setAttributes($data);
            $admin_log->save();
        }
    }

    /**
     * 获取搜索条件
     * @return array
     */
    public function getAdminWhere(){
        $where = array();
        if(!in_array(Yii::$app->session['admin_user.group_id'],[1])){
            $where['admin_id'] = Yii::$app->session['admin_user.id'];
        }
     //   var_dump(Yii::$app->session['admin_user.group_id']);
        return $where;
    }

    public function getStaticUrl($file=""){
        if(empty($file)){
            return "";
        }
        return Yii::$app->params['ad.image.url'].'/'.$file;
    }



}