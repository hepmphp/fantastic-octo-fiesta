<?php

namespace backend\modules\cms\models;

use Yii;
use backend\models\Model;

class CmsTag extends Model
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cms_tag}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [

            [['name'],'required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [

            'id' => Yii::t('app', ''),
            'name' => Yii::t('app', '标签名称'),
            'addtime' => Yii::t('app', '添加时间'),
        ];
    }

    public function beforeSave($insert){
        if(parent::beforeSave($insert)){
            if($this->isNewRecord){
                $this->addtime = time();
            }
            return true;
        }else{
            return false;
        }
    }


} 