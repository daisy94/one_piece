let $ = layui.jquery,
    layer = layui.layer,
    table = layui.table,
    form = layui.form,
    pathWeb = getRootPathWeb();

customerTable();

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

function customerTable() {

    table.render({
        elem: "#customerTable",
        skin: "line",
        url: pathWeb + "getCustomerTable",
        contentType: "application/json",
        height: 269,
        method: "POST",
        cols: [[
            {field: "id", title: "ID", hide: true},
            {field: "customer_name", title: "微信名", align: "center", unresize: true, edit: "customerTable"},
            {field: "customer_address", title: "微信名", align: "center", unresize: true, edit: "customerTable"},
            {align: "center", title: "操作", unresize: true, toolbar: "#operationButton", width: 145}
        ]]
    });
}
