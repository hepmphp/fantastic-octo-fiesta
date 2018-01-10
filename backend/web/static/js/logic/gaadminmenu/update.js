/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-9
 * Time: 下午5:56
 * To change this template use File | Settings | File Templates.
 */
function ajax_get_config_menu(menu_id){
    $.ajax({
        type:"GET",
        url:"?r=gaadminmenu/ajax-get-config-menu",
        data:{menu_id:menu_id},
        timeout:"4000",
        dataType:'json',
        success: function(data){
            console.log(data);
            var select_parent_id = ' <option value="0">作为一级菜单</option>';
            select_parent_id = select_parent_id+data.data;
            $('#parentid').html(select_parent_id);
        }
    });
}

$(function(){

  //  var parent_id = "{$Info.parentid}";
    ajax_get_config_menu(parent_id);

});

