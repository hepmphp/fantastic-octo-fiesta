<?php
/**
 * Created by JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-12
 * Time: 下午3:42
 * To change this template use File | Settings | File Templates.
 */

//echo "<pre>";
//print_r($menu);
//var_dump($current_top_menu_id);
?>

<div class="navtop clearfix">
    <h1 class="nav-title">游戏管理后台<b></b></h1>
    <div class="navmenu"  id='cssmenu'>
        <ul class="navmenu-item">

            <?php foreach($menu['top_menu'] as $vo){?>
            <!--    class="active"-->
            <li class="<?php if($vo['id']==$current_top_menu_id){echo 'active';}?>"><a href="?r=<?=$vo['model']?>/<?=$vo['action']?>"><?=$vo['name']?></a></li>
             <?php }?>
        </ul>
    </div>

    <div class="nav-right">
        Hi! <span class="user-item">admin<i class="fa fa-angle-down" aria-hidden="true"></i>
	<span class="user-con">
		<a href="javasript:void(0)" class="a1" id="edit_password">账号修改</a>
		<a href="?r=site/logout" class="a2">安全退出</a>
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
        <ul class="list-unstyled left-Catalog" id="boxscroll" tabindex="5000" style="height: 269px; overflow: hidden; outline: none;">
            <?php

            //         $left_menu = $tree_menu->get_parent($current_menu['parentid']);
            $left_menu = $menu['left_menu'];
            usort($left_menu,function($a,$b){
                if ($a['listorder'] == $b['listorder']) {
                    return 0;
                }
                return ($a['listorder'] < $b['listorder']) ? -1 : 1;
            });

            foreach($left_menu as $menu){
                if(!in_array($menu['id'],$admin_access)){
                    continue;
                }
                $sub_menu = $tree_menu->get_child($menu['id']);
                if(empty($sub_menu)){
                    continue;
                }
                usort($sub_menu,function($a,$b){
                    if ($a['listorder'] == $b['listorder']) {
                        return 0;
                    }
                    return ($a['listorder'] < $b['listorder']) ? -1 : 1;
                });
                ?>
                <li class="nav-toggle"><span class="nav-open"><i class="fa fa-bar-chart" aria-hidden="true"></i><?=$menu['name']?></span>
                    <ul class="list-unstyled leftnav-view">
                        <?php
                        //    var_dump($sub_menu);

                        foreach($sub_menu as $last_menu){
                            if(!in_array($last_menu['id'],$admin_access)){
                                continue;
                            }
                            if($last_menu['status']==0){
                                $menu_url = $last_menu['model'].'/'.$last_menu['action'];
                                $menu_url = "?r={$menu_url}&iframe=1";


                                ?>
                                <li><a class="J_menuItem" href="<?=$menu_url?>"><?=$last_menu['name']?></a></li>
                            <?php  }}?>
                    </ul>
                </li>
            <?php }?>


        </ul>
    </div>
    <!--左边 end-->
    <div class="Business-right transition clearfix">
        <iframe id="J_iframe" class="iframe-box" name="J_iframe" width="100%" height="100%" src="http://<?=$_SERVER['HTTP_HOST']?>/<?=$_SERVER['REQUEST_URI']?>&iframe=1" frameborder="0" data-id="index"></iframe>
    </div>
</div>