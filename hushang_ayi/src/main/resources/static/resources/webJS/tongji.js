let layer = layui.layer;
let layDate = layui.laydate;
let pathWeb = getRootPathWeb();
let maxYearMonth = new Date().getFullYear()+"-"+(new Date().getMonth() + 1);
let username = document.cookie.split("; ")[0].split("=")[1];

$(function() {

    let dateYM = new Date().getFullYear() + formatDateMonth(new Date().getMonth());
    let dateYear = new Date().getFullYear();
    zhiChuDataEchartsByYM(dateYM);
    shouRuDataEchartsByYM(dateYM);
    gongZiDataEchartsByYM(dateYM);
    tongJiDataEchartsByYM(dateYear);
});

function getEchartsData(){

    let date =  $(".selectDateYM").val();

    if(date == null || date === ''){

        layer.msg("要选择一个日期哦", {
            anim: 6
        });
        return;
    }
    let dateYM = formatDate(date);
    zhiChuDataEchartsByYM(dateYM);
    shouRuDataEchartsByYM(dateYM);
    gongZiDataEchartsByYM(dateYM);
}

function zhiChuDataEchartsByYM(dateYM) {
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('zhiChuEchartsByYM'));

    let echartsMoney = [];
    let echartsTime = [];
    $.ajax({
        type: "POST",
        url: pathWeb + "getZhiChuByMonthEcharts",
        data:{
            "dateYM":dateYM
        },
        success: function(data){
            echartsMoney = data.data.echartsMoney;
            echartsTime = data.data.echartsTime;

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
        }
    });
}

function shouRuDataEchartsByYM(dateYM) {
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('shouRuEchartsByYM'));

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
                    text: '月收入走势图',
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
        }
    });
}

function gongZiDataEchartsByYM(dateYM){
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
}

function tongJiDataEchartsByYM(dateYear) {
    // 基于准备好的dom，初始化echarts实例
    let myChart = echarts.init(document.getElementById('tongJiEchartsByYM'));

    let echartsMoney = [];
    let echartsTime = [];
    let params = {
        "dateYear": dateYear
    };
    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "getTongJiEchartsDataByYear",
        data: JSON.stringify(params),
        success: function(data){
            echartsMoney = data.data.echartsMoney;
            echartsTime = data.data.echartsTime;

            // 指定图表的配置项和数据
            let option = {
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    }
                },
                title: {
                    text: '月净利润走势图',
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
        }
    });
}

//年月选择器
layDate.render({
    elem: '.selectDateYM',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth
});