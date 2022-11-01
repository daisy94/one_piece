let layer = layui.layer,
    $ = layui.jquery,
    form = layui.form;

$(function () {
    document.onkeydown = function (e) {
        let event = document.all ? window.event : e;
        if (event.keyCode === 13) {
            index();
        }
    }
});

// 登录
form.on("submit(userForm)", function (data) {
    index(data.field);
    return false;
});

function index(data) {
    $.ajax({
        type: "POST",
        url: "/login",
        data: data,
        success: function (result) {
            if (result.code === 0) {
                window.top.location.href = "home";
            } else {
                layer.msg(result.msg, {
                    anim: 0
                });
            }
        }
    });
}

// 表单验证规则
form.verify({
    account: function (value) {
        if (value === "" || value == null) {
            return "请输入用户名";
        }
    },
    password: function (value) {
        if (value === "" || value == null) {
            return "请输入密码";
        }
    }
});