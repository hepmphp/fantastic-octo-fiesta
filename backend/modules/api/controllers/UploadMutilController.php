<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-8
 * Time: 上午12:08
 * To change this template use File | Settings | File Templates.
 */

namespace backend\modules\api\controllers;
use Yii;
use yii\web\Controller;;
use yii\web\UploadedFile;
use  backend\modules\api\models\UploadForm;
use  backend\modules\cms\models\CmsAttach;

/**
 * 单文件上传
 * Class UploadSingleController
 * @package backend\modules\api\controllers
 */
class UploadMutilController extends Controller{

    public $layout = false;
    public function actionIndex(){
//        print_r($_FILES);
//        var_dump($_POST);
        $form_name = Yii::$app->request->post('form_name');
        $group_name = Yii::$app->request->post('group_name','admin');
       //  $model = new UploadForm();
     if(Yii::$app->request->isPost){
            $uploader = UploadedFile::getInstanceByName('image');
            $filePath = 'uploads/'.$group_name.'/'.date("Ymd").'/';
            if(!file_exists($filePath)){
               mkdir($filePath,0755,true);
            }
            $uploadFilename =  $filePath.md5($uploader->tempName) . '.' . $uploader->extension;
            $res = $uploader->saveAs($uploadFilename);

            $attch = new CmsAttach();
            list($width, $height, $type, $attr) = getimagesize($uploadFilename);
            $attch->name = $uploader->name;
            $attch->file = $uploadFilename;
            $attch->width = $width;
            $attch->height = $height;
            $attch->size = $uploader->size;
            $attch->ext = $uploader->extension;
            $attch->addtime = time();
            $res = $attch->insert();
            if($res){
                // 文件上传成功
                $response = array(
                    'status'=>0,
                    'msg'=>'',
                    'data'=>array(
                        'id'=>$attch->id,
                        'form_name'=>$form_name,
                        'file_path'=>$uploadFilename,
                        'name'=>$form_name,
                        'url'=>$uploadFilename,
                    )
                );
            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>'保存到数据库失败',
                    'data'=>array(
                        'form_name'=>$form_name
                    )
                );
            }
            $this->asJson($response);
                //跨域 跨域可以使用header跳转
                //      $response_str = http_build_query($response);
                //      header('Location:http://192.168.71.21:10002/index.php?m=image&a=index&'.$response_str);
        }


     }




}