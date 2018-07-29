<?php

namespace backend\modules\shop\models;

use Yii;

class ShopGoodsSpec extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%shop_goods_spec}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
             [['cate_id','name','items','rank'],'required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
           
				 'id' => Yii::t('app', 'ID'),
				 'cate_id' => Yii::t('app', '商品类型'),
				 'name' => Yii::t('app', '规格名称'),
				 'items' => Yii::t('app', '规格项'),
				 'rank' => Yii::t('app', '排序'),
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
