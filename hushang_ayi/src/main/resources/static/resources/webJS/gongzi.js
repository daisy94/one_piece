let layer = layui.layer;
let table = layui.table;
let layDate = layui.laydate;
let pathWeb = getRootPathWeb();
let maxYear = new Date().getFullYear()+"-12-31";
let maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1);
let username = document.cookie.split("; ")[0].split("=")[1];
let userPower = document.cookie.split("; ")[1].split("=")[1];

$(function() {

    let dateYM = new Date().getFullYear() + formatDateMonth(new Date().getMonth());
    getGZDataByYM_save(dateYM);
    let dateY = new Date().getFullYear();
    getGZDataByYear_start(dateY);
});

function getGZDataByYM(){

    let date =  $("#selectDateYM").val();

    if(date == null || date === ''){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    let dateYM = formatDate(date);

    table.render({
        elem: '#gongZiTableMonth',
        url: pathWeb + 'getGongZiByMonth',
        where: {
            dateYM
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field:'gongzi_name', title: '工资明细', align: 'center', unresize: true},
            {field:'gongzi_remark', title: '工资备注', align: 'center', unresize: true},
            {field:'gongzi_money', title: '工资金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field:'gongzi_time', title: '发放日期', align: 'center', unresize: true}
        ]]
    });
    getGongZiEchartsByYM(dateYM);
};

function getGongZiEchartsByYM(dateYM){
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('gongZiEchartsByYM'));

    let echartsRemark = [];
    let echartsData = [];
    $.ajax({
        type: "POST",
        url: pathWeb + "getGongZiEchartsByYM",
        data:{
            "dateYM":dateYM
        },
        success: function(data){
            echartsRemark = data.echartsRemark;
            echartsData = data.echartsData;

            // 指定图表的配置项和数据
            let option = {
                title: {
                    text: '月薪资饼图',
                    left: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: '{a} <br/>{b} : {c} ({d}%)'
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: echartsRemark
                },
                series: [
                    {
                        name: '薪资占比',
                        type: 'pie',
                        radius: '55%',
                        hoverOffset: 5,
                        center: ['50%', '60%'],
                        data: echartsData,
                        emphasis: {
                            itemStyle: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
};

function getGZDataByYM_save(dateYM){

    table.render({
        elem: '#gongZiTableMonth',
        url: pathWeb + 'getGongZiByMonth',
        where: {
            dateYM
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field:'gongzi_name', title: '工资明细', align: 'center', unresize: true},
            {field:'gongzi_remark', title: '工资备注', align: 'center', unresize: true},
            {field:'gongzi_money', title: '工资金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field:'gongzi_time', title: '发放日期', align: 'center', unresize: true}
        ]]
    });
    getGongZiEchartsByYM(dateYM);
};

function getGZDataByYear(){

    let date =  $("#selectDateY").val();

    if(date == null || date === ''){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    let dateYear = formatDate(date);

    table.render({
        elem: '#gongZiTableYear',
        url: pathWeb + 'getGongZiByYear',
        where: {
            dateYear
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field:'gongzi_money', title: '工资金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field:'gongzi_time', title: '发放日期', align: 'center', unresize: true}
        ]]
    });
    getGongZiEchartsByYear(dateYear);
};

function getGongZiEchartsByYear(dateYear){
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('gongZiEchartsByYear'));

    let EChartsX = [];
    let EChartsY = [];
    $.ajax({
        type: "POST",
        url: pathWeb + "getGongZiEchartsByYear",
        data:{
            "dateYear":dateYear
        },
        success: function(data){
            EChartsX = data.data.EChartsX;
            EChartsY = data.data.EChartsY;

            // 指定图表的配置项和数据
            let option = {
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    }
                },
                title: {
                    text: '年薪资柱状图',
                },
                color: ['#33ABA0'],
                xAxis: {
                    type: 'category',
                    data: EChartsX
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: EChartsY,
                    type: 'bar'
                }]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
};

function getGZDataByYear_start(dateYear){

    table.render({
        elem: '#gongZiTableYear',
        url: pathWeb + 'getGongZiByYear',
        where: {
            dateYear
        },
        cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
        height: 275,
        method: 'post',
        cols: [[
            {field:'gongzi_money', title: '工资金额', sort: true, align: 'center', unresize: true}, //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
            {field:'gongzi_time', title: '发放日期', align: 'center', unresize: true}
        ]]
    });
    getGongZiEchartsByYear(dateYear);
};

function insertGZData(){

    if(userPower !== "0"){
        layer.msg("小伙子，看看就好，别动数据", {
            anim: 6
        });
        return;
    }
    let insertGongZiType =  $("#insertGongZiType").val();
    let insertGongZiData =  $("#insertGongZiData").val();
    let insertGongZiRemark =  $("#insertGongZiRemark").val();
    let insertDateYM =  formatDate($("#insertDateYM").val());
    if(insertGongZiType == null || insertGongZiType === ''){

        layer.msg("要填一个工资明细哦", {
            anim: 6
        });
        return;
    }
    if(insertGongZiRemark == null || insertGongZiRemark === ''){

        layer.msg("要填一个明细备注哦", {
            anim: 6
        });
        return;
    }
    if(insertGongZiData == null || insertGongZiData === ''){

        layer.msg("金额是不是忘填了啊", {
            anim: 6
        });
        return;
    }
    if(insertDateYM == null || insertDateYM === ''){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    if(!isNumber(insertGongZiData)){
        layer.msg("金额怎么能不是数字呢", {
            anim: 6
        });
        return;
    }
    let params = {
        "insertGongZiType":insertGongZiType,
        "insertGongZiRemark":insertGongZiRemark,
        "insertGongZiData":insertGongZiData,
        "insertDateYM":insertDateYM
    };
    $.ajax({
        //请求方式
        type : "POST",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url : pathWeb + "insertGongZiData",
        //数据，json字符串
        data : JSON.stringify(params),
        //请求成功
        success : function(result) {
            if(result.code === 0){
                getGZDataByYM_save(insertDateYM);
                insertDateYM = insertDateYM.substring(0,4);
                getGZDataByYear_start(insertDateYM);
                $("#insertGongZiType").val("");
                $("#insertGongZiRemark").val("");
                $("#insertGongZiData").val("");
                layer.msg(result.msg);
            }else if(result.code === 150){
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

function getGZCountByYear(){

    let dateYear = $("#selectDateY").val();
    if (dateYear == null || dateYear === '') {

        layer.msg("要选择一个年份哦", {
            anim: 6
        });
        return;
    }
    let params = {
        "dateYear":dateYear
    };
    $.ajax({
        //请求方式
        type : "POST",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url : pathWeb + "getGZCountByYear",
        //数据，json字符串
        data : JSON.stringify(params),
        //请求成功
        success : function(result) {
            if(result.data == null){
                layer.msg("还没有付工资呢，开心~");
                return;
            }
            layer.alert(dateYear+"年一共支出了工资"+" "+result.data.gongZiCount+"~", {
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

function excelGongZiDataByYM(){

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
        url : pathWeb + "getGongZiExcelByMonth",
        //数据，json字符串
        data : JSON.stringify(params),
        //请求成功
        success(res) {
            let data = res.data;
            // 重点！！！如果后端给的数据顺序和映射关系不对，请执行梳理函数后导出
            data = excel.filterExportData(data, [
                'gongzi_name',
                'gongzi_remark',
                'gongzi_money',
                'gongzi_time',
            ]);
            // 重点2！！！一般都需要加一个表头，表头的键名顺序需要与最终导出的数据一致
            data.unshift({
                gongzi_name: "薪资明细",
                gongzi_remark: "明细备注",
                gongzi_money: "薪资金额",
                gongzi_time: "发放时间"
            });
            excel.exportExcel(data, date + " 薪资明细" + ".xlsx", "xlsx");
            layer.msg("导出成功");
            layer.close(loading);
        },
        error() {
            layer.msg("导出失败");
            layer.close(loading);
        }
    });
}

//年月选择器
layDate.render({
    elem: '#insertDateYM',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth
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