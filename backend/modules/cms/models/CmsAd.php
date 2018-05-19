<?php

namespace backend\modules\cms\models;

use Yii;

class CmsAd extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cms_ad}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['block_id','title','pic_url','link_address','addtime','start_time','end_time','listorder','status','is_mobile'],'required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
           
				 'id' => Yii::t('app', '广告id'),
				 'block_id' => Yii::t('app', '广告位置'),
				 'title' => Yii::t('app', '广告标题'),
				 'pic_url' => Yii::t('app', '图片链接'),
				 'link_address' => Yii::t('app', '广告地址'),
				 'addtime' => Yii::t('app', '添加时间'),
				 'start_time' => Yii::t('app', '开始时间'),
				 'end_time' => Yii::t('app', '结束时间'),
				 'listorder' => Yii::t('app', '排序'),
				 'status' => Yii::t('app', '状态'),
				 'is_mobile' => Yii::t('app', 'm版'),
        ];
    }

    public function beforeSave($insert){
        if(parent::beforeSave($insert)){
            if($this->isNewRecord){
                $this->addtime = time();
            }
            $this->start_time = strtotime($this->start_time);
            $this->end_time = strtotime($this->end_time);
            return true;
        }else{
            return false;
        }
    }

    public static function getConfigStatus(){
        return [
            0=>['id'=>0,'name'=>'启用'],
            1=>['id'=>-1,'name'=>'禁用'],
        ];
    }
    public static function getConfigisMobile(){
        return [
            0=>['id'=>0,'name'=>'是'],
            1=>['id'=>-1,'name'=>'否'],
        ];
    }
}
