let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    table = layui.table,
    layDate = layui.laydate,
    form = layui.form,
    util = layui.util,
    layTPL = layui.laytpl,
    maxYear = new Date().getFullYear() + "-12-31",
    maxYearMonth = new Date().getFullYear() + "-" + (new Date().getMonth() + 1),
    maxYearMonthDay = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate(),
    orderTime = new Date().getFullYear() + "-" + formatDateMonth(new Date().getMonth() + 1),
    dateYear = new Date().getFullYear(),
    productNameAndNumber,
    productId,
    productInfo,
    index;
getOrderInfo({"orderTime": orderTime});
getOrderEChartsByMonth(orderTime);
getDataByYear(dateYear);

// 新增订单信息页弹框
function insertOrder() {
    layTPL($("#insertOrder").html()).render(1, function (html) {
        layer.open({
            title: ["新增订单信息", "font-size:18px;font-weight:bold;background-color: #009688;"],
            type: 1,
            area: ["650px", "685px"],
            content: html,
            btn: ["保存并继续", "保存后关闭"],
            resize: false,
            success: function () {
                productId = 1;
                productNameAndNumber = [];
                getInsertOrderTable(productNameAndNumber);
                // 年月日选择器
                layDate.render({
                    elem: "#orderTime",
                    btns: ['clear', 'confirm'],
                    value: new Date(),
                    max: maxYearMonthDay
                });
                form.render();

                // 监听是否包邮开关
                form.on("checkbox(switch)", function (data) {
                    if (form.val("orderForm").profit !== "") {
                        if (data.elem.checked) {
                            form.val("orderForm", {
                                "profit": parseInt(form.val("orderForm").profit) - 7
                            });
                        } else {
                            form.val("orderForm", {
                                "profit": parseInt(form.val("orderForm").profit) + 7
                            });
                        }
                    }
                });

                // 订单表格数据删除监听事件
                table.on("tool(insertOrderTable)", function (obj) {
                    layer.confirm("确定要删除吗？", {
                        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                        icon: 3
                    }, function (index) {
                        for (let i = 0; i < productNameAndNumber.length; i++) {
                            if (productNameAndNumber[i].productId === obj.data.productId) {
                                productNameAndNumber.splice(i, 1);
                                break;
                            }
                        }
                        let profit = parseInt(form.val("orderForm").profit),
                            productProfit = parseInt(obj.data.productProfit);

                        if (profit - productProfit < 0 || form.val("orderForm").profit === '') {
                            form.val("orderForm", {
                                "profit": ""
                            });
                        } else {
                            form.val("orderForm", {
                                "profit": profit - productProfit
                            });
                        }
                        layer.close(index);
                        getInsertOrderTable(productNameAndNumber);
                    });
                });

                // 提交表单，新增订单信息
                form.on("submit(orderForm)", function (data) {
                    $.ajax({
                        type: "POST",
                        url: "/order/insert",
                        data: {
                            "customerName": data.field.customerName,
                            "customerAddress": data.field.customerAddress,
                            "productName": data.field.productList,
                            "profit": data.field.profit,
                            "orderTime": data.field.orderTime
                        },
                        success: function (result) {
                            if (result.code === 0) {
                                form.val('orderForm', {
                                    'customerName': '',
                                    'customerAddress': '',
                                    'productName': '',
                                    'productAmount': '',
                                    'profit': ''
                                });
                                getInsertOrderTable([]);
                                getOrderInfo({"orderTime": data.field.orderTime.slice(0, 7)});
                                getOrderEChartsByMonth(data.field.orderTime.slice(0, 7));
                                getDataByYear(dateYear);
                            } else {
                                layer.alert(result.msg, {
                                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                                    icon: 0
                                });
                            }
                        }
                    });
                    return false;
                });
            },
            yes: function () {
                $.each(table.checkStatus("insertOrderTable").data, function (k, v) {
                    if (form.val("orderForm").productList !== "") {
                        form.val("orderForm", {
                            "productList": form.val("orderForm").productList + "，" + v.productName + " * " + v.productNumber
                        });
                    } else {
                        form.val("orderForm", {
                            "productList": v.productName + " * " + v.productNumber
                        });
                    }
                });
                $(".layui-btn.orderForm").click();
            },
            btn2: function (index) {
                $.each(table.checkStatus("insertOrderTable").data, function (k, v) {
                    if (form.val("orderForm").productList !== "") {
                        form.val("orderForm", {
                            "productList": form.val("orderForm").productList + "，" + v.productName + " * " + v.productNumber
                        });
                    } else {
                        form.val("orderForm", {
                            "productList": v.productName + " * " + v.productNumber
                        });
                    }
                });
                layer.close(index);
                $(".layui-btn.orderForm").click();
            }
        });
    });
}

// 添加宝贝
function addProduct() {
    if (form.val("orderForm").productName !== "") {
        if (form.val("orderForm").switch === "on") {
            if (form.val("orderForm").profit !== "") {
                form.val("orderForm", {
                    "profit": parseInt(form.val("orderForm").profit) + parseInt(productInfo.profit) * parseInt(form.val("orderForm").productAmount)
                });
            } else {
                form.val("orderForm", {
                    "profit": parseInt(productInfo.profit) * parseInt(form.val("orderForm").productAmount) - 7
                });
            }
        } else {
            if (form.val("orderForm").profit !== "") {
                form.val("orderForm", {
                    "profit": parseInt(form.val("orderForm").profit) + parseInt(productInfo.profit) * parseInt(form.val("orderForm").productAmount)
                });
            } else {
                form.val("orderForm", {
                    "profit": parseInt(productInfo.profit) * parseInt(form.val("orderForm").productAmount)
                });
            }
        }
        if (productNameAndNumber === []) {
            productNameAndNumber = [
                {
                    "productId": productId += 1,
                    "LAY_CHECKED": true,
                    "productName": productInfo.name,
                    "productNumber": form.val("orderForm").productAmount,
                    "productProfit": parseInt(productInfo.profit) * parseInt(form.val("orderForm").productAmount)
                }
            ];
        } else {
            productNameAndNumber.push({
                "productId": productId += 1,
                "LAY_CHECKED": true,
                "productName": productInfo.name,
                "productNumber": form.val("orderForm").productAmount,
                "productProfit": parseInt(productInfo.profit) * parseInt(form.val("orderForm").productAmount)
            });
        }
        getInsertOrderTable(productNameAndNumber);
    } else {
        layer.alert("请先选择商品名", {
            title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
            icon: 0,
            anim: 6
        });
    }
}

// 插入订单信息列表
function getInsertOrderTable(data) {
    table.render({
        elem: "#insertOrderTable",
        skin: "line",
        height: 197,
        cols: [[
            {
                field: "productId",
                title: "ID",
                hide: true
            },
            {
                field: "LAY_CHECKED",
                title: "LAY_CHECKED",
                hide: true
            },
            {
                field: "productName",
                title: "商品名称",
                align: "center",
                unresize: true
            },
            {
                field: "productNumber",
                title: "数量",
                align: "center",
                unresize: true
            },
            {
                field: "productProfit",
                title: "利润",
                align: "center",
                unresize: true
            },
            {
                fixed: "right",
                align: "center",
                title: "操作",
                unresize: true,
                toolbar: "#operationButton",
                width: 120
            }
        ]],
        data: data
    });
}

// 点击查询未发货订单
function undelivered() {
    layTPL($("#undeliveredOrder").html()).render(1, function (html) {
        productIndex = layer.open({
            title: ["未发货订单信息", "font-size:18px;font-weight:bold;background-color: #009688;"],
            type: 1,
            area: ["1000px", "515px"],
            content: html,
            resize: false,
            success: function () {
                getUndeliveredOrderInfo();
            }
        });
    });
}

function getUndeliveredOrderInfo() {
    $.ajax({
        type: "POST",
        url: "/order/selectUndelivered",
        success: function (result) {
            if (result.code === 0) {
                table.render({
                    elem: "#undeliveredOrderTable",
                    skin: "line",
                    cols: [[
                        {
                            field: "id",
                            title: "ID",
                            hide: true
                        },
                        {
                            fixed: "left",
                            align: "center",
                            title: "发货状态",
                            unresize: true,
                            toolbar: "#isDeliver",
                            width: 100
                        },
                        {
                            field: "customerName",
                            title: "微信名",
                            align: "center",
                            unresize: true,
                            width: 120
                        },
                        {
                            field: "productName",
                            title: "商品名",
                            align: "center",
                            unresize: true,
                            width: 200
                        }, {
                            field: "customerAddress",
                            title: "发货地址",
                            align: "center",
                            unresize: true,
                            edit: "orderTable"
                        },
                        {
                            field: "orderTime",
                            title: "订单时间",
                            align: "center",
                            unresize: true,
                            width: 120
                        }
                    ]],
                    data: result.data
                });
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0
                });
            }
        }
    });
}

// 逻辑删除订单信息
function deleteTableData(params) {

    $.ajax({
        type: "POST",
        url: "/order/delete",
        data: params,
        success: function (result) {
            if (result.code === 0) {
                refreshData();
                layer.msg('删除成功', {
                    time: 1000
                });
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0,
                    anim: 6
                });
            }
        }
    });
}

// 修改订单信息
function updateTableData(params) {

    $.ajax({
        type: "POST",
        url: "/order/update",
        data: params,
        success: function (result) {
            if (result.code === 0) {
                refreshData();
                layer.msg('修改成功', {
                    time: 1000
                });
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0,
                    anim: 6
                });
            }
        }
    });
}

// 根据关键字查询订单信息
function queryKeyword() {
    if (form.val('orderQueryForm').date === '' && form.val('orderQueryForm').name === '') {
        layer.alert(
            "请至少填写一个查询条件",
            {title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"], icon: 3, anim: 6}
        );
    } else {
        let params = {
            "orderTime": form.val('orderQueryForm').date,
            "keyword": form.val('orderQueryForm').name
        };
        getOrderInfo(params);
    }
}

// 查询订单信息
function getOrderInfo(params) {
    $.ajax({
        type: "POST",
        url: "/order/select",
        data: params,
        success: function (result) {
            if (result.code === 0) {
                table.render({
                    elem: "#onePieceTableYearMonth",
                    skin: "line",
                    page: true,
                    limit: 7,
                    limits: [7],
                    cols: [[
                        {
                            field: "id",
                            title: "ID",
                            hide: true
                        },
                        {
                            fixed: "left",
                            align: "center",
                            title: "发货状态",
                            unresize: true,
                            toolbar: "#isDeliver",
                            width: 100
                        },
                        {
                            field: "customerName",
                            title: "微信名",
                            align: "center",
                            unresize: true,
                            edit: "orderTable",
                            width: 120
                        },
                        {
                            field: "productName",
                            title: "商品名",
                            align: "center",
                            unresize: true,
                            edit: "orderTable"
                        }, {
                            field: "profit",
                            title: "利润",
                            align: "center",
                            unresize: true,
                            edit: "orderTable",
                            width: 88
                        },
                        {
                            field: "orderTime",
                            title: "订单时间",
                            align: "center",
                            unresize: true,
                            width: 120
                        },
                        {
                            fixed: "right",
                            align: "center",
                            title: "操作",
                            unresize: true,
                            toolbar: "#operationButton",
                            width: 100
                        }
                    ]],
                    data: result.data
                });
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0
                });
            }
        }
    });
}

// 根据年份查询订单信息
function getDataByYear(orderTime) {
    $.ajax({
        type: "POST",
        url: "/order/selectMonthData",
        data: {
            "orderTime": orderTime
        },
        success: function (result) {
            if (result.code === 0) {
                table.render({
                    elem: "#onePieceTableYear",
                    skin: "line",
                    page: true,
                    limit: 7,
                    limits: [7],
                    cols: [[
                        {
                            field: "profit",
                            title: "统计收入",
                            sort: true,
                            align: "center",
                            unresize: true
                        },
                        {
                            field: "date",
                            title: "统计月份",
                            align: "center",
                            unresize: true
                        }
                    ]],
                    data: result.data
                });
                getOrderEChartsByYear(orderTime);
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0
                });
            }
        }
    });
}

// 订单表格数据删除监听事件
table.on("tool(orderTable)", function (obj) {
    if (obj.event === "delete") {
        layer.confirm("确定要删除吗？", {
            title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
            icon: 3
        }, function (index) {
            deleteTableData(obj.data);
            layer.close(index);
        });
    }
});

// 订单表格数据编辑监听事件
table.on('edit(orderTable)', function (obj) {
    layer.confirm("确定改成这样吗", {
        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
        icon: 3
    }, function (index) {
        updateTableData(obj.data);
        layer.close(index);
    });
});

// 订单表格订单发货按钮监听事件
form.on("switch(isDeliver)", function (data) {
    let isDeliver = data.elem.checked === true ? 1 : 0;
    $.ajax({
        type: "POST",
        url: "/order/update",
        data: {
            "id": data.value,
            "isDeliver": isDeliver
        },
        success: function (result) {
            if (result.code === 0) {
                let msg = isDeliver = 1 ? '发货成功' : '发货撤销'
                layer.msg(msg, {
                    time: 1000
                }, function () {
                    getUndeliveredOrderInfo();
                    getOrderInfo({
                        "orderTime": form.val("orderQueryForm").date !== '' ? form.val("orderQueryForm").date : orderTime
                    });
                });
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0
                });
            }
        }
    });
});

// 根据月份展示订单信息ECharts图
function getOrderEChartsByMonth(orderTime) {
    $.ajax({
        type: "POST",
        url: "/order/getOrderEChartsByMonth",
        data: {
            "orderTime": orderTime
        },
        success: function (result) {
            if (result.code === 0) {
                let myChart = echarts.init(document.getElementById("onePieceEChartsByYearMonth")),
                    EChartsX = result.data.EChartsX,
                    EChartsY = result.data.EChartsY,
                    option = {
                        tooltip: {
                            trigger: "axis",
                            axisPointer: {
                                type: "none"
                            }
                        },
                        color: ["#33ABA0"],
                        xAxis: {
                            type: "category",
                            data: EChartsX
                        },
                        yAxis: {
                            type: "value"
                        },
                        series: [
                            {
                                data: EChartsY,
                                type: "bar",
                                markLine: {
                                    symbol: "none", //去掉警戒线最后面的箭头
                                    label: {
                                        position: "end", //将警示值放在哪个位置，三个值“start”,"middle","end"  开始  中点 结束
                                        formatter: "100块",
                                        color: "#696969",
                                        fontSize: 12
                                    },
                                    data: [{
                                        silent: false, //鼠标悬停事件  true没有，false有
                                        lineStyle: { //警戒线的样式，虚实，颜色
                                            color: "#696969"
                                        },
                                        yAxis: 100 //警戒线的标注值，可以有多个yAxis，多条警示线，或者采用{type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
                                    }]
                                }
                            }
                        ]
                    };
                myChart.setOption(option);
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0
                });
            }
        }
    });
}

// 根据年份展示订单信息ECharts图
function getOrderEChartsByYear(orderTime) {
    $.ajax({
        type: "POST",
        url: "/order/getOrderEChartsByYear",
        data: {
            "orderTime": orderTime
        },
        success: function (result) {
            if (result.code === 0) {
                let myChart = echarts.init(document.getElementById("onePieceEChartsByYear")),
                    EChartsX = result.data.EChartsX,
                    EChartsY = result.data.EChartsY,
                    option = {
                        tooltip: {
                            trigger: "axis",
                            axisPointer: {
                                type: "none"
                            }
                        },
                        color: ["#4186bb"],
                        xAxis: {
                            type: "category",
                            data: EChartsX
                        },
                        yAxis: {
                            type: "value"
                        },
                        series: [{
                            data: EChartsY,
                            type: "bar",
                            markLine: {
                                symbol: "none", //去掉警戒线最后面的箭头
                                label: {
                                    position: "end", //将警示值放在哪个位置，三个值“start”,"middle","end"  开始  中点 结束
                                    formatter: "3000块",
                                    color: "#696969",
                                    fontSize: 12
                                },
                                data: [{
                                    silent: false, //鼠标悬停事件  true没有，false有
                                    lineStyle: { //警戒线的样式，虚实，颜色
                                        color: "#696969"
                                    },
                                    yAxis: 3000 //警戒线的标注值，可以有多个yAxis，多条警示线，或者采用{type : 'average', name: '平均值'}，type值有  max  min  average，分为最大，最小，平均值
                                }]
                            }
                        }]
                    };
                myChart.setOption(option);
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0
                });
            }
        }
    });
}

// 根据年份查询收入总额
function getCountByYear() {
    let dateYear = $("#dateYear").val();

    if (dateYear == null || dateYear === "") {
        layer.msg("要选择一个年份哦", {
            anim: 6
        });
        return;
    }
    let params = {
        "dateYear": dateYear
    };
    $.ajax({
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: "/getOnePieceCountByYear",
        data: JSON.stringify(params),
        success: function (data) {
            if (data.data == null) {
                layer.alert("还没有收入，哭泣！", {
                    skin: "layui-layer-molv",
                    closeBtn: 0
                });
            } else {
                layer.alert(dateYear + "年一共赚了" + " " + data.data.profit + "块", {
                    skin: "layui-layer-molv",
                    closeBtn: 0
                });
            }
        }
    });
}

// 刷新订单信息
function refreshData() {
    getOrderInfo({"orderTime": orderTime});
    getUndeliveredOrderInfo();
    getOrderEChartsByMonth(orderTime);
    getDataByYear(orderTime.substring(0, 4));
}