<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-8
 * Time: 上午12:33
 * To change this template use File | Settings | File Templates.
 */

namespace backend\modules\api\models;
use yii\base\Model;

class UploadForm extends Model{

    /**
     * @var UploadedFile
     */
    public $ssiupload;

    public $uploadFilename;


    public function rules()
    {
        return [
            ['ssiupload', 'file', 'skipOnEmpty' => false, 'extensions' => 'png, jpg,pdf'],
        ];
    }

    public function upload()
    {
        if ($this->validate()) {
            //$this->ssiupload->tempName = iconv("UTF-8", "GB2312",$this->ssiupload->tempName);
            $filePath = 'uploads/'.date("Ymd").'/';
            if(!file_exists($filePath)){
                mkdir($filePath,0755,true);
            }
            $this->uploadFilename =  $filePath.md5($this->ssiupload->tempName) . '.' . $this->ssiupload->extension;
            $this->ssiupload->saveAs($this->uploadFilename);
            return true;
        } else {
            return false;
        }
    }

}