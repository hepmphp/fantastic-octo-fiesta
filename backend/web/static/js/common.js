/*根据浏览器大小改变*/
function demo(){
$(".Business-back").height($(window).height()-60);
$(".Business-right").width($(".Business-back").width() - 180);
$(".left-Catalog").height($(".Business-left").height() - 140)
$(".Business-right").removeClass('transition');
$(".Business-left").removeClass('transition');
if ($(".Business-left").hasClass("left_0")) {
$(".Business-right").width($(".Business-back").width() - 180);      
}else if ($(".Business-left").hasClass("left_275")){
 $(".Business-right").width($(".Business-back").width() - 45);       
}

}
$(document).ready(function() {
	demo();
});
 $(window).resize(function(){
	demo();
});


/*退出账号*/
$(function(){
	$('.user-item').click(function(){
		$('.user-con').slideToggle();
	})
})
/*左侧导航*/
$(".list-teggol").on("click",function () {
$('.Computer-infor').hide();
$('.ssion-dd').stop();
$(this).parent().siblings('dt').removeAttr('id');
if($(this).parent().attr('id')=='open'){
    $(this).parent().removeAttr('id').siblings('dd').slideUp();
}else{
    $(this).parent().attr('id','open').next().slideToggle().siblings('dd').slideUp().siblings('dt');
}
});

$(".fa-database").click(function() {
	$(this).siblings('.Computer-infor').toggle();
})
/*iframe 链接*/
$(".J_menuItem").on('click',function(){
var url = $(this).attr('href');
$("#J_iframe").attr('src',url);
$(this).parent('li').addClass('on').siblings('li').removeClass('on');
$(this).parents('.nav-toggle').siblings().find('li').removeClass('on');
$(this).parents('.leftnav-view').siblings('.nav-open').addClass('selected');
$(this).parents('.nav-toggle').siblings().find('.nav-open').removeClass('selected');
return false;
});
/*左侧栏目 滑动*/
$(function(){
	$(".Slide-left").click(function(){
		$(".Business-right").addClass('transition');
		$(".Business-left").addClass('transition');
	 if($(".Business-left").hasClass("left_0")) {
	   $(".Business-left").removeClass("left_0").addClass("left_275"); 
	   $(".Business-right").width($(".Business-back").width() - 45);
	   $(".Slide-left").addClass('shift');
		}else if ($(".Business-left").hasClass("left_275")){
        $(".Business-left").removeClass("left_275").addClass("left_0"); 
       $(".Business-right").width($(".Business-back").width() - 180); 
       $(".Slide-left").removeClass('shift');
		}

	})
})
/*$(function(){
setTimeout(function(){
$(".Business-right").addClass('transition');
$(".Business-left").addClass('transition');
$(".Business-left").removeClass("left_0").addClass("left_275"); 
$(".Business-right").width($(".Business-back").width() - 45); 
$(".Slide-left").addClass('shift'); 
},2000);
})*/
$(function(){
	$('.nav-open').click(function(){
		$(this).next('ul').slideToggle();
	})
});


/**
 * layer初始化配置
 */
layer.config({
    skin:'layer-ext-moon',
    extend:'moon/style.css'
});

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

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
/*
$('.date-range').dateRangePicker(
    {
        separator : ' to ',
        format: 'YYYY-MM-DD',
        endDate: moment(),
        getValue: function()
        {

            if ($('.date-range00').val() && $('.date-range01').val() )
                return $('.date-range00').val() + ' 至 ' + $('.date-range01').val();
            else
                return '';
        },
        setValue: function(s,s1,s2)
        {
            $('.date-range00').val(s1);
            $('.date-range01').val(s2);
        },
        defaultTime: moment().subtract(1, 'month').startOf('month').startOf('day').toDate(),
        defaultEndTime: moment().endOf('day').toDate()
    });
$(function () { $(".popover-options a").popover({
    html : true
});});*/


