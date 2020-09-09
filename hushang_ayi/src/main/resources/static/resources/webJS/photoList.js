let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    flow = layui.flow,
    form = layui.form,
    pathWeb = getRootPathWeb();

let id = getQueryString("id");
getPhotoInfo(id);

function getPhotoInfo(id){

    let params = {
        "photoAlbumId": id
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
                        html += '<div class="layui-col-md3 layui-col-xs6">' +
                                    '<div class="layui-card">' +
                                        '<div class="layui-card-body" style="height:345px">' +
                                            '<div class="layui-card">' +
                                                '<div class="layui-card-header">' +
                                                    '<h2><b>'+ v.photoName +'</b></h2>' +
                                                '</div>' +
                                                '<div class="layui-card-body">' +
                                                    '<a href="javascript:void(0)" onclick="lookPhoto(\''+ v.photoName +'\', \''+ v.photoUrl +'\')"><img lay-src="'+ v.photoUrl +'"></a>' +
                                                '</div>' +
                                            '</div>' +
                                            '<span>' + v.photoRemark + '</span>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>';
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

function lookPhoto(photoName, photoUrl){

    layer.open({
        title: [photoName, "font-size:18px;"],
        type: 2,
        area: ["100%", "100%"],
        content: "lookPhoto.html?photoUrl=" + photoUrl
    });
}

// 按屏加载图片
flow.lazyimg({
    elem: '#photoList img'
});