let layer = layui.layer,
    $ = layui.jquery,
    pathWeb = getRootPathWeb();

$(function(){
    document.onkeydown = function(e){
        let event = document.all ? window.event : e;
        if(event.keyCode === 13) {
            login();
        }
    }
});

function login(){

    let username = $("#username").val();
    let password = $("#password").val();
    if(null == username || "" === username){
        layer.msg("用户名没写吧！", {
            anim: 6
        });
        return;
    }
    if(null == password || "" === password){
        layer.msg("密码没写吧！", {
            anim: 6
        });
        return;
    }
    let params = {
        "username":username,
        "password":password
    };

    $.ajax({
        async: false,
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        url: pathWeb + "login",
        data:JSON.stringify(params),
        success: function(data){
            if(data.code === 100){
                layer.msg(data.msg, {
                    anim: 6
                });
            }else if(data.code === 0){
                window.top.location.href = "homePage.html";
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}