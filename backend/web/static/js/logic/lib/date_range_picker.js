/**
 * Created with JetBrains PhpStorm.
 * User: hepm
 * Date: 18-5-21
 * Time: 下午11:06
 * To change this template use File | Settings | File Templates.
 *
 *
 */
var date_time_range = $('.date-time-range');
var date_range = $(".date-range");

if(date_time_range){
    date_time_range.dateRangePicker(
        {
            separator : ' to ',
            format: 'YYYY-MM-DD HH:mm:ss',
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


if(date_range){
    date_range.dateRangePicker(
        {
            separator : ' to ',
            format: 'YYYY-MM-DD HH:mm:ss',
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