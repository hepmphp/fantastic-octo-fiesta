<?php

namespace backend\modules\cms\models;

use Yii;

class CmsAdBlock extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cms_ad_block}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            
				 ['name','required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
           
				 'id' => Yii::t('app', '自增id'),
				 'name' => Yii::t('app', '区块名称'),
				 'addtime' => Yii::t('app', '添加时间'),
        ];
    }
}
