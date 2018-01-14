/**
 * Created with JetBrains PhpStorm.
 * User: ok_fish
 * Date: 18-1-10
 * Time: 下午5:13
 * To change this template use File | Settings | File Templates.
 */

var urls = {
    create_url:'?r=ga-admin-user/create',
    update_url:'?r=ga-admin-user/update',
    delete_url:'?r=ga-admin-user/delete',
};

/***
 * 添加
 */
function add(){
    var url = urls.create_url;
    user_form(url,1);
}
/**
 * 修改
 * @param id
 */
function edit(id) {
    var url = urls.update_url+"&id="+id;
    layer_form(url,2);
}

/***
 * * @param id
 */
function del(id) {
    layer.confirm('确定要删除?',{
            btn: ['确定','取消'], //按钮
            icon: 3,
            title:'提示'
        }, function(){
            ajax_post(urls.delete_url,{ids:id})
        },
        function(){

        }
    );
}

//表单
function layer_form(url,action){
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
                id:body.find('#id').val(),
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
                var url = urls.update_url+'&id='+param.GaAdminUser.id;
            }else{
                var url = urls.create_url
            }
            ajax_post(url,param);

        },btn2: function(index, layero){

        }
        // content:"{:U('Serverpolicy/add')}" //iframe的url
    });
}