let $ = layui.jquery,
    layer = layui.layer,
    form = layui.form,
    layDate = layui.laydate,
    pathWeb = getRootPathWeb(),
    customer,
    product,
    maxYearMonthDay = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();
getDropDownList();

// 提交表单，新增订单信息
form.on("submit", function(data){

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "insertOrder",
        data : JSON.stringify(data.field),
        success: function(result) {
            if(result.code === 0){
                form.val("orderForm", {
                    "customerName": "",
                    "productName": "",
                    "productAmount": "",
                    "productProfit": "",
                    "orderAddress": "",
                    "productList": ""
                });
                $("#addProduct").empty();
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
    return false;
});

// 订单信息表单验证规则
form.verify({

    yearMonthDay: function(value) {
        if (value === "" || value == null) {
            return "订单时间是必填项哦";
        }
    },
    customerName: function(value) {
        if (value === "" || value == null) {
            return "小伙伴微信名是必填项哦";
        }
    },
    productName: function(value) {
        if (value === "" || value == null) {
            return "宝贝的名称是必填项哦";
        }
    },
    productAmount: function(value) {
        if (value === "" || value == null) {
            return "宝贝的数量是必填项哦";
        }
        if (!isNumber(value)) {
            return "宝贝的数量必须填数字哦"
        }
    },
    productProfit: function(value) {
        if (value === "" || value == null) {
            return "赚了多少钱是必填项哦";
        }
        if (!isNumber(value)) {
            return "赚了多少钱必须填数字哦"
        }
    },
    orderAddress: function(value) {
        if (value === "" || value == null) {
            return "宝贝的发货地址是必填项哦";
        }
    },
    productList: function(value) {
        if (value === "" || value == null) {
            return "要先把宝贝添加到列表哦";
        }
    }
});

// 监听小伙伴微信名下拉框
form.on("select(customer)", function(data){
    if (data.value !== "" && data.value != null) {
        $.each(customer, function (k,v) {
            if (form.val("orderForm").customerName === v.customer_name) {
                $("#orderAddress").val(v.customer_address);
            }
        });
    } else {
        $("#orderAddress").val("");
    }
});

// 监听宝贝名称下拉框
form.on("select(product)", function(data){
    if (data.value !== "" && data.value != null) {
        $("#productAmount").val("1");
    } else {
        $("#productAmount").val("");
    }
});

// 监听是否包邮开关
form.on("switch(switch)", function(data){

    if (form.val("orderForm").productProfit !== "" && form.val("orderForm").productProfit != null) {
        if (data.elem.checked) {
            form.val("orderForm", {
                "productProfit": parseInt(form.val("orderForm").productProfit) - 7
            });
        } else {
            form.val("orderForm", {
                "productProfit": parseInt(form.val("orderForm").productProfit) + 7
            });
        }
    }
});

// 获取下拉框列表
function getDropDownList() {

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "getDropDownList",
        success: function(result) {
            if(result.code === 0){
                customer = result.data.customer;
                product = result.data.product;
                $.each(customer, function(k,v) {
                    $("#customerName").append('<option value=' + v.customer_name + '>' + v.customer_name + '</option>');
                });
                $.each(product, function(k,v) {
                    $("#productName").append('<option value=' + v.product_name + '>' + v.product_name + '</option>');
                });
                form.render();
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

// 添加宝贝
function addProduct() {

    if (form.val("orderForm").productName !== "" && form.val("orderForm").productName != null) {
        let productInfo = form.val("orderForm").productName + " * " + form.val("orderForm").productAmount;
        $("#addProduct").append('<button type="button" class="layui-btn layui-btn-normal" style="margin-bottom: 5px;">' + productInfo +'</button>');
        if (form.val("orderForm").productList !== "" && form.val("orderForm").productList != null) {
            form.val("orderForm", {
                "productList": form.val("orderForm").productList + "，" + productInfo
            });
        } else {
            form.val("orderForm", {
                "productList": productInfo
            });
        }
        if (form.val("orderForm").switch === "on") {
            $.each(product, function(k,v) {
                if (v.product_name === form.val("orderForm").productName) {
                    if (form.val("orderForm").productProfit !== "" && form.val("orderForm").productProfit != null) {
                        form.val("orderForm", {
                            "productProfit": parseInt(form.val("orderForm").productProfit) + parseInt(v.product_profit) * parseInt(form.val("orderForm").productAmount)
                        });
                    } else {
                        form.val("orderForm", {
                            "productProfit": parseInt(v.product_profit) * parseInt(form.val("orderForm").productAmount) - 7
                        });
                    }
                }
            });
        } else {
            $.each(product, function(k,v) {
                if (v.product_name === form.val("orderForm").productName) {
                    if (form.val("orderForm").productProfit !== "" && form.val("orderForm").productProfit != null) {
                        form.val("orderForm", {
                            "productProfit": parseInt(form.val("orderForm").productProfit) + parseInt(v.product_profit) * parseInt(form.val("orderForm").productAmount)
                        });
                    } else {
                        form.val("orderForm", {
                            "productProfit": parseInt(v.product_profit) * parseInt(form.val("orderForm").productAmount)
                        });
                    }
                }
            });
        }
    }
}

// 年月日选择器
layDate.render({
    elem: "#yearMonthDay",
    trigger: "click",
    max: maxYearMonthDay
});
