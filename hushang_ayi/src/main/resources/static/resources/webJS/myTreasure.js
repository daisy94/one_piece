let element = layui.element,
    $ = layui.jquery,
    layer = layui.layer,
    layDate = layui.laydate,
    upload = layui.upload,
    flow = layui.flow,
    form = layui.form,
    pathWeb = getRootPathWeb(),
    maxYear = new Date().getFullYear() + "-12-31",
    maxYearMonth = new Date().getFullYear() + "-" + (new Date().getMonth() + 1);

let dateYear = new Date().getFullYear();
getPhotoAlbumInfo(dateYear);

// 根据年份查询相册信息
function getPhotoAlbumInfo(dateYear){

    let params = {
        "dateYear": dateYear
    };
    $.ajax({
        type : "POST",
        contentType: "application/json;charset=UTF-8",
        url : pathWeb + "getPhotoAlbumInfo",
        data : JSON.stringify(params),
        success: function(data) {
            if(data.code === 0){
                let html = "";
                let htmlPhoto = "";
                if (data.data !== null){
                    $.each(data.data, function(k, v){
                        html += '<div class="layui-col-md3 layui-col-xs3">' +
                                    '<div class="layui-card">' +
                                        '<div class="layui-card-body">' +
                                            '<div class="layui-card">' +
                                                '<div class="layui-card-header"><h2><b>'+ v.photoAlbumDate +'</b></h2></div>' +
                                                '<div class="layui-card-body">' +
                                                    '<a href="javascript:" onclick="photoList(\''+ v.id +'\', \''+ v.photoAlbumDate +'\')"><img lay-src="'+ v.photoAlbumUrl +'"></a>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>';
                        htmlPhoto += '<option value="'+ v.id +'">'+ v.photoAlbumDate +'</option>';
                    });
                }
                $("#layUIRowColList").append(html);
                $("#photoAlbum").append(htmlPhoto);
                // 动态拼接后再次渲染下拉框
                form.render('select');
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

// 弹出相册列表IFrame页面
function photoList(id, photoAlbumDate){

    layer.open({
        title: [photoAlbumDate, "font-size:18px;"],
        type: 2,
        area: ["100%", "100%"],
        content: "photoList.html?id=" + id
    });
}

// 按屏加载图片
flow.lazyimg({
    elem: '#photoList img'
});

// 相册封面上传
upload.render({
    elem: '#selectPhotoCover', // 绑定DOM容器
    url: pathWeb + "savePhotoCover", // 数据请求接口
    data: {
        "dateYearMonth": function(){
            return formatDate($("#dateYearMonth").val());
        }
    },
    before: function(){
        layer.load();
    },
    done: function(res){
        //上传完毕
        if (res.code === 0){
            $("#layUIRowColList").empty();
            $("#photoAlbum").empty();
            $("#dateYearMonth").val("");
            getPhotoAlbumInfo(dateYear);
            layer.closeAll("loading");
            layer.msg(res.msg);
        } else{
            layer.closeAll("loading");
            layer.msg(res.msg, {
                anim: 6
            });
        }
    }
});

// 照片上传
upload.render({
    elem: '#selectPhoto', // 绑定DOM容器
    url: pathWeb + "savePhotoAndData", // 数据请求接口
    data: {
        "photoName": function(){
            return $("#photoName").val();
        },
        "remark": function(){
            return $("#photoRemark").val();
        },
        "photoAlbumName": function(){
            return $("#photoAlbum option:selected").text();
        },
        "photoAlbumId": function(){
            return $("#photoAlbum option:selected").val();
        }
    },
    before: function(){
        layer.load();
    },
    done: function(res){
        //上传完毕
        if (res.code === 0){
            layer.closeAll("loading");
            $("#photoName").val("");
            $("#photoRemark").val("");
            layer.msg(res.msg);
        } else{
            layer.closeAll("loading");
            layer.msg(res.msg, {
                anim: 6
            });
        }
    }
});

// 年月选择器
layDate.render({
    elem: '#dateYearMonth',
    trigger: 'click',
    type: 'month',
    max: maxYearMonth
});

// 年选择器
layDate.render({
    elem: '#dateYear',
    trigger: 'click',
    type: 'year',
    max: maxYear,
});