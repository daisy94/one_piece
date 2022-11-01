let productIndex;

// 打开商品信息列表
function openProduct() {
    layTPL($("#openProduct").html()).render(1, function (html) {
        index = layer.open({
            title: ["商品信息列表", "font-size:18px;font-weight:bold;background-color: #009688;"],
            type: 1,
            area: ["900px", "595px"],
            content: html,
            resize: false,
            success: function () {
                productTable();
            }
        });
    });
}

// 新增商品信息页弹框
function insertProduct() {
    layTPL($("#insertProduct").html()).render(1, function (html) {
        productIndex = layer.open({
            title: ["新增商品信息", "font-size:18px;font-weight:bold;background-color: #009688;"],
            type: 1,
            area: ["500px", "280px"],
            content: html,
            btn: ["保存"],
            resize: false,
            success: function () {
                // 表单验证规则
                form.verify({
                    name: function (value) {
                        if (value === "") {
                            return "请填写商品名称";
                        }
                    },
                    price: function (value) {
                        if (value === "") {
                            return "请填写商品售价";
                        }
                    },
                    cost: function (value) {
                        if (value === "") {
                            return "请填写商品成本";
                        }
                    }
                });
            },
            yes: function () {
                $(".layui-btn.productForm").click();
            }
        });
    });
}

// 查询商品信息表格
function queryProduct() {
    productTable();
}

// 查询商品信息表格
function productTable() {
    $.ajax({
        type: "POST",
        url: "/product/select",
        data: {"name": form.val('productQueryForm').name},
        success: function (result) {
            if (result.code === 0) {
                table.render({
                    elem: "#productTable",
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
                            title: "商品名称",
                            align: "center",
                            edit: "customerTable",
                            unresize: true,
                            width: 200
                        },
                        {
                            field: "price",
                            title: "卖价",
                            align: "center",
                            edit: "customerTable",
                            unresize: true
                        },
                        {
                            field: "cost",
                            title: "拿价",
                            align: "center",
                            edit: "customerTable",
                            unresize: true
                        },
                        {
                            title: "利润",
                            align: "center",
                            templet: '<div><button type="button" class="layui-btn layui-btn-primary layui-btn-xs layui-btn-radius layui-border-green">{{ d.profit }}</button></div>',
                            unresize: true
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
                    icon: 0,
                    anim: 6
                });
            }
        }
    });
}

// 提交表单，新增商品信息
form.on("submit(productForm)", function (data) {
    $.ajax({
        type: "POST",
        url: "/product/insert",
        data: data.field,
        success: function (result) {
            if (result.code === 0) {
                layer.msg(result.msg, {
                    time: 1500
                }, function () {
                    layer.close(productIndex);
                    productTable();
                });
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

// 表格删除监听
table.on("tool(productTable)", function (obj) {
    layer.confirm("确定要删除吗？", {
        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
        icon: 3
    }, function () {
        $.ajax({
            type: "POST",
            url: "/product/delete",
            data: {
                "id": obj.data.id
            },
            success: function (result) {
                if (result.code === 0) {
                    layer.msg(result.msg, {
                        time: 1500
                    }, function () {
                        productTable();
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
});

// 表格编辑监听
table.on('edit(productTable)', function (obj) {
    layer.confirm("确定要修改吗？", {
        title: ["纳尼！", "font-size:18px;font-weight:bold;background-color: #009688;"],
        icon: 3
    }, function () {
        $.ajax({
            type: "POST",
            url: "/product/update",
            data: {
                id: obj.data.id,
                name: obj.data.name,
                price: obj.data.price,
                cost: obj.data.cost,
            },
            success: function (result) {
                if (result.code === 0) {
                    layer.msg(result.msg, {
                        time: 1500
                    }, function () {
                        productTable();
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
});

// 表格单选监听
table.on('radio(productTable)', function (obj) {
    productInfo = obj.data;
    form.val("orderForm", {
        "productName": productInfo.name,
        "productAmount": "1"
    });
    layer.close(index);
});