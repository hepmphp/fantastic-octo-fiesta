<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome.css" rel="stylesheet">
    <link href="/static/css/animate.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/screen.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <script src="/static/js/html5shiv.min.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg login-bg">
<div id="particles-js"></div>
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div class="logo-bg">
        <h1 class="logo-name"><img src="/static/images/logo.png" alt="服务器信息管理系统" width="234" height="234"></h1>
        <form class="m-t" role="form" action="index.html">
            <div class="validation-tips"><p style="display: none;">帐号或密码错误，你还有5次尝试激活</p></div>
            <div class="form-group">
                <input type="text" id="username" name="username" class="form-control" placeholder="输入管理员帐号" required="">
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="输入帐号密码" required="">
            </div>
            <div class="form-group yzm-item" >
                <input type="text" id="verify_code" name="verify_code" class="form-control" placeholder="输入图片验证码" style="width: 190px" required="">
                <span class="form-explain"><img src="?r=api/captcha/index" class="yzm-img" width="110" height="40"></span>
            </div>
            <button type="button" class="btn btn-info block full-width m-b" onclick="do_login()">登 录</button>

        </form>
    </div>
</div>
</body>

<script type="text/javascript" src="/static/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/layer/layer.js"></script>
<script type="text/javascript">
    layer.config({
        skin:'layer-ext-moon',
        extend:'moon/style.css'
    });
    function do_login(){
        var username = $('#username').val();
        var password = $('#password').val();
        var verify_code = $('#verify_code').val();
        if(username==''){
            layer.msg('请填写用户名',{icon: 2});
            return false;
        }
        if(username==''){
            layer.alert('请填写密码',{icon: 2});
            return false;
        }
        if(verify_code==''){
            layer.alert('请填写验证码',{icon: 2});
            return false;
        }
        var param ={
            username:username,
            password:password,
            code:verify_code
        };
        $.ajax({
            type:'POST',
            url:"?r=site/ajax-login",
            data:param,
            dataType:'json',
            success:function(data){
                if(data.status==0){
                    window.location.href = data.data.url;
                }else{
                    layer.alert(data.info, {icon: 2});
                }
            }
        });
    }
    $('.yzm-img').click(function(){
        $.getJSON('?r=api/captcha/index&refresh=1',function(data){
            if(data.status==0){
                $('.yzm-img').attr('src',data.data.captcha_url);
            }
//            console.log(data);
        })
    });
    $(document).ready(function() {
        $("#verify_code").keydown(function(e) {
            var curKey = e.which;
            if (curKey == 13) {
                $('#form1').submit();
                return false;
            }
        });
    });
</script>

</html>
