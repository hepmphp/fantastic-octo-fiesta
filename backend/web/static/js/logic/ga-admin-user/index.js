/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-1-10
 * Time: 下午5:13
 * To change this template use File | Settings | File Templates.
 */
/**
 * 接口地址
 * @type {{account_create: string, account_update: string, account_delete: string, account_permission: string}}
 */
var urls = {
    account_create:'?r=ga-admin-user/create',
    account_update:'?r=ga-admin-user/update',
    account_delete:'?r=ga-admin-user/delete',
    account_permission:'?r=ga-admin-user/edit-permission'
};

function del(id) {
    layer.confirm('确定要锁定?',{
        btn: ['确定','取消'], //按钮
        icon: 3,
        title:'提示'
    }, function(){
            ajax_post(urls.account_delete,{ids:id})
        },
        function(){

        }
    );
}

function un_del(id) {
    layer.confirm('确定解除锁定?',{
        btn:['确定','取消'],
        icon:3,
        title:"提示"
    },function(){
        ajax_post(urls.account_delete,{ids:id,status:0});
    },function(){});
}

$('.change_group_id').change(function(){
    var param = {
        id:$(this).attr('data-id'),
        group_id:$(this).val()
    };
    var index = layer.load(2);
    $.ajax({
        type:"POST",
        url: urls.account_update,
        data: param,
        timeout:"4000",
        dataType:'json',
        success: function(data){
            if (data.status == 0) {
                layer.close(index);
                alert_success(data.msg);
            }
            else {
                alert_fail(data.msg);
            }
        }
    });
});
$('.passw').on('blur', function(){
    if($(this).val()){
        var param = {
            id:$(this).attr('data-id'),
            password:$(this).val()
        };
        var index = layer.load(2);
        $.ajax({
            type:"POST",
            url: "{:U('account/edit_password')}",
            data: param,
            timeout:"4000",
            dataType:'json',
            success: function(data){
                if (data.status == 0) {
                    layer.close(index);
                    alert_success(data.msg);
                }
                else {
                    alert_fail(data.msg);
                }
            }
        });
    }
});
function edit_permission(id){
    var url = urls.account_permission+"&id="+id;
    permission_form(url,1);

}
//权限设置窗口
function permission_form(url,action){
    var content = url;
    var title = action==2?'设置用户权限':'设置用户权限';
    var btn =  action==2?['确认','取消']:['确认','取消'];
    layer.open({
        type: 2, //iframe
        area: ['720px', '510px'],
        title: title,
        btn: btn,
        shade: 0.3, //遮罩透明度
        content:content,
        yes: function(index, layero){
            var body = layer.getChildFrame('body', index);
            var iframeWin = window[layero.find('iframe')[0]['name']];
            //  console.log(iframeWin.zTree);
            var treeObj = iframeWin.zTree;
            var nodes = treeObj.getCheckedNodes(true);
            var mids = new Array();
            for (var i = 0; i < nodes.length; i++) {
                mids.push(nodes[i].id);
            }
            var param = {
                id:body.find('#id').val(),
                mids:mids
            };
            var index = layer.load(2);
            $.ajax({
                type:"POST",
                url: urls.account_permission,
                data:  param,
                timeout:"4000",
                dataType:"json",
                success: function(data){
                    layer.close(index);
                    if (data.status == 0) {
                        alert_success(data.msg);
                        // window.location.reload();
                    }
                    else {
                        alert_fail(data.msg);
                    }
                }
            });
        },btn2: function(index, layero){

        }
        // content:"{:U('Serverpolicy/add')}" //iframe的url
    });
}


/***
 * 添加账号
 */
function add(){
    var url = urls.account_create;
    user_form(url,1);
}
/**
 * 修改密码
 * @param id
 */
function edit(id) {
    var url = urls.account_update+"&id="+id;
    user_form(url,2);
}
//添加模板
function user_form(url,action){
    var content = url;
    var title = action==2?'修改':'添加';
    var btn =  action==2?['确认修改','取消']:['确认添加','取消'];
    layer.open({
        type: 2, //iframe
        area: ['500px', '560px'],
        title: title,
        btn: btn,
        shade: 0.3, //遮罩透明度
        content:content,
        yes: function(index, layero){
            var body = layer.getChildFrame('body', index);
            var param ={
                GaAdminUser:{
                    id:body.find('#id').val(),
                    username:body.find('#username').val(),
                    realname:body.find('#realname').val(),
                    email:body.find('#email').val(),
                    password:body.find('#password').val(),
                    repassword:body.find('#repassword').val(),
                    group_id:body.find('#group_id').val(),
                    platform_id:body.find('#platform_id').val()
                }
            };
            if(!param.GaAdminUser.username){
                alert_fail('用户名不能为空');
                return false;
            }
            if(param.GaAdminUser.password != param.GaAdminUser.repassword){
                alert_fail('两次输入密码不一致');
                return false;
            }

            if(param.GaAdminUser.id){
                var url = urls.account_update+'&id='+param.GaAdminUser.id;
            }else{
                var url = urls.account_create
            }
            layer.load(2);
            ajax_post(url,param);

        },btn2: function(index, layero){

        }
        // content:"{:U('Serverpolicy/add')}" //iframe的url
    });
}