<?php

namespace backend\modules\cms\models;

use Yii;
use backend\models\Model;
use backend\services\helpers\Log;

class CmsArticleCategory extends Model
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cms_article_category}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
           [['name','parent_id','description'],'required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
             'id' => Yii::t('app', 'id'),
             'name' => Yii::t('app', '名称'),
             'parent_id' => Yii::t('app', '父级id'),
             'description' => Yii::t('app', '描述'),
        ];
    }

    public function beforeSave($insert){
        if(parent::beforeSave($insert)){
            if($this->isNewRecord){
                //parent_id

            }
            return true;
        }else{
            return false;
        }
    }

    /***
     * 保存
     * @param bool $insert
     * @param array $changedAttributes
     */
    public function afterSave($insert,$changedAttributes){
        parent::afterSave($insert,$changedAttributes);
        if($this->parent_id==0){
            $this->path  =0;
            $this->level =0;
        }else{
            //查找父类的顶层id
            $parent_menu = CmsArticleCategory::findOne(['id'=>$this->parent_id]);
            $this->level = $parent_menu['level']+1;
            $this->path =  $parent_menu['path'].",".$this->id;
        }
       // Log::write("update....".var_export($this->attributes,true),'common');
        $this->updateAll(['level'=>$this->level,'path'=>$this->path],['id'=>$this->id]);

    }

    public function afterUpdate(){
        Log::write(__FUNCTION__,var_export($this->attributes,true),'common');
    }


    
}
