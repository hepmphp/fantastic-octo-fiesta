<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%ga_platform}}".
 *
 * @property string $id
 * @property string $sign
 * @property string $name
 * @property string $ip_list
 * @property string $domain
 */
class GaPlatform extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ga_platform}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'sign', 'name'], 'string', 'max' => 20],
            [['ip_list'], 'string', 'max' => 10000],
            [['domain'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '平台id'),
            'sign' => Yii::t('app', '标识'),
            'name' => Yii::t('app', '平台名称'),
            'ip_list' => Yii::t('app', 'ip列表 用,分隔'),
            'domain' => Yii::t('app', '域名'),
        ];
    }
}
