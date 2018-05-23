<?php

namespace backend\modules\cms\models;

use Yii;
use backend\models\Model;

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

    
}
