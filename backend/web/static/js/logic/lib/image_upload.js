/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-5-19
 * Time: 下午3:23
 * To change this template use File | Settings | File Templates.
 */
var btnImg = $('.btnImg');
if(btnImg!=undefined){
    $('.btnImg').click(function(){
        $(this).siblings('.submitImg').click();
    });
    $('.submitImg').change(function(){
        $(this).siblings('.btnImg').val("上传中...");
        $(this).parent().submit();
    });

}

