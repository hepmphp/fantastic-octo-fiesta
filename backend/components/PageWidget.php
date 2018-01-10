<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-10
 * Time: 下午1:58
 * To change this template use File | Settings | File Templates.
 */

namespace app\components;
use yii\base\Widget;
use yii\helpers\Html;

/**
 * 分页组件
 * Class PageWidget
 * @package app\components
 */
class PageWidget extends Widget{

    public $page;
    public function init()
    {
        parent::init();
        if ($this->page === null) {
            $this->page = 'Hello World';
        }
    }

    public function run()
    {
        return $this->render('page',['page'=>$this->page]);
    }

}