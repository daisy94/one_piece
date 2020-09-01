let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    layDate = layui.laydate,
    upload = layui.upload,
    flow = layui.flow,
    pathWeb = getRootPathWeb(),
    maxYearMonth = new Date().getFullYear() + "-" + (new Date().getMonth() + 1);

let dateYearMonth = new Date().getFullYear() + formatDateMonth(new Date().getMonth() + 1);
getPhotoInfo(dateYearMonth);

function getPhotoInfo(dateYearMonth){

    let params = {
        "dateYearMonth": dateYearMonth
    };
    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "getPhotoInfo",
        data : JSON.stringify(params),
        success: function(data) {
            if(data.code === 0){
                let html = "";
                if (data.data !== null){
                    $.each(data.data, function(k, v){
                        html += '<div class="layui-col-md3"><div class="layui-card"><div class="layui-card-body"><div class="layui-card">' +
                            '<div class="layui-card-header"><h2><b>'+ v.photoName +'</b></h2></div><div class="layui-card-body">' +
                            '<img lay-src="'+ v.photoUrl +'"></div></div>' +
                            '<span>' + v.photoRemark + '</span></div></div></div>';
                    });
                }
                $("#layUIRowColList").append(html);
                // 动态拼接后再次渲染图片
                flow.lazyimg({
                    elem: '#photoList img'
                });
            }else {
                layer.msg(data.msg, {
                    anim: 6
                });
            }
        },
        error: function(e){
            console.log(e.status);
            console.log(e.responseText);
        }
    });
}

//按屏加载图片
flow.lazyimg({
    elem: '#photoList img'
});

//多图片上传
upload.render({
    elem: '#selectPhoto', // 绑定DOM容器
    url: pathWeb + "savePhotoAndData", // 数据请求接口
    data: {
        "photoName": function(){
            return $("#photoName").val();
        },
        "dateYearMonth": function(){
            return formatDate($("#dateYearMonth").val());
        },
        "remark": function(){
            return $("#photoRemark").val();
        }
    },
    done: function(res){
        //上传完毕
        if (res.code === 0){
            layer.msg(res.msg);
        } else{
            layer.msg(res.msg, {
                anim: 6
            });
        }
    }
});

//年月选择器
layDate.render({
    elem: '#dateYearMonth',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth
});