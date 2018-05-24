<?php

namespace backend\modules\cms\models;

use Yii;
use backend\models\Model;

class CmsArticle extends Model
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

            [['cate_id','tag_ids','title','keywords','description','content','is_top','list_image_url','status'],'required','message'=>'{attribute}不能为空!'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [

            'id' => Yii::t('app', ''),
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

    public function beforeSave($insert){
        if(parent::beforeSave($insert)){
            if($this->isNewRecord){
                $this->addtime = time();
                $this->admin_id =Yii::$app->session['admin_user.id'];
                $this->admin = Yii::$app->session['admin_user.username'];
            }
            $this->update_time=time();
            return true;
        }else{
            return false;
        }
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