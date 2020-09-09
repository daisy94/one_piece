let layer = layui.layer,
    table = layui.table,
    layDate = layui.laydate,
    pathWeb = getRootPathWeb(),
    maxYear = new Date().getFullYear()+"-12-31",
    maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1),
    maxYearMonthDay = new Date().getFullYear()+"-"+(new Date().getMonth() + 1)+"-"+new Date().getDate(),
    username = document.cookie.split("; ")[0].split("=")[1],
    userPower = document.cookie.split("; ")[1].split("=")[1];

$(function() {

    let dateYM = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
    getSRDataByYM_save(dateYM);
    let dateY = new Date().getFullYear();
    getSRDataByY_start(dateY);
});

function getSRDataByYM(){

    let date =  $("#selectDateYM").val();

    if(date == null || date === ''){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    let dateYM = formatDate(date);

    table.render({
        elem: '#shouRuTableMonth',
        url: pathWeb + 'getShouRuByMonth',
        where: {
            dateYM
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field: 'shouru_money', title: '收入金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field: 'shouru_time', title: '收入日期', align: 'center', unresize: true},
        ]]
    });
    shouRuDataYMDEcharts(dateYM);
};

function getSRDataByYM_save(dateYM){

    table.render({
        elem: '#shouRuTableMonth',
        url: pathWeb + 'getShouRuByMonth',
        where: {
            dateYM
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field: 'shouru_money', title: '收入金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field: 'shouru_time', title: '收入日期', align: 'center', unresize: true},
        ]]
    });
    shouRuDataYMDEcharts(dateYM);
    let dateY = dateYM.substring(0,4);
    shouDataYMEcharts(dateY);
};

function getSRDataByY(){

    let date =  $("#selectDateY").val();

    if(date == null || date === ''){

        layer.msg("要选择一个年份哦", {
            anim: 6
        });
        return;
    }

    table.render({
        elem: '#shouRuTableYear',
        url: pathWeb + 'getShouRuByYear',
        where: {
            date
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field:'shouru_money', title: '收入金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field:'shouru_time', title: '收入日期', align: 'center', unresize: true},
        ]]
    });
    shouDataYMEcharts(date);
};

function getSRDataByY_start(date){

    table.render({
        elem: '#shouRuTableYear',
        url: pathWeb + 'getShouRuByYear',
        where: {
            date
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field:'shouru_money', title: '收入金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field:'shouru_time', title: '收入日期', align: 'center', unresize: true},
        ]]
    });
};

function shouRuDataYMDEcharts(dateYM) {
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('shouRuEchartsByYMD'));

    let echartsMoney = [];
    let echartsTime = [];
    $.ajax({
        type: "POST",
        url: pathWeb + "getShouRuByMonthEcharts",
        data: {
            "dateYM": dateYM
        },
        success: function (data) {
            echartsMoney = data.echartsMoney;
            echartsTime = data.echartsTime;

            // 指定图表的配置项和数据
            let option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    }
                },
                title: {
                    text: '日收入走势图',
                },
                color: ['#33ABA0'],
                xAxis: {
                    type: 'category',
                    data: echartsTime
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: echartsMoney,
                    type: 'bar'
                }]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        },
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
};

function shouDataYMEcharts(dateY) {
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('shouRuEchartsByYM'));

    let echartsMoney = [];
    let echartsTime = [];
    $.ajax({
        async: false,
        type: "POST",
        url: pathWeb + "getShouRuByYearEcharts",
        data:{
            "dateY":dateY
        },
        success: function(data){
            echartsMoney = data.echartsMoney;
            echartsTime = data.echartsTime;

            // 指定图表的配置项和数据
            let option = {
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    }
                },
                title: {
                    text: '月支出走势图',
                },
                color: ['#33ABA0'],
                xAxis: {
                    type: 'category',
                    data: echartsTime
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: echartsMoney,
                    type: 'bar'
                }]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        },
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
};

function insertSRData(){

    if(userPower !== "0"){
        layer.msg("小伙子，看看就好，别动数据", {
            anim: 6
        });
        return;
    }
    let insertShouRuData =  $("#insertShouRuData").val();
    let insertDateYMD =  formatDate($("#insertDateYMD").val());
    if(insertShouRuData == null || insertShouRuData === ""){

        layer.msg("金额是不是忘填了啊", {
            anim: 6
        });
        return;
    }
    if(insertDateYMD == null || insertDateYMD === ""){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    if(!isNumber(insertShouRuData)){
        layer.msg("金额怎么能不是数字呢", {
            anim: 6
        });
        return;
    }
    let params = {
        "insertShouRuData":insertShouRuData,
        "insertDateYMD":insertDateYMD
    };
    $.ajax({
        //请求方式
        type : "POST",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url : pathWeb + "insertShouRuData",
        //数据，json字符串
        data : JSON.stringify(params),
        //请求成功
        success : function(result) {
            if(result.code === 0){
                insertDateYMD = insertDateYMD.substring(0,6);
                getSRDataByYM_save(insertDateYMD);
                insertDateYMD = insertDateYMD.substring(0,4);
                getSRDataByY_start(insertDateYMD);
                $("#insertShouRuData").val("");
                $("#insertDateYMD").val("");
                layer.msg(result.msg);
            } else{
                layer.msg(result.msg);
            }
        },
        //请求失败，包含具体的错误信息
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
};

function getSRCountByY(){

    let date = $("#selectDateY").val();
    if (date == null || date === "") {

        layer.msg("要选择一个年份哦", {
            anim: 6
        });
        return;
    }
    let params = {
        "date":date
    };
    $.ajax({
        //请求方式
        type : "POST",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url : pathWeb + "getSRCountByYear",
        //数据，json字符串
        data : JSON.stringify(params),
        //请求成功
        success : function(result) {
            if(result.shouRuCount == null){
                layer.msg("还没有花钱，开心~");
                return;
            }
            layer.alert(date+"年"+"一共收入了"+" "+result.shouRuCount+"~", {
                skin: 'layui-layer-molv',//样式类名
                closeBtn: 0
            });
        },
        //请求失败，包含具体的错误信息
        error : function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
};

function excelShouRuDataByYM(){

    if(userPower !== "0"){
        layer.msg("小伙子，看看就好，别动数据", {
            anim: 6
        });
        return;
    }
    let date =  $("#selectDateYM").val();

    if(date == null || date === ''){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    let dateYM = formatDate(date);

    layui.config({
        base: pathWeb + 'resources/layui_exts/',
    }).extend({
        excel: 'excel',
    });

    let excel = layui.excel;

    let params = {
        "dateYM":dateYM
    };
    let loading = layer.load();
    $.ajax({
        //请求方式
        type : "POST",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url : pathWeb + "getShouRuByMonthExcel",
        //数据，json字符串
        data : JSON.stringify(params),
        //请求成功
        success(res) {
            let data = res.data;
            // 重点！！！如果后端给的数据顺序和映射关系不对，请执行梳理函数后导出
            data = excel.filterExportData(data, [
                'shouru_money',
                'shouru_time'
            ]);
            // 重点2！！！一般都需要加一个表头，表头的键名顺序需要与最终导出的数据一致
            data.unshift({
                shouru_money: "收入金额",
                shouru_time: "收入时间"
            });
            excel.exportExcel(data, date + " 收入明细" + ".xlsx", "xlsx");
            layer.msg("导出成功");
            layer.close(loading);
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
            layer.msg("导出失败");
            layer.close(loading);
        }
    });
};

//年月日选择器
layDate.render({
    elem: '#insertDateYMD',
    trigger: 'click',
    max: maxYearMonthDay
});

//年月选择器
layDate.render({
    elem: '#selectDateYM',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth
});

//年选择器
layDate.render({
    elem: '#selectDateY',
    trigger: 'click',
    type: 'year',
    max: maxYear
});