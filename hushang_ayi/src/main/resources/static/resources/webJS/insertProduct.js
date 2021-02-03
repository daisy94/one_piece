let $ = layui.jquery,
    layer = layui.layer,
    form = layui.form,
    pathWeb = getRootPathWeb();

// 监控商品信息表单输入框
$("#productCost").bind("input propertychange", function() {

    if (form.val("productForm").productPrice !== "") {

        if (form.val("productForm").productCost === "") {
            form.val("productForm", {
                "productProfit": ""
            });
        } else {
            form.val("productForm", {
                "productProfit": form.val("productForm").productPrice - form.val("productForm").productCost
            });
        }
    }
});

// 监控商品信息表单输入框
$("#productPrice").bind("input propertychange", function() {

    if (form.val("productForm").productCost !== "") {

        if (form.val("productForm").productPrice === "") {
            form.val("productForm", {
                "productProfit": ""
            });
        } else {
            form.val("productForm", {
                "productProfit": form.val("productForm").productPrice - form.val("productForm").productCost
            });
        }
    }
});

// 提交表单，新增商品信息
form.on("submit", function(data){

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "insertProduct",
        data : JSON.stringify(data.field),
        success: function(result) {
            if(result.code === 0){
                layer.msg(result.msg);
                window.setTimeout(function () {
                    parent.layer.close(parent.layer.getFrameIndex(window.name));
                },1500);
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

// 商品信息表达验证规则
form.verify({

    productName: function(value) {
        if (value === "" || value == null) {
            return "商品名一定要填哦";
        }
    },
    productPrice: function(value) {
        if (value === "" || value == null) {
            return "商品卖价一定要填哦";
        }
    }
});
