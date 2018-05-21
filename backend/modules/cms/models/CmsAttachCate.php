<?php

namespace backend\modules\cms\models;

use Yii;
use backend\models\Model;
/**
 * This is the model class for table "{{%cms_attach_cate}}".
 *
 * @property int $id
 * @property int $pid 父类id
 * @property string $name 附件分类名称
 * @property int $addtime 添加时间
 */
class CmsAttachCate extends Model
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cms_attach_cate}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 255],
        ];
    }


    public function beforeSave($insert){
        if (parent::beforeSave($insert)) {
            if($this->isNewRecord) {
                $this->addtime = time();//添加时间
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => '父类id',
            'name' => '附件分类名称',
            'addtime' => '添加时间',
        ];
    }

    public function getAutoCompeleteSearch($keywords){
        $where = ['like', 'name',$keywords];
      //  var_dump($where);
        $attach_cate =  CmsAttachCate::find()->select('id,name')->andFilterWhere($where)->limit(30)->asArray(true)->all();
        $result  = array();
        foreach($attach_cate as $key=>$v){
            $result[] = array(
                'id'=>$v['id'],
                'name'=>$v['name'],
                'full_name'=>$v['name'],
                'text'=>$v['name']
//                'label'=>$v['name'],
//                'value'=>$v['name']
            );
        }
        return $result;
    }
}
