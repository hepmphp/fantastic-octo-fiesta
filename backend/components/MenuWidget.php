<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-12
 * Time: 下午3:41
 * To change this template use File | Settings | File Templates.
 */

namespace backend\components;
use yii\base\Widget;
use app\models\GaAdminMenu;
class MenuWidget extends Widget{

    public $menu;
    public $current_top_menu_id;
    public $admin_access;
    public function init()
    {
        parent::init();
        if ($this->menu === null) {
           $this->menu = "false";
        }

    }

    public function run()
    {
        return $this->render('menu',['menu'=>$this->menu,'tree_menu'=>(new GaAdminMenu)->get_menu_tree(),'current_top_menu_id'=>$this->current_top_menu_id,'admin_access'=>$this->admin_access]);
    }
}