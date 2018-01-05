<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%ga_admin_log}}".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $platform_id
 * @property string $username
 * @property string $ip
 * @property string $m
 * @property string $a
 * @property string $addtime
 * @property integer $log_type
 * @property string $info
 * @property integer $status
 */
class GaAdminLog extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ga_admin_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'platform_id', 'addtime', 'log_type', 'status'], 'integer'],
            [['username', 'm', 'a'], 'string', 'max' => 50],
            [['ip'], 'string', 'max' => 16],
            [['info'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', '用户id'),
            'platform_id' => Yii::t('app', '平台id'),
            'username' => Yii::t('app', '用户名'),
            'ip' => Yii::t('app', 'ip地址'),
            'm' => Yii::t('app', '控制器'),
            'a' => Yii::t('app', '方法'),
            'addtime' => Yii::t('app', '添加时间'),
            'log_type' => Yii::t('app', '日志类型 1添加2修改3删除4登录成功5登录失败'),
            'info' => Yii::t('app', '操作说明'),
            'status' => Yii::t('app', '登录状态 1成功0失败'),
        ];
    }
}
