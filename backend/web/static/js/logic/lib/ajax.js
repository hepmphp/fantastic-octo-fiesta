/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-5-22
 * Time: 上午11:35
 * To change this template use File | Settings | File Templates.
 */
/***
 * ajax通用请求封装
 * @param url
 * @param param
 */
function ajax_post(url,param){
    layer.load(2);
    $.ajax({
        type:"POST",
        url: url,
        data:  param,
        timeout:"4000",
        dataType:'json',
        success: function(data){
            if (data.status == 0) {
                layer.closeAll('loading');
                alert_success(data.msg);
            }
            else {
                layer.closeAll('loading');
                alert_fail(data.msg);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);
            console.log(XMLHttpRequest.readyState);
            console.log(textStatus);
            console.log(errorThrown);
            console.log(XMLHttpRequest.responseText);
            var result = jQuery.parseJSON(XMLHttpRequest.responseText);
            console.log(result);
            layer.closeAll('loading');
            alert_fail(result.msg);
        },
        complete: function(XMLHttpRequest, textStatus) {
            // console.log(textStatus);
            //this; // 调用本次AJAX请求时传递的options参数
        }
    });
}

function ajax_post_alert_success(url,param){
    layer.load(2);
    $.ajax({
        type:"POST",
        url: url,
        data:  param,
        timeout:"4000",
        dataType:'json',
        success: function(data){
            if (data.status == 0) {
                layer.closeAll('loading');
                alert_success_sub(data.msg);
            }
            else {
                layer.closeAll('loading');
                alert_fail(data.msg);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);
            console.log(XMLHttpRequest.readyState);
            console.log(textStatus);
            console.log(errorThrown);
            console.log(XMLHttpRequest.responseText);
            var result = jQuery.parseJSON(XMLHttpRequest.responseText);
            console.log(result);
            layer.closeAll('loading');
            alert_fail(result.msg);
        },
        complete: function(XMLHttpRequest, textStatus) {
            // console.log(textStatus);
            //this; // 调用本次AJAX请求时传递的options参数
        }
    });
}



/***
 * ajax通用请求封装
 * @param url
 * @param param
 */
function ajax_get(url,param){
    layer.load(2);
    $.ajax({
        type:"GET",
        url: url,
        data:  param,
        timeout:"4000",
        dataType:'json',
        success: function(data){
            if (data.status == 0) {
                layer.closeAll('loading');
                alert_success(data.msg);
            }
            else {
                layer.closeAll('loading');
                alert_fail(data.msg);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);
            console.log(XMLHttpRequest.readyState);
            console.log(textStatus);
            console.log(errorThrown);
            console.log(XMLHttpRequest.responseText);
            var result = jQuery.parseJSON(XMLHttpRequest.responseText);
            console.log(result);
            layer.closeAll('loading');
            alert_fail(result.msg);
        },
        complete: function(XMLHttpRequest, textStatus) {
            // console.log(textStatus);
            //this; // 调用本次AJAX请求时传递的options参数
        }
    });
}

/***
 * ajax通用请求封装
 * @param url
 * @param param
 */
function ajax_get_alert_success(url,param){
    layer.load(2);
    $.ajax({
        type:"GET",
        url: url,
        data:  param,
        timeout:"4000",
        dataType:'json',
        success: function(data){
            if (data.status == 0) {
                layer.closeAll('loading');
                alert_success_sub(data.msg);
            }
            else {
                layer.closeAll('loading');
                alert_fail(data.msg);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest.status);
            console.log(XMLHttpRequest.readyState);
            console.log(textStatus);
            console.log(errorThrown);
            console.log(XMLHttpRequest.responseText);
            var result = jQuery.parseJSON(XMLHttpRequest.responseText);
            console.log(result);
            layer.closeAll('loading');
            alert_fail(result.msg);
        },
        complete: function(XMLHttpRequest, textStatus) {
            // console.log(textStatus);
            //this; // 调用本次AJAX请求时传递的options参数
        }
    });
}


/***
 * 成功
 * @param msg
 */
function alert_success(msg){
    layer.confirm(msg,{
        btn: ['确定'], //按钮
        shade: false, //不显示遮罩,
        icon:1
    }, function(){
        window.location.reload();
    });
}
/***
 *
 * @param msg
 * @param url
 */
function alert_success_url(msg,url){
    layer.confirm(msg,{
        btn: ['确定'], //按钮
        shade: false, //不显示遮罩,
        icon:1
    }, function(){
        window.location.href=url;
    });
}


function alert_success_sub(msg){
    layer.alert(msg, {icon:1});
}
/***
 * 失败弹窗
 * @param msg
 */
function alert_fail(msg){
    layer.alert(msg, {icon:2});
}