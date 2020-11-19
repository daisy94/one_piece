let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    table = layui.table,
    layDate = layui.laydate,
    form = layui.form,
    pathWeb = getRootPathWeb(),
    maxYear = new Date().getFullYear() + "-12-31",
    maxYearMonth = new Date().getFullYear() + "-" + (new Date().getMonth() + 1),
    maxYearMonthDay = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate(),
    isTrue = false;

let dateYearMonth = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
getDataByYearMonth(dateYearMonth);
let dateYear = new Date().getFullYear();
getDataByYear(dateYear);

// 点击模糊查询
$(".getDataByLikeSelect").click(function () {

    isTrue = false;
    let customerName =  $("#customerName").val();
    let goodsName =  $("#goodsName").val();
    let profit =  $("#profit").val();
    let dateYearMonthDay =  formatDate($("#dateYearMonthDay").val());
    let dateYearMonth =  formatDate($("#dateYearMonth").val());

    if (customerName === "" && goodsName === "" && profit === "" && dateYearMonthDay === "" && dateYearMonth === ""){
        layer.msg("小伙子，上面4个至少得填一个条件查询吧", {
            anim: 6
        });
        return;
    }

    let params = {
        "customerName": customerName,
        "goodsName": goodsName,
        "profit": profit,
        "dateYearMonthDay": dateYearMonthDay,
        "dateYearMonth": dateYearMonth
    };
    getDataByLikeSelect(params);
});

// 点击查询未发货订单
$(".littleButton").click(function () {

    isTrue = true;
    let is_deliver = 0;

    let params = {
        "is_deliver": is_deliver
    };
    getDataByLikeSelect(params);
});

// 新增订单信息
function insertByYearMonthDay(){

    isTrue = false;
    let customerName =  $("#customerName").val();
    let goodsName =  $("#goodsName").val();
    let profit =  $("#profit").val();
    let dateYearMonthDay =  formatDate($("#dateYearMonthDay").val());

    if(customerName === "" || goodsName === "" || profit === "" || dateYearMonthDay === ""){
        layer.msg("少年，每一个空都要填", {
            anim: 6
        });
        return;
    }
    if(!isNumber(profit)){
        layer.msg("利润怎么能不是数字呢", {
            anim: 6
        });
        return;
    }
    let params = {
        "customerName":customerName,
        "goodsName":goodsName,
        "profit":profit,
        "dateYearMonthDay":dateYearMonthDay
    };

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "insertOnePieceData",
        data : JSON.stringify(params),
        success: function(result) {
            if(result.code === 0){
                let dateYearMonth = dateYearMonthDay.substring(0,6);
                getDataByYearMonth(dateYearMonth);
                let dateYear = dateYearMonth.substring(0,4);
                getDataByYear(dateYear);
                $("#customerName").val("");
                $("#goodsName").val("");
                $("#profit").val("");
                layer.msg(result.msg);
            } else{
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 逻辑删除订单信息
function deleteTableData(params, date) {

    isTrue = false;
    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "deleteOnePieceTableData",
        data : params,
        success: function(result) {
            if(result.code === 0){
                let dateYearMonth = formatDate(date).substring(0,6);
                getDataByYearMonth(dateYearMonth);
                let dateYear = dateYearMonth.substring(0,4);
                getDataByYear(dateYear);
                layer.msg(result.msg);
            } else{
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 修改订单信息
function updateTableData(params, date) {

    isTrue = false;
    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "updateOnePieceTableData",
        data : params,
        success: function(result) {
            if(result.code === 0){
                let dateYearMonth = formatDate(date).substring(0,6);
                getDataByYearMonth(dateYearMonth);
                let dateYear = dateYearMonth.substring(0,4);
                getDataByYear(dateYear);
                layer.msg(result.msg);
            } else{
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 根据月份查询订单信息
function getDataByYearMonth(dateYearMonth){

    table.render({
        elem: '#onePieceTableYearMonth',
        skin: 'line',
        url: pathWeb + 'getOnePieceTableYearMonth',
        contentType: 'application/json',
        where: {
            "dateYearMonth": dateYearMonth
        },
        height: 235,
        method: 'post',
        cols: [[
            {field:'id', title: 'ID', hide: true},
            {fixed:'left', align:'center', title: '状态', unresize: true, toolbar: '#is_deliver', width: 100},
            {field:'customer_name', title: '微信名', align: 'center', unresize: true, edit: 'onePieceTable', width: 120},
            {field:'goods_name', title: '恰了什么', align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'profit', title: '恰饭', sort: true, align: 'center', unresize: true, edit: 'onePieceTable', width: 100},
            {field:'date', title: '哪天', align: 'center', unresize: true, width: 110},
            {align:'center', title: '三思啊', unresize: true, toolbar: '#operationButton', width: 145}
        ]]
    });
    getOnePieceEChartsByYearMonth(dateYearMonth);
    getAchievementPercentage(dateYearMonth);
}

// 模糊查询订单信息
function getDataByLikeSelect(params) {

    table.render({
        elem: '#onePieceTableYearMonth',
        skin: 'line',
        url: pathWeb + 'getOnePieceTableYearMonth',
        contentType: 'application/json',
        where: params,
        height: 235,
        method: 'POST',
        cols: [[
            {field:'id', title: 'ID', hide: true},
            {fixed:'left', align:'center', title: '状态', unresize: true, toolbar: '#is_deliver', width: 100},
            {field:'customer_name', title: '微信名', align: 'center', unresize: true, edit: 'onePieceTable', width: 120},
            {field:'goods_name', title: '恰了什么', align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'profit', title: '恰饭', sort: true, align: 'center', unresize: true, edit: 'onePieceTable', width: 100},
            {field:'date', title: '哪天', sort: true, align: 'center', unresize: true, width: 110},
            {align:'center', title: '三思啊', unresize: true, toolbar: '#operationButton', width: 145}
        ]]
    });
}

// 根据月份展示订单信息ECharts图
function getOnePieceEChartsByYearMonth(dateYearMonth) {

    let myChart = echarts.init(document.getElementById("onePieceEChartsByYearMonth"));

    let EChartsX = [];
    let EChartsY = [];
    let params = {
        "dateYearMonth": dateYearMonth
    };

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "getOnePieceEChartsByYearMonth",
        data: JSON.stringify(params),
        success: function(data){
            EChartsX = data.data.EChartsX;
            EChartsY = data.data.EChartsY;

            let option = {
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    }
                },
                color: ['#33ABA0'],
                xAxis: {
                    type: 'category',
                    data: EChartsX
                },
                yAxis: {
                    type: 'value'
                },
                series: [
                    {
                        data: EChartsY,
                        type: 'bar',
                        markLine: {
                            symbol: "none", //去掉警戒线最后面的箭头
                            label: {
                                position: "end", //将警示值放在哪个位置，三个值“start”,"middle","end"  开始  中点 结束
                                formatter: "200块",
                                color: "#696969",
                                fontSize: 12
                            },
                            data: [{
                                silent: false, //鼠标悬停事件  true没有，false有
                                lineStyle: { //警戒线的样式，虚实，颜色
                                    color: "#696969"
                                },
                                yAxis: 200 //警戒线的标注值，可以有多个yAxis，多条警示线，或者采用{type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
                            }]
                        }
                    }
                ]
            };
            myChart.setOption(option);
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 根据年份查询订单信息
function getDataByYear(dateYear){

    table.render({
        elem: '#onePieceTableYear',
        skin: 'line',
        url: pathWeb + 'getOnePieceTableYear',
        contentType: 'application/json',
        where: {
            "dateYear": dateYear
        },
        cellMinWidth: 80,
        height: 235,
        method: 'post',
        cols: [[
            {field:'profit', title: '恰饭', sort: true, align: 'center', unresize: true},
            {field:'date', title: '统计日期', align: 'center', unresize: true},
        ]]
    });
    getOnePieceEChartsByYear(dateYear);
}

// 根据年份展示订单信息ECharts图
function getOnePieceEChartsByYear(dateYear) {

    let myChart = echarts.init(document.getElementById("onePieceEChartsByYear"));

    let EChartsX = [];
    let EChartsY = [];
    let params = {
        "dateYear": dateYear
    };

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "getOnePieceEChartsByYear",
        data: JSON.stringify(params),
        success: function(data){
            EChartsX = data.data.EChartsX;
            EChartsY = data.data.EChartsY;

            let option = {
                tooltip : {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'none'
                    }
                },
                color: ['#4186bb'],
                xAxis: {
                    type: 'category',
                    data: EChartsX
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: EChartsY,
                    type: 'bar',
                    markLine: {
                        symbol: "none", //去掉警戒线最后面的箭头
                        label: {
                            position: "end", //将警示值放在哪个位置，三个值“start”,"middle","end"  开始  中点 结束
                            formatter: "5000块",
                            color: "#696969",
                            fontSize: 12
                        },
                        data: [{
                            silent: false, //鼠标悬停事件  true没有，false有
                            lineStyle: { //警戒线的样式，虚实，颜色
                                color: "#696969"
                            },
                            yAxis: 5000 //警戒线的标注值，可以有多个yAxis，多条警示线，或者采用{type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
                        }]
                    }
                }]
            };
            myChart.setOption(option);
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 根据年份查询收入总额
function getCountByYear(){

    let dateYear = $("#dateYear").val();

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
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "getOnePieceCountByYear",
        data : JSON.stringify(params),
        success: function(data) {
            if(data.data == null){
                layer.alert("还没有收入，哭泣！", {
                    skin: 'layui-layer-molv',
                    closeBtn: 0
                });
            }else {
                layer.alert(dateYear + "年一共赚了" + " " + data.data.profit + "块", {
                    skin: 'layui-layer-molv',
                    closeBtn: 0
                });
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 根据月份查询月目标达成百分率
function getAchievementPercentage(dateYearMonth){

    let params = {
        "dateYearMonth": dateYearMonth
    };
    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "getAchievementPercentage",
        data : JSON.stringify(params),
        success: function(result) {
            if(result.code === 0){
                let achievementPercentage = result.data.achievementPercentage;
                $(".layui-progress-bar").attr("lay-percent", achievementPercentage + "%");
                element.init();
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 表格数据编辑、删除监听事件
table.on('tool(onePieceTable)', function(obj){
    let data = obj.data;
    let date = data.date;
    if (obj.event === 'delete'){
        layer.confirm('确定不要了吗', {title: '纳尼！'}, function(index){
            deleteTableData(JSON.stringify(data), date);
            layer.close(index);
        });
    } else if(obj.event === 'edit'){
        let customerName = data.customer_name;
        let goodsName = data.goods_name;
        let profit = data.profit;
        if(customerName === "" || goodsName === "" || profit === ""){

            layer.msg("每一个都是要填的！", {
                anim: 6
            });
            return;
        }
        layer.confirm('确定改成这样吗', {title: '纳尼！'}, function(index){
            updateTableData(JSON.stringify(data), date);
            layer.close(index);
        });
    }
});

// 表格订单发货按钮监听事件
form.on('switch(is_deliver)', function(data){

    let is_deliver;
    if (data.elem.checked) {
        is_deliver = 1;
    }else {
        is_deliver = 0;
    }
    let params = {
        "id": data.value,
        "is_deliver": is_deliver
    };

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "updateOnePieceDeliverState",
        data : JSON.stringify(params),
        success: function(result) {
            if(result.code === 0){
                layer.msg(result.msg);
                if (isTrue){
                    if (params.is_deliver === 1){
                        params = {
                            "is_deliver": 0
                        };
                        getDataByLikeSelect(params);
                    }
                }
            } else{
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
});

// 年月日选择器
layDate.render({
    elem: '#dateYearMonthDay',
    trigger: 'click',
    max: maxYearMonthDay
});

// 年月选择器
layDate.render({
    elem: '#dateYearMonth',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth,
    done: function(value){

        isTrue = false;
        let dateYearMonth = formatDate(value);
        if (dateYearMonth !== ""){
            getDataByYearMonth(dateYearMonth);
        }
    }
});

// 年选择器
layDate.render({
    elem: '#dateYear',
    trigger: 'click',
    type: 'year',
    max: maxYear,
    done: function(dateYear){

        isTrue = false;
        if (dateYear !== ""){
            getDataByYear(dateYear);
        }
    }
});