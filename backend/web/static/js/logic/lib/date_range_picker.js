/**
 * Created with JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-21
 * Time: 下午11:06
 * To change this template use File | Settings | File Templates.
 *
 *
 */

var date_range = $(".date-range");//列表搜索日历1
var date_range_1 = $('.date-range-1');//列表搜索日历2

if(date_range.length!=0){
    date_time_range_func(date_range,'date-range00','date-range01');
}

if(date_range_1.length!=0){
  //  console.log(date_time_range);
   date_time_range_func(date_range_1,'date-range10','date-range11');
}


function date_time_range_func(date_time_range,begin_selector,end_selector){
    date_time_range.dateRangePicker(
        {
            separator : ' to ',
            format: 'YYYY-MM-DD HH:mm:ss',
            endDate: moment(),
            getValue: function()
            {

                if ($('.'+begin_selector).val() && $('.'+end_selector).val() )
                    return $('.'+begin_selector).val() + ' 至 ' + $('.'+end_selector).val();
                else
                    return '';
            },
            setValue: function(s,s1,s2)
            {
                $('.'+begin_selector).val(s1);
                $('.'+end_selector).val(s2);
            },
            time: {
                enabled: true
            },
            defaultTime: moment().subtract(1, 'month').startOf('month').startOf('day').toDate(),
            defaultEndTime: moment().endOf('day').toDate()
        });
    $(function () { $(".popover-options a").popover({
        html : true
    });});
}


