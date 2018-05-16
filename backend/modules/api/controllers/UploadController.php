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

class UploadController extends Controller{

    public $layout = false;
    public function actionIndex(){
         $model = new UploadForm();
         if(Yii::$app->request->isPost){
            $model->ssiupload = UploadedFile::getInstanceByName('ssiupload');
//            var_dump($model->ssiupload);
            if ($model->upload()) {
                $attch = new CmsAttach();
                list($width, $height, $type, $attr) = getimagesize($model->uploadFilename);
                $attch->name = $model->ssiupload->name;
                $attch->file = $model->uploadFilename;
                $attch->width = $width;
                $attch->height = $height;
                $attch->size = $model->ssiupload->size;
                $attch->ext = $model->ssiupload->extension;
                $attch->addtime = time();
                $res = $attch->insert();
                if($res){
                    // 文件上传成功
                    $response = array(
                        'status'=>0,
                        'msg'=>'',
                        'data'=>array(
                            'id'=>$attch->id,
                        )
                    );
                }else{
                    $response = array(
                        'status'=>-1,
                        'msg'=>'保存到数据库失败',
                        'data'=>array()
                    );
                }

            }else{
                $response = array(
                    'status'=>-1,
                    'msg'=>$model->errors,
                    'data'=>array()
                );
            }
            $this->asJson($response);
         }


    }

}