<?php

namespace app\models;

use Yii;

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
            [['parentid', 'status', 'listorder', 'level'], 'integer'],
            [['model', 'action', 'remark'], 'string', 'max' => 255],
            [['data', 'name'], 'string', 'max' => 50],
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
            if($v['parentid']==0){
                $menu['open'] = true;
            }
            $menu_data[] = $menu;
        }
        return $menu_data;

    }
}
