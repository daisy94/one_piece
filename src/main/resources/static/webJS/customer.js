let customerIndex;

// 打开顾客信息列表
function openCustomer() {
    layTPL($("#openCustomer").html()).render(1, function (html) {
        index = layer.open({
            title: ["顾客信息列表", "font-size:18px;font-weight:bold;background-color: #009688;"],
            type: 1,
            area: ["900px", "595px"],
            content: html,
            resize: false,
            success: function () {
                customerTable();
            }
        });
    });
}

// 新增顾客信息页弹框
function insertCustomer() {
    layTPL($("#insertCustomer").html()).render(1, function (html) {
        customerIndex = layer.open({
            title: ["新增顾客信息", "font-size:18px;font-weight:bold;background-color: #009688;"],
            type: 1,
            area: ["500px", "230px"],
            content: html,
            btn: ["保存"],
            resize: false,
            yes: function () {
                $(".layui-btn.customerForm").click();
            }
        });
    });
}

// 查询顾客信息表格
function queryCustomer() {
    customerTable();
}

// 查询顾客信息表格
function customerTable() {
    $.ajax({
        type: "POST",
        url: "/customer/select",
        data: {
            "name": form.val('customerQueryForm').name
        },
        success: function (result) {
            if (result.code === 0) {
                table.render({
                    elem: "#customerTable",
                    skin: "line",
                    page: true,
                    limit: 10,
                    limits: [10],
                    height: 472,
                    cols: [[
                        {
                            type: 'radio'
                        },
                        {
                            field: "id",
                            title: "ID",
                            hide: true
                        },
                        {
                            field: "name",
                            title: "微信名",
                            align: "center",
                            edit: "customerTable",
                            unresize: true,
                            width: 150
                        },
                        {
                            field: "address",
                            title: "收货地址",
                            align: "center",
                            edit: "customerTable",
                            width: 440
                        },
                        {
                            field: "updateTime",
                            title: "更新时间",
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

// 新增顾客信息
form.on("submit(customerForm)", function (data) {
    $.ajax({
        type: "POST",
        url: "/customer/insert",
        data: data.field,
        success: function (result) {
            if (result.code === 0) {
                layer.close(customerIndex);
                layer.msg(result.msg);
                customerTable();
            } else {
                layer.alert(result.msg, {
                    title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                    icon: 0,
                    anim: 6
                });
            }
        }
    });
    return false;
});

// 表格删除监听
table.on("tool(customerTable)", function (obj) {
    layer.confirm("确定要删除吗？", {
        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
        icon: 3
    }, function () {
        $.ajax({
            type: "POST",
            url: "/customer/delete",
            data: {
                "id": obj.data.id
            },
            success: function (result) {
                if (result.code === 0) {
                    layer.msg(result.msg);
                    customerTable();
                } else {
                    layer.alert(result.msg, {
                        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                        icon: 0
                    });
                }
            }
        });
    });
});

// 表格编辑监听
table.on('edit(customerTable)', function (obj) {
    layer.confirm("确定要修改吗？", {
        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
        icon: 3
    }, function () {
        $.ajax({
            type: "POST",
            url: "/customer/update",
            data: {
                id: obj.data.id,
                name: obj.data.name,
                address: obj.data.address,
            },
            success: function (result) {
                if (result.code === 0) {
                    layer.msg(result.msg);
                    customerTable();
                } else {
                    layer.alert(result.msg, {
                        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
                        icon: 0
                    });
                }
            }
        });
    });
});

// 表格单选监听
table.on('radio(customerTable)', function (obj) {
    form.val("orderForm", {
        "customerName": obj.data.name,
        "customerAddress": obj.data.address
    });
    layer.close(index);
});