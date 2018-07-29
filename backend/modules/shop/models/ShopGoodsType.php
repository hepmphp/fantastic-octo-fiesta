<?php

namespace backend\modules\shop\models;

use Yii;

class ShopGoodsType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shop_goods_type}}';
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
           
				 'id' => Yii::t('app', 'ID'),
				 'name' => Yii::t('app', '类型名称'),
				 'addtime' => Yii::t('app', '添加时间'),
        ];
    }

    public function beforeSave($insert){
        if(parent::beforeSave($insert)){
            if($this->isNewRecord){
                $this->addtime = time();
            }
            //update_time//
            return true;
        }else{
            return false;
        }
    }


    
}
