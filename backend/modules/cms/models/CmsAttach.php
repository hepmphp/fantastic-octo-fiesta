<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-9
 * Time: 上午12:20
 * To change this template use File | Settings | File Templates.
 */

namespace backend\modules\cms\models;
use yii\db\ActiveRecord;

class CmsAttach extends ActiveRecord {
    /**
     * @return string Active Record 类关联的数据库表名称
     */
    public static function tableName()
    {
        return '{{cms_attach}}';
    }
}