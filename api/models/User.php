<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-18
 * Time: 下午1:54
 * To change this template use File | Settings | File Templates.
 */
namespace api\models;
use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use yii\web\IdentityInterface;
use yii\filters\RateLimitInterface;

class User extends ActiveRecord implements IdentityInterface,RateLimitInterface{

    public function behaviors(){
        return [
            [
              'class'=>TimestampBehavior::className(),
              'createdAtAttribute'=>'created_at',
              'updatedAtAttribute'=>'updated_at',
               'attributes'=>[
                    ActiveRecord::EVENT_BEFORE_INSERT=>['created_at','updated_at'] ,
                    ActiveRecord::EVENT_BEFORE_UPDATE=>['updated_at'],
                ],

            ]
        ];
    }

    public static function tableName(){
        return "{{%user%}}";
    }
    //规则
    public function rules()
    {
        return [
            ['username', 'required', 'message' => '用户名不能为空'],
            ['access_token', 'required', 'message' => 'access_token不能为空']
        ];
    }

    public static function findIdentity($id){
        return static::findOne(['id'=>$id]);
    }

    public static function findIdentityByAccessToken($token,$type=null){
        return static::findOne(['access_token'=>$token]);
    }

    public static function findByUsername($username){
        return static::findOne(['username'=>$username]);
    }

    /**
     * 生成access_token
     * @param $user_id
     * @return string
     */
    public function generateAccessToken(){
        //生成token
        $time = time();
        $token = hash_hmac('md5',$this->id.$time,Yii::$app->params['user.apiTokenKey']);
        $expire_at =  $time +Yii::$app->params['user.apiTokenTime'];
        $this->access_token = $token;
        $this->expire_at = $expire_at;
        $this->save(false,['access_token','expire_at']);
        return $this->access_token;
    }

    /**
     * 验证token是否是正确的
     * @param $token
     * @return bool
     */
    public function validateAccessToken($token){
        if($this->expire_at<time()){//token过期
            return false;
        }
        if($this->access_token===$token){//ok
            return true;
        }else{
            return false;//无效token
        }
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }


    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }


    public function getId(){
        return $this->id;
    }

    public function getAuthKey(){
        return $this->auth_key;
    }

    public function validateAuthKey($authKey){
        return $this->auth_key === $authKey;

    }


    # 速度控制  2秒内访问3次，注意，数组的第一个不要设置1，设置1会出问题，一定要
    #大于2，譬如下面  2秒内只能访问三次
    # 文档标注：返回允许的请求的最大数目及时间，例如，[100, 600] 表示在600秒内最多100次的API调用。
    public  function getRateLimit($request, $action){
        return [3, 2];
    }

    # 文档标注： 返回剩余的允许的请求和相应的UNIX时间戳数 当最后一次速率限制检查时。
    public  function loadAllowance($request, $action){
        //return [1,strtotime(date("Y-m-d H:i:s"))];
        //echo $this->allowance;exit;
        return [$this->allowance, $this->allowance_updated_at];
    }

    # allowance 对应user 表的allowance字段  int类型
    # allowance_updated_at 对应user allowance_updated_at  int类型
    # 文档标注：保存允许剩余的请求数和当前的UNIX时间戳。
    public  function saveAllowance($request, $action, $allowance, $timestamp){
        $this->allowance = $allowance;
        $this->allowance_updated_at = $timestamp;
        $this->save();
    }




}