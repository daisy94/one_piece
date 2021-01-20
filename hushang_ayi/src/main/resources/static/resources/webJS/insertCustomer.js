let $ = layui.jquery,
    layer = layui.layer,
    form = layui.form,
    pathWeb = getRootPathWeb();

// 提交表单，新增顾客信息
form.on("submit", function(data){

    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "insertCustomer",
        data : JSON.stringify(data.field),
        success: function(result) {
            if(result.code === 0){
                form.val("customerForm", {
                    "customerName": "",
                    "customerAddress": ""
                });
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

// 顾客信息表单验证规则
form.verify({

    customerName: function(value) {
        if (value === "" || value == null) {
            return "小仙女的微信名一定要填哦";
        }
    },
    customerAddress: function(value) {
        if (value === "" || value == null) {
            return "发货地址一定要填哦";
        }
    }
});
