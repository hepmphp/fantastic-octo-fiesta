<?php

namespace backend\modules\cms\models;

use Yii;

class CmsArticle extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cms_article}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status'],'required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
           
				 'id' => Yii::t('app', 'ID'),
				 'cate_id' => Yii::t('app', '分类'),
				 'tag_ids' => Yii::t('app', '标签id  '),
				 'admin_id' => Yii::t('app', '管理员id'),
				 'admin' => Yii::t('app', '用户名'),
				 'title' => Yii::t('app', '标题'),
				 'keywords' => Yii::t('app', '关键词'),
				 'description' => Yii::t('app', '描述'),
				 'content' => Yii::t('app', '内容'),
				 'addtime' => Yii::t('app', '添加时间'),
				 'update_time' => Yii::t('app', '更新时间'),
				 'is_top' => Yii::t('app', '是否置顶'),
				 'list_image_url' => Yii::t('app', '列表显示图片'),
				 'status' => Yii::t('app', '状态'),
        ];
    }

    public static function get_config_is_top(){
            return [
                0=>['id'=>0,'name'=>'普通'],
				1=>['id'=>1,'name'=>'置顶'],
				2=>['id'=>2,'name'=>'头条'],

            ];
    }

	public static function get_config_status(){
            return [
                0=>['id'=>0,'name'=>'正常'],
				-1=>['id'=>-1,'name'=>'删除'],

            ];
    }

}
