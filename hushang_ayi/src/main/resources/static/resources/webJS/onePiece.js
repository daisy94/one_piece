let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    table = layui.table,
    layDate = layui.laydate,
    form = layui.form,
    pathWeb = getRootPathWeb(),
    maxYear = new Date().getFullYear() + "-12-31",
    maxYearMonth = new Date().getFullYear() + "-" + (new Date().getMonth() + 1),
    maxYearMonthDay = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();

$(function() {

    let dateYearMonth = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
    getDataByYearMonth(dateYearMonth);
    let dateYear = new Date().getFullYear();
    getDataByYear(dateYear);
});

$(".getDataByLikeSelect").click(function () {

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

$(".littleButton").click(function () {

    let is_deliver = 0;

    let params = {
        "is_deliver": is_deliver
    };
    getDataByLikeSelect(params);
});

function insertByYearMonthDay(){

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
            }else if(result.code === 150){
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

function deleteTableData(params, date) {

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
            }else if(result.code === 150){
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

function updateTableData(params, date) {

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
            }else if(result.code === 150){
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

function getDataByYearMonth(dateYearMonth){

    table.render({
        elem: '#onePieceTableYearMonth',
        skin: 'line',
        url: pathWeb + 'getOnePieceTableYearMonth',
        contentType: 'application/json',
        where: {
            "dateYearMonth": dateYearMonth
        },
        cellMinWidth: 80,
        height: 235,
        method: 'post',
        cols: [[
            {field:'id', title: 'ID', hide: true},
            {align:'center', title: '发货了吗', unresize: true, toolbar: '#is_deliver'},
            {field:'customer_name', title: '买家微信名', align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'goods_name', title: '买了什么', align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'profit', title: '赚了多少钱', sort: true, align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'date', title: '购买日期', align: 'center', unresize: true},
            {align:'center', title: '三思啊', unresize: true, toolbar: '#operationButton'}
        ]]
    });
    getOnePieceEChartsByYearMonth(dateYearMonth);
    getAchievementPercentage(dateYearMonth);
}

function getDataByLikeSelect(params) {

    table.render({
        elem: '#onePieceTableYearMonth',
        skin: 'line',
        url: pathWeb + 'getOnePieceTableYearMonth',
        contentType: 'application/json',
        where: params,
        cellMinWidth: 80,
        height: 235,
        method: 'POST',
        cols: [[
            {field:'id', title: 'ID', hide: true},
            {align:'center', title: '发货了吗', unresize: true, toolbar: '#is_deliver'},
            {field:'customer_name', title: '买家微信名', align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'goods_name', title: '买了什么', align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'profit', title: '赚了多少钱', sort: true, align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'date', title: '购买日期', align: 'center', unresize: true},
            {align:'center', title: '三思啊', toolbar: '#operationButton'}
        ]]
    });
}

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
            {field:'profit', title: '净利润', sort: true, align: 'center', unresize: true},
            {field:'date', title: '统计日期', align: 'center', unresize: true},
        ]]
    });
    getOnePieceEChartsByYear(dateYear);
}

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
                layer.alert(dateYear + "年一共赚了" + " " + data.data.profit + "块~", {
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
                element.progress("achievement", achievementPercentage + "%");
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

function getMenstruationCycle(){

    let index = layer.open({
        type: 2,
        title: ["来康康月经周期", "font-size:18px;font-weight:700"],
        anim: 2,
        content: pathWeb + "menstruationCycle.html"
    });
    layer.full(index);
}

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
            }else if(result.code === 150){
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
});

//年月日选择器
layDate.render({
    elem: '#dateYearMonthDay',
    trigger: 'click',
    max: maxYearMonthDay
});

//年月选择器
layDate.render({
    elem: '#dateYearMonth',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth,
    done: function(value){
        let dateYearMonth = formatDate(value);
        if (dateYearMonth !== ""){
            getDataByYearMonth(dateYearMonth);
        }
    }
});

//年选择器
layDate.render({
    elem: '#dateYear',
    trigger: 'click',
    type: 'year',
    max: maxYear,
    done: function(dateYear){
        if (dateYear !== ""){
            getDataByYear(dateYear);
        }
    }
});