<?php
use backend\assets\AppAsset;
use yii\helpers\Html;
//<link href="" rel="stylesheet">
//$this->registerCssFile($nav_css_file);
$asset = AppAsset::register($this);
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
        <link  href="<?=$asset->baseUrl?>/static/css/nav.css"  rel="stylesheet">
        <!--[if lt IE 9]>
        <meta http-equiv="refresh" content="0;ie.html" />
        <script src="<?=$asset->baseUrl?>/static/js/html5shiv.min.js"></script>
        <script src="<?=$asset->baseUrl;?>/static/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    <?php $this->beginBody() ?>
    <body class="gray-bg">
    <div class="wrapper">
        <div class="navtop clearfix">
            <h1 class="nav-title">游戏管理后台<b></b></h1>
            <div class="navmenu"  id='cssmenu'>
                <ul class="navmenu-item">
                    <li><a href="index.html">单服数据</a></li>
                    <li class="active"><a href="index2.html">数据汇总</a></li>
                    <li><a href="index3.html">运营功能</a></li>
                    <li><a href="index4.html">服务器管理</a></li>
                    <li><a href="index5.html">监控系统</a></li>
                    <li><a href="">系统设置</a></li>
                    <li><a href="">开发工具</a></li>
                </ul>
            </div>

            <div class="nav-right">
                Hi! <span class="user-item">admin<i class="fa fa-angle-down" aria-hidden="true"></i>
	<span class="user-con">
		<a href="" class="a1">账号修改</a>
		<a href="" class="a2">安全退出</a>
	</span>
</span>
            </div>
        </div>
        <!--导航 end-->
        <div class="Business-back">
            <div class="Business-left left_0 transition clearfix">
                <div class="Website-nav">
                    网站导航<div class="Slide-left transition"><i class="fa fa-outdent" aria-hidden="true"></div></i>
                </div>
                <ul class="list-unstyled left-Catalog" id="boxscroll">
                    <li class="nav-toggle"><span class="nav-open"><i class="fa fa-bar-chart" aria-hidden="true"></i>汇总数据</span>
                        <ul class="list-unstyled leftnav-view">
                            <li><a class="J_menuItem" href="datadailysummary.html">每日汇总</a></li>
                            <li><a class="J_menuItem" href="datarechargesum.html">充值汇总</a></li>
                            <li><a href="#">在线汇总</a></li>
                        </ul>
                    </li>
                    <li class="nav-toggle"><span class="nav-open"><i class="fa fa-bar-chart" aria-hidden="true"></i>数据对比</span>
                        <ul class="list-unstyled leftnav-view">
                            <li><a class="J_menuItem" href="rechargecomparison.html">充值对比</a></li>
                        </ul>
                    </li>
                    <li class="nav-toggle"><span class="nav-open"><i class="fa fa-bar-chart" aria-hidden="true"></i>充值报表</span>
                        <ul class="list-unstyled leftnav-view">
                            <li><a class="J_menuItem" href="dailyreport.html">充值报表</a></li>
                        </ul>
                    </li>
                    <li class="nav-toggle"><span class="nav-open"><i class="fa fa-bar-chart" aria-hidden="true"></i>服务器成本</span>
                        <ul class="list-unstyled leftnav-view">
                            <li><a href="#">成本管控</a></li>
                            <li><a href="#">费用统计</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--左边 end-->
            <div class="Business-right transition clearfix">
                <iframe id="J_iframe" class="iframe-box" name="J_iframe" width="100%" height="100%" src="http://<?=$_SERVER['HTTP_HOST']?>/<?=$_SERVER['REQUEST_URI']?>&iframe=1" frameborder="0" data-id="index"></iframe>
            </div>
        </div>

    </div>
    <!--导航-->
    <script src="<?=$asset->baseUrl?>/static/js/nav.js"></script>
    <!--滚动条美化-->
    <script src="<?=$asset->baseUrl?>/static/js/jquery.nicescroll.js"></script>
    <script>
        $(document).ready(function() {
            $("#boxscroll").niceScroll({cursorborder:"",cursorcolor:"#999"});
        });
    </script>
    <?php $this->endBody() ?>


    </body>
    </html>
<?php $this->endPage() ?>