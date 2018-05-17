<?php

namespace app\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%ga_admin_group}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $comment
 * @property string $mids
 * @property integer $allow_mutil_login
 * @property integer $addtime
 */
class GaAdminGroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ga_admin_group}}';
    }

   
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['mids'], 'string'],
            [['allow_mutil_login', 'addtime'], 'integer'],
            [['name', 'comment'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', '分组名称'),
            'comment' => Yii::t('app', '分组说明'),
            'mids' => Yii::t('app', '用户组权限id'),
            'allow_mutil_login' => Yii::t('app', '允许多人登录 0否 1是'),
            'addtime' => Yii::t('app', '添加时间'),
        ];
    }

    public function get_config_group_id($where=array()){

        $admin_group =   GaAdminGroup::find()->select('id,name')->where($where)->asArray(true)->all();
        $config_admin_group_id = ArrayHelper::index($admin_group,'id');
        return $config_admin_group_id;
    }
}
