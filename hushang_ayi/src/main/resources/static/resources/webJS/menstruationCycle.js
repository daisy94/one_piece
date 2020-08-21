let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    table = layui.table,
    layDate = layui.laydate,
    pathWeb = getRootPathWeb(),
    maxYear = new Date().getFullYear() + "-12-31",
    maxYearMonthDay = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();

$(function() {

    let dateYear = new Date().getFullYear();
    let params = {
        "dateYear": dateYear
    };
    getMenstruationCycleTable(params);
});

$(".insertByYearMonthDay").click(function () {

    let dateYearMonthDay = $("#dateYearMonthDay").val();
    if (dateYearMonthDay === ""){

        layer.msg("日期是不是忘选了啊", {
            anim: 6
        });
        return;
    }
    let params = {
        "dateYearMonthDayStart": formatDate(dateYearMonthDay.substring(0, 10)),
        "dateYearMonthDayEnd": formatDate(dateYearMonthDay.substring(13, 23)),
        "dateYear": formatDate(dateYearMonthDay.substring(0, 10)).substring(0,4)
    };
    insertByYearMonthDay(params);
});

$(".selectByYear").click(function () {

    let dateYear = $("#dateYear").val();
    if (dateYear === ""){

        layer.msg("日期是不是忘选了啊", {
            anim: 6
        });
        return;
    }
    let params = {
        "dateYear": dateYear
    };
    getMenstruationCycleTable(params);
});

function insertByYearMonthDay(params){

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "insertMenstruationCycleData",
        data : JSON.stringify(params),
        success: function(result) {
            if(result.code === 0){
                $("#dateYearMonthDay").val("");
                getMenstruationCycleTable(params);
                layer.msg(result.msg);
            }else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

function getMenstruationCycleTable(params){

    table.render({
        elem: '#menstruationCycleTable',
        url: pathWeb + 'getMenstruationCycleTable',
        contentType: 'application/json',
        where: params,
        cellMinWidth: 80,
        method: 'POST',
        cols: [[
            {field:'id', title: 'ID', hide: true},
            {field:'start_time', title: '姨妈开始时间', align: 'center', unresize: true},
            {field:'end_time', title: '姨妈结束时间', align: 'center', unresize: true},
        ]]
    });
}

//日期范围选择器
layDate.render({
    elem: '#dateYearMonthDay',
    range: '~',
    max: maxYearMonthDay
});

//年选择器
layDate.render({
    elem: '#dateYear',
    trigger: 'click',
    type: 'year',
    max: maxYear
});