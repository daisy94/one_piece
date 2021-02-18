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
getDataByLikeSelect({"dateYearMonth": dateYearMonth});
getOnePieceEChartsByYearMonth(dateYearMonth);
getAchievementPercentage(dateYearMonth);
let dateYear = new Date().getFullYear();
getDataByYear(dateYear);
customerTable();
productTable();

// 新增订单信息页弹框
function insertOrder() {

    layer.open({
        title: ["新增订单信息", "font-size:18px;font-weight:bold;"],
        type: 2,
        area: ["666px", "550px"],
        content: "insertOrder.html",
        cancel: function(){
            getDataByLikeSelect({"dateYearMonth": dateYearMonth});
            getOnePieceEChartsByYearMonth(dateYearMonth);
            getAchievementPercentage(dateYearMonth);
            getDataByYear(dateYear);
        }
    });
}

// 新增顾客信息页弹框
function insertCustomer() {

    layer.open({
        title: ["新增顾客信息", "font-size:18px;font-weight:bold;"],
        type: 2,
        area: ["559px", "250px"],
        content: "insertCustomer.html",
        end: function(){
            $("#customerName").val("");
            customerTable();
        }
    });
}

// 新增商品信息页弹框
function insertProduct() {

    layer.open({
        title: ["新增商品信息", "font-size:18px;font-weight:bold;"],
        type: 2,
        area: ["559px", "365px"],
        content: "insertProduct.html",
        end: function(){
            $("#productName").val("");
            productTable();
        }
    });
}

// 点击查询未发货订单
$(".littleButton").click(function () {

    isTrue = true;
    let is_deliver = 0;

    let params = {
        "is_deliver": is_deliver
    };
    getDataByLikeSelect(params);
});

// 逻辑删除订单信息
function deleteTableData(params) {

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "deleteOnePieceTableData",
        data : params,
        success: function(result) {
            if(result.code === 0){
                if (isTrue) {
                    let params = {
                        "is_deliver": 0
                    };
                    getDataByLikeSelect(params);
                } else {
                    getDataByLikeSelect({"dateYearMonth": dateYearMonth});
                    getOnePieceEChartsByYearMonth(dateYearMonth);
                    getAchievementPercentage(dateYearMonth);
                    let dateYear = dateYearMonth.substring(0,4);
                    getDataByYear(dateYear);
                }
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
function updateTableData(params) {

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "updateOnePieceTableData",
        data : params,
        success: function(result) {
            if(result.code === 0){
                if (isTrue) {
                    let params = {
                        "is_deliver": 0
                    };
                    getDataByLikeSelect(params);
                } else {
                    getDataByLikeSelect({"dateYearMonth": dateYearMonth});
                    getOnePieceEChartsByYearMonth(dateYearMonth);
                    getAchievementPercentage(dateYearMonth);
                    let dateYear = dateYearMonth.substring(0,4);
                    getDataByYear(dateYear);
                }
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

// 根据关键字查询订单信息
function queryKeyword() {

    if (($("#dateYearMonth").val() === "" || $("#dateYearMonth").val() == null) && ($("#queryKeyword").val() === "" || $("#queryKeyword").val() == null)) {
        layer.confirm("你什么查询条件都没写，这样会查出全部的数据，可能有点慢哦", {title: "纳尼！"}, function(index){
            isTrue = false;
            let params = {
                "dateYearMonth": formatDate($("#dateYearMonth").val()),
                "queryKeyword": $("#queryKeyword").val()
            };
            getDataByLikeSelect(params);
            layer.close(index);
        });
    } else {
        isTrue = false;
        let params = {
            "dateYearMonth": formatDate($("#dateYearMonth").val()),
            "queryKeyword": $("#queryKeyword").val()
        };
        getDataByLikeSelect(params);
    }
}

// 模糊查询订单信息
function getDataByLikeSelect(params) {

    table.render({
        elem: '#onePieceTableYearMonth',
        skin: 'line',
        url: pathWeb + 'getOnePieceTableYearMonth',
        contentType: 'application/json',
        where: params,
        height: 275,
        method: 'POST',
        cols: [[
            {field:'id', title: 'ID', hide: true},
            {fixed:'left', align:'center', title: '状态', unresize: true, toolbar: '#is_deliver', width: 100},
            {field:'customer_name', title: '微信名', align: 'center', unresize: true, edit: 'onePieceTable', width: 150},
            {field:'goods_name', title: '恰了什么', align: 'center', unresize: true, edit: 'onePieceTable', width: 450},
            {field:'customer_address', title: '发货地址', align: 'center', edit: 'onePieceTable', width: 591},
            {field:'profit', title: '恰饭', sort: true, align: 'center', unresize: true, edit: 'onePieceTable'},
            {field:'date', title: '下单时间', sort: true, align: 'center', unresize: true, width: 110},
            {fixed:'right', align:'center', title: '操作', unresize: true, toolbar: '#operationButton', width: 150}
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
        height: 275,
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

// 模糊查询顾客信息表格
function queryCustomer() {
    customerTable();
}

// 查询顾客信息表格
function customerTable() {

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "getCustomerTable",
        data: JSON.stringify({"customerName": $("#customerName").val()}),
        success: function(result) {
            if (result.code === 0) {
                table.render({
                    elem: "#customerTable",
                    skin: "line",
                    page: true,
                    limit: 8,
                    limits: [8],
                    height: 394,
                    method: "POST",
                    cols: [[
                        {field: "id", title: "ID", hide: true},
                        {field: "customer_name", title: "微信名", align: "center", unresize: true, edit: "customerTable", width: 150},
                        {field: "customer_address", title: "发货地址", align: "center", unresize: true, edit: "customerTable"},
                        {align: "center", title: "操作", unresize: true, toolbar: "#operationButtonCustomer", width: 150}
                    ]],
                    data: result.data
                });
            } else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 删除顾客信息
function deleteCustomerTableData(params) {

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "deleteCustomer",
        data: JSON.stringify(params),
        success: function(result) {
            if (result.code === 0) {
                customerTable();
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 修改顾客信息
function updateCustomerTableData(params) {

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "updateCustomer",
        data: JSON.stringify(params),
        success: function(result) {
            if (result.code === 0) {
                customerTable();
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 删除商品信息
function deleteProductTableData(params) {

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "deleteProduct",
        data: JSON.stringify(params),
        success: function(result) {
            if (result.code === 0) {
                productTable();
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 修改商品信息
function updateProductTableData(params) {

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "updateProduct",
        data: JSON.stringify(params),
        success: function(result) {
            if (result.code === 0) {
                productTable();
                layer.msg(result.msg);
            } else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 模糊查询商品信息表格
function queryProduct() {
    productTable();
}

// 查询商品信息表格
function productTable() {

    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "getProductTable",
        data: JSON.stringify({"productName": $("#productName").val()}),
        success: function(result) {
            if (result.code === 0) {
                table.render({
                    elem: "#productTable",
                    skin: "line",
                    page: true,
                    limit: 8,
                    limits: [8],
                    height: 394,
                    method: "POST",
                    cols: [[
                        {field: "id", title: "ID", hide: true},
                        {field: "product_name", title: "名称", align: "center", unresize: true, edit: "productTable", width: 200},
                        {field: "product_price", title: "卖价", align: "center", unresize: true, edit: "productTable"},
                        {field: "product_cost", title: "拿价", align: "center", unresize: true, edit: "productTable"},
                        {field: "product_profit", title: "利润", align: "center", unresize: true, edit: "productTable"},
                        {align: "center", title: "操作", unresize: true, toolbar: "#operationButtonProduct", width: 150}
                    ]],
                    data: result.data
                });
            } else {
                layer.msg(result.msg);
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

// 订单表格数据编辑、删除监听事件
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
        let customerAddress = data.customer_address;
        let profit = data.profit;
        if(customerName === "" || goodsName === "" || profit === "" || customerAddress === ""){

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

// 顾客表格数据编辑、删除监听事件
table.on("tool(customerTable)", function(obj){

    let data = obj.data;
    if (obj.event === "delete"){
        layer.confirm("确定不要了吗", {title: "纳尼！"}, function(){
            deleteCustomerTableData({"id": data.id});
        });
    } else if(obj.event === "edit"){
        if(data.customer_name === "" || data.customer_address === ""){

            layer.msg("说好的修改，你却什么也没填！", {
                anim: 6
            });
            customerTable();
            return;
        }
        layer.confirm("确定改成这样吗", {title: "纳尼！"}, function(){
            updateCustomerTableData(data);
        });
    }
});

// 商品表格数据编辑、删除监听事件
table.on("tool(productTable)", function(obj){

    let data = obj.data;
    if (obj.event === "delete"){
        layer.confirm("确定不要了吗", {title: "纳尼！"}, function(){
            deleteProductTableData({"id": data.id});
        });
    } else if(obj.event === "edit"){
        if(data.product_name === "" || data.product_price === ""){

            layer.msg("商品名称、商品卖价是必填哒~", {
                anim: 6
            });
            productTable();
            return;
        }
        layer.confirm("确定改成这样吗", {title: "纳尼！"}, function(){
            updateProductTableData(data);
        });
    }
});

// 订单表格订单发货按钮监听事件
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
            getDataByLikeSelect({"dateYearMonth": dateYearMonth});
            getOnePieceEChartsByYearMonth(dateYearMonth);
            getAchievementPercentage(dateYearMonth);
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