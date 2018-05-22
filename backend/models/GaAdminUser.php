<?php

namespace backend\models;

use Yii;
use backend\services\helpers\Unique;
use backend\models\GaAdminGroup;
use backend\components\exception\LogicException;
/**
 * This is the model class for table "{{%ga_admin_user}}".
 *
 * @property string $id
 * @property string $username
 * @property string $realname
 * @property string $email
 * @property string $password
 * @property string $salt
 * @property string $create_time
 * @property integer $status
 * @property string $mids
 * @property integer $platform_id
 * @property integer $group_id
 * @property string $last_session_id
 * @property string $last_login_time
 */
class GaAdminUser extends \yii\db\ActiveRecord
{

    public function beforeSave($insert){
        if (parent::beforeSave($insert)) {

            if($this->isNewRecord) {
                //throw new LogicException(1000,'错误调试');
                //检查用户名是否已经存在
                $user = GaAdminUser::findOne(['username'=>$this->username]);
                if(!empty($user)){
                    throw new LogicException(LogicException::USER_EXEIST);
                }
                //GaAdminGroup
                $mGaAdminGroup = GaAdminGroup::findOne($this->group_id);
                $salt = Unique::genRandomString(6);//密码盐
                $this->salt = $salt;
                $this->password = $this->genrate_password($this->password,$salt);
                $this->mids = $mGaAdminGroup['mids'];
                $this->create_time = time();//添加时间
            } else {
                if(!empty($this->password) && in_array('password',array_keys($this->dirtyAttributes))){//密码不为空 重新更新密码
                    $salt = Unique::genRandomString(6);//密码盐
                    $this->salt = $salt;
                    $this->password = $this->genrate_password($this->password,$salt);
                }
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ga_admin_user}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username'], 'required'],
            [['password'],'required','on'=>'update'],//更新场景下使用
            [['create_time', 'status', 'platform_id', 'group_id', 'last_login_time'], 'integer'],
            [['mids'], 'string'],
            [['username'], 'string', 'max' => 64],
            [['realname', 'email'], 'string', 'max' => 255],
            [['password', 'last_session_id'], 'string', 'max' => 32],
            [['salt'], 'string', 'max' => 6],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', '用户名'),
            'realname' => Yii::t('app', '真实姓名'),
            'email' => Yii::t('app', '电子邮箱'),
            'password' => Yii::t('app', '密码'),
            'salt' => Yii::t('app', '密码盐'),
            'create_time' => Yii::t('app', '创建时间'),
            'status' => Yii::t('app', '状态 0正常 1删除'),
            'mids' => Yii::t('app', '用户菜单权限'),
            'platform_id' => Yii::t('app', '平台id'),
            'group_id' => Yii::t('app', '分组id'),
            'last_session_id' => Yii::t('app', '上一次登录的session_id'),
            'last_login_time' => Yii::t('app', '最后登录时间'),
        ];
    }

    /**
     * 生成密码
     * @param $password
     * @param $salt
     * @return string
     */
    public function genrate_password($password,$salt){
        return md5($password.md5($salt));
    }
    /***
     * 获取用户状态
     * @return array
     */
    public function get_config_status(){
        return array(
            '-1'=>array('id'=>1,'name'=>'锁定'),
            '0'=>array('id'=>0,'name'=>'正常'),
        );
    }

    /**
     * 账号登录
     * @param $username      用户名
     * @param $password      密码
     * @param int $api_login 是否是api登录
     * @return bool
     */
    public function login($username,$password){
        $admin_user = GaAdminUser::find()->where(array('username'=>$username,'status'=>0))->limit(1)->one();
        if(
            $admin_user&&$this->genrate_password($password,$admin_user['salt'])==$admin_user['password']
        ){
            $admin_group = GaAdminGroup::findOne(['id'=>$admin_user['group_id']]);
            $last_session_id = session_id();
            $last_login_time = time();

            //登录 保存session
            $session = Yii::$app->session;
            $session['admin_user.id'] = $admin_user['id'];
            $session['admin_user.username'] = $admin_user['username'];
            $session['admin_user.mids'] = explode(',',$admin_user['mids']);
            $session['admin_user.last_login_time'] = $admin_user['last_login_time'];
            $session['admin_user.session_id'] = $last_session_id;
            $session['admin_user.platform_id'] = $admin_user['platform_id'];
            $session['admin_user.group_id'] = $admin_user['group_id'];
            $session['admin_user.allow_mutil_login'] = $admin_group['allow_mutil_login'];//是否启用账号踢出功能

            //更新用户
            $admin_user->last_session_id = $last_session_id;
            $admin_user->last_login_time = $last_login_time;
            $admin_user->save(false,['last_session_id','last_login_time']);

            $this->add_login_log($username,$admin_user,1);//登录成功
            return $admin_user;
        }else{
            $this->add_login_log($username,$admin_user,0);//登录失败
            return false;
        }
    }

    /**
     * 写入后台操作日志
     * @param $username
     * @param $admin_user
     * @param int $status
     */
    public function add_login_log($username,$admin_user,$status=0){
        if(empty($admin_user)){//账户错误
            $info = '账户错误';
        }else{
            $info = $status==0?'密码错误':'登录成功';
        }
        $admin_log = new GaAdminLog();
        $data = array(
            'user_id'=>$admin_user['id'],
            'username'=>$username,
            'ip'=>Yii::$app->request->getUserIP(),
            'status'=>$status,
            'info'=>$info,
            'addtime'=>time(),
            'log_type'=>$status==1?4:5,
        );
        $admin_log->setAttributes($data);
        $admin_log->save();
    }
}
