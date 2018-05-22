/**
 * Created with JetBrains PhpStorm.
 * User: Administrator
 * Date: 18-5-19
 * Time: 下午5:08
 * To change this template use File | Settings | File Templates.
 */
var form_date_time = $('.form-date-time');
var form_date = $('.form_date');
if(form_date_time!=undefined){
    form_date_time.focus(function(){
        $(this).dateRangePicker(
            {
                autoClose: true,
                singleDate : true,
                singleMonth: true,
                showShortcuts: false,
                startOfWeek: 'monday',
                format: 'YYYY-MM-DD HH:mm:ss',
                time: {
                    enabled: true
                }
            });
    })
    $(function () { $(".popover-options a").popover({
        html : true
    });});
}

if(form_date!=undefined){
    form_date.focus(function(){
        $(this).dateRangePicker(
            {
                autoClose: true,
                singleDate : true,
                singleMonth: true,
                showShortcuts: false,
                startOfWeek: 'monday',
                format: 'YYYY-MM-DD',
                time: {
                    enabled: true
                }
            });
    })
    $(function () { $(".popover-options a").popover({
        html : true
    });});
}





