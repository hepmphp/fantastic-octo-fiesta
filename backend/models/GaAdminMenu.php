<?php

namespace backend\models;

use Yii;
use backend\services\helpers\Tree;
use backend\services\helpers\Log;

/**
 * This is the model class for table "{{%ga_admin_menu}}".
 *
 * @property integer $id
 * @property integer $parentid
 * @property string $model
 * @property string $action
 * @property string $data
 * @property integer $status
 * @property string $name
 * @property string $remark
 * @property integer $listorder
 * @property integer $level
 */
class GaAdminMenu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%ga_admin_menu}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['parentid', 'status','level','top_menu_id'], 'integer'],
            [['model', 'action', 'remark'], 'string', 'max' => 255],
            [['data', 'name'], 'string', 'max' => 50],
            ['listorder','default','value'=>0]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'parentid' => Yii::t('app', '菜单上一级id'),
            'model' => Yii::t('app', '控制器'),
            'action' => Yii::t('app', '方法'),
            'data' => Yii::t('app', '业务数据'),
            'status' => Yii::t('app', '菜单状态 -1 隐藏  0正常'),
            'name' => Yii::t('app', '菜单名称'),
            'remark' => Yii::t('app', '备注'),
            'listorder' => Yii::t('app', '排序ID'),
            'level' => Yii::t('app', '菜单级别 0 1 2 3 4 依次递增'),
        ];
    }
    /***
     * 保存数据库之前的处理
     * @param bool $insert
     * @return bool
     */
    public function beforeSave($insert){
        if(parent::beforeSave($insert)){
            if($this->isNewRecord){

            }
            $admin_menu = GaAdminMenu::findOne(['id'=>$this->parentid]);
            if(isset($admin_menu['level']) && is_numeric($admin_menu['level'])){
                $this->level = $admin_menu['level']+1;
            }else{
                $this->level = 0;
            }
            $parent_menu = GaAdminMenu::findOne(['id'=>$this->parentid]);
            
            if($parent_menu){
                $this->top_menu_id = $parent_menu['parentid']==0?$parent_menu['id']:$parent_menu['top_menu_id'];
            }
            if(!$this->isNewRecord && empty($this->top_menu_id) && $this->id){//顶级菜单更新
                $this->top_menu_id = $this->id;
            }
            $this->top_menu_id = $parent_menu['top_menu_id'];
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
        //修改top_menu_id
        if($insert){
           // Log::write(var_export($this->attributes,true),'common');
            if($this->level==0){
                $this->top_menu_id = $this->id;
            }else{
                //查找父类的顶层id
                $parent_menu = GaAdminMenu::findOne(['id'=>$this->parentid]);
                $this->top_menu_id = $parent_menu['top_menu_id'];
            }
            $this->save(false,['top_menu_id']);
        }
    }

    /***
     * 获取菜单状态
     * @return array
     */
    public function get_config_status(){
        return array(
            '-1'=>array('id'=>-1,'name'=>'隐藏'),
            '0'=>array('id'=>0,'name'=>'显示'),
        );
    }

    /**
     * 获取菜单数据
     * @param $where
     * @return array
     */
    public function getMenuData($where){
        $mAdminMenu = GaAdminMenu::find()->where($where)->asArray(true);
        $data = $mAdminMenu->limit(100000)->all();
        $menu_data = array();
        foreach($data as $k=>$v){
            $menu = array(
                'id'=>$v['id'],
                'pId'=>$v['parentid'],
                'name'=>$v['name'],
            );
            /*
            if($v['parentid']==0){
                $menu['open'] = true;
            }*/
            $menu_data[] = $menu;
        }
        return $menu_data;
    }

    /**
     * 获取菜单配置
     * @param null $parentid
     * @param null $app_id
     * @return mixed
     */
    public function get_config_menu($parentid=null,$level=null){
        $tree = new Tree();

        $query = GaAdminMenu::find();
        if(!empty($level)){
            $and_where = ['<=','level',$level];
            $query->andWhere($and_where);
        }
        $admin_menu = $query->asArray(true)->all();
        foreach ($admin_menu as $r) {
            if($parentid !=null){
                $r['selected'] = $r['id'] == $parentid ? 'selected' : '';
            }else{
                $r['selected'] = '';
            }

            $array[] = $r;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$name</option>";
        $tree->init($array);
        $select_categorys = $tree->get_tree(0, $str);
        return $select_categorys;
    }
    /***
     *
     * 获取树形菜单
     * @param null $parentid
     * @return Tree
     */
    public function get_menu_tree($parentid=null){
        $tree = new Tree();
        $admin_menu = GaAdminMenu::find()->where(1)->asArray(true)->all();
        foreach ($admin_menu as $r) {
            if($parentid !=null){
                $r['selected'] = $r['id'] == $parentid ? 'selected' : '';
            }else{
                $r['selected'] = '';
            }

            $array[] = $r;
        }
        $tree->init($array);
        return $tree;
    }


}
