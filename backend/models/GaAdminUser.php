<?php

namespace app\models;

use Yii;
use backend\services\helpers\Unique;
use app\models\GaAdminGroup;
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
            return false;
            if($this->isNewRecord) {
                //GaAdminGroup
                $mGaAdminGroup = GaAdminGroup::findOne($this->group_id);
                $salt = Unique::genRandomString(6);//密码盐
                $this->salt = $salt;
                $this->password = $this->genrate_password($this->password,$salt);
                $this->mids = $mGaAdminGroup['mids'];
                $this->create_time = time();//添加时间
            } else {
                if(!empty($this->password)){
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
            [['username', 'password'], 'required'],
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
}
