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
use yii\base\Response;

/**
 * 单文件上传
 * Class UploadSingleController
 * @package backend\modules\api\controllers
 */
class UploadUmeditorController extends Controller{

    public $layout = false;
    public function actionIndex(){
        header('Access-Control-Allow-Origin:*');
        header("Content-Type:text/html;charset=utf-8");
//        print_r($_FILES);
//        var_dump($_POST);exit();
//        $form_name = Yii::$app->request->post('form_name');
       //  $model = new UploadForm();
     if(Yii::$app->request->isPost){
            $uploader = UploadedFile::getInstanceByName('upfile');
            $filePath = 'uploads/'.date("Ymd").'/';
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
                    "state" => "SUCCESS",
                    "url" => $attch->file,
                    "title" =>$attch->name,
                    "original" => $attch->name,
                    "type" => $type,
                    "size" => $attch->size
                );
            }else{
                $response = array(
                    "state" => "ERROR_UNKNOWN",
                    "url" => "",
                    "title" => "",
                    "original" => "",
                    "type" =>"",
                    "size" =>""
                );
            }
         //Yii::$app->response->format= "html";
         echo json_encode($response,true);
//         $this->asJson($response);
         /**
        //上传状态映射表，国际化用户需考虑此处数据的国际化
         "SUCCESS", //上传成功标记，在UEditor中内不可改变，否则flash判断会出错
         "文件大小超出 upload_max_filesize 限制",
         "文件大小超出 MAX_FILE_SIZE 限制",
         "文件未被完整上传",
         "没有文件被上传",
         "上传文件为空",
         "ERROR_TMP_FILE" => "临时文件错误",
         "ERROR_TMP_FILE_NOT_FOUND" => "找不到临时文件",
         "ERROR_SIZE_EXCEED" => "文件大小超出网站限制",
         "ERROR_TYPE_NOT_ALLOWED" => "文件类型不允许",
         "ERROR_CREATE_DIR" => "目录创建失败",
         "ERROR_DIR_NOT_WRITEABLE" => "目录没有写权限",
         "ERROR_FILE_MOVE" => "文件保存时出错",
         "ERROR_FILE_NOT_FOUND" => "找不到上传文件",
         "ERROR_WRITE_CONTENT" => "写入文件内容错误",
         "ERROR_UNKNOWN" => "未知错误",
         "ERROR_DEAD_LINK" => "链接不可用",
         "ERROR_HTTP_LINK" => "链接不是http链接",
         "ERROR_HTTP_CONTENTTYPE" => "链接contentType不正确",
         "INVALID_URL" => "非法 URL",
         "INVALID_IP" => "非法 IP"
         );
          */
         /**
          */

                //跨域 跨域可以使用header跳转
                //      $response_str = http_build_query($response);
                //      header('Location:http://192.168.71.21:10002/index.php?m=image&a=index&'.$response_str);
        }


     }




}