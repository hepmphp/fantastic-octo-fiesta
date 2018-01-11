<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>错误页面</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!--全局样式-->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/screen.css" rel="stylesheet">
    <!--图标-->
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">


    <!--mobile 样式-->
    <link href="/static/css/mobile.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <script src="/static/js/html5shiv.min.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body >
<style>
    .col-sm-12, .page-content>.row .col-xs-12 {
        float: left;
        max-width: 100%;
    }
    .error-container {
        margin: 20px;
        padding: 0;
        background: #FFF;
    }
    .alert, .well {
        border-radius: 0;
    }

    .bigger-125 {
        font-size: 125%!important;
    }
    .blue {
        color: #478FCA!important;
    }
    .ace-icon {
        text-align: center;
    }
    .well h1, .well h2, .well h3 {
        line-height: 36px;
    }

    .well h1, .well h2, .well h3, .well h4, .well h5, .well h6 {
        margin-top: 0;
    }

    h3.smaller {
        font-size: 21px;
    }

    .lighter {
        font-weight: lighter;
    }
    .space {
        max-height: 1px;
        min-height: 1px;
        overflow: hidden;
        margin: 12px 0;
    }
    .align-center, .center {
        text-align: center!important;
    }
    .btn-primary, .btn-primary.focus, .btn-primary:focus {
        background-color: #428BCA!important;
        border-color: #428BCA;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <div class="error-container">
            <div class="well">
                <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-random"></i>
												错误提示
											</span>
                </h1>
                <hr>
                <h3 class="lighter smaller">
                    系统出错
                    <i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
                </h3>
                <div class="space"></div>
                <div>
                    <h4 class="lighter smaller">详情:</h4>
                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            错误代码:<?=$exception->getCode()?>
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            详情:<?=$exception->getMessage()?>
                        </li>
                    </ul>
                </div>
                <hr>
                <div class="space"></div>
                <div class="center">
                    <a href="javascript:history.back()" class="btn btn-grey">
                        <i class="ace-icon fa fa-arrow-left"></i>
                        返回
                    </a>
                    <!--
                    <a href="#" class="btn btn-primary">
                        <i class="ace-icon fa fa-tachometer"></i>
                        Dashboard
                    </a>-->
                </div>
            </div>
        </div>
        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.col -->
</div>
<!-- 全局js -->
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>

</body>
</html>