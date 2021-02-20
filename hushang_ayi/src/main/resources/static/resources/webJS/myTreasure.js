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
                        html += '<div class="layui-col-md2">' +
                                    '<div class="layui-card">' +
                                        '<div class="layui-card-body">' +
                                            '<div class="layui-card">' +
                                                '<div class="layui-card-header"><h2><b>'+ v.photoAlbumDate +'</b></h2></div>' +
                                                '<div class="layui-card-body">' +
                                                    '<a href="javascript:" onclick="photoList(\''+ v.id +'\', \''+ v.photoAlbumDate +'\')"><img lay-src="'+ v.photoAlbumUrl +'" alt="服务器有点慢哈，等等吧"></a>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>';
                        htmlPhoto += '<option value="'+ v.id +'">'+ v.photoAlbumDate +'</option>';
                    });
                }
                $("#layUIRowColList").append(html);
                $("#memoryDate").append(htmlPhoto);
                // 动态拼接后再次渲染下拉框
                form.render("select");
                // 动态拼接后再次渲染图片
                flow.lazyimg({
                    elem: "#photoAlbumList img"
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

// 弹出相册列表页面
function photoList(id, photoAlbumDate){

    layer.open({
        title: [photoAlbumDate, "font-size:18px;font-weight:bold;"],
        type: 1,
        area: ["65%", "76.7%"],
        content:
        '<div class="layui-fluid" style="background-color: #F2F2F2;padding: 5px;">' +
            '<div class="layui-row">' +
                '<div class="site-flow-photoList" id="photoList">' +
                    '<div class="layui-row" id="photoDetailsList"></div>' +
                '</div>' +
            '</div>' +
        '</div>'
    });
    getPhotoInfo(id);
}

// 查询照片列表信息
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
                        html +=
                            '<div class="layui-col-md4" style="padding: 5px;">' +
                                '<div class="layui-card">' +
                                    '<div class="layui-card-body">' +
                                        '<div class="layui-card">' +
                                            '<div class="layui-card-header">' +
                                                '<h3><b>'+ v.photoName +'</b></h3>' +
                                            '</div>' +
                                            '<div class="layui-card-body" id="'+ v.id +'">' +
                                                '<a href="javascript:void(0)" onclick="lookPhoto(\''+ v.id +'\')"><img lay-src="'+ v.photoUrl +'" layer-src="'+ v.photoOriginalUrl +'" src="'+ v.photoUrl +'" alt="' + v.photoName + '"></a>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    });
                }
                $("#photoDetailsList").append(html);
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

// 查看原图
function lookPhoto(id){

    layer.photos({
        photos: "#" + id,
        anim: 5
    });
}

// 按屏加载图片
flow.lazyimg({
    elem: "#photoAlbumList img"
});

// 按屏加载图片
flow.lazyimg({
    elem: "#photoList img"
});

// 提交表单，保存相册封面
form.on("submit(albumCoverForm)", function(){

    $("#savePhotoCover").click();
    return false;
});

// 提交表单，保存回忆
form.on("submit(memoryForm)", function(){

    $("#saveMemory").click();
    return false;
});

// 相册封面上传
upload.render({
    elem: "#savePhotoCover",
    url: pathWeb + "savePhotoCover",
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
            $("#memoryDate").empty();
            form.val("albumCoverForm", {
                "dateYearMonth": ""
            });
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
    elem: "#saveMemory",
    url: pathWeb + "savePhotoAndData",
    data: {
        "photoName": function(){
            return $("#memoryRemark").val();
        },
        "photoAlbumName": function(){
            return $("#memoryDate option:selected").text();
        },
        "photoAlbumId": function(){
            return $("#memoryDate option:selected").val();
        }
    },
    before: function(){
        layer.load();
    },
    done: function(res){
        //上传完毕
        if (res.code === 0){
            layer.closeAll("loading");
            form.val("memoryForm", {
                "memoryRemark": ""
            });
            layer.msg(res.msg);
        } else{
            layer.closeAll("loading");
            layer.msg(res.msg, {
                anim: 6
            });
        }
    }
});

// 订单信息表单验证规则
form.verify({

    dateYearMonth: function(value) {
        if (value === "" || value == null) {
            return "相册的时间是必选哒";
        }
    },
    memoryDate: function(value) {
        if (value === "" || value == null) {
            return "回忆的时间是必选哒";
        }
    },
    memoryRemark: function(value) {
        if (value === "" || value == null) {
            return "回忆的内容是必填哒";
        }
    }
});

// 年月选择器
layDate.render({
    elem: "#dateYearMonth",
    trigger: "click",
    type: "month",
    max: maxYearMonth
});

// 年选择器
layDate.render({
    elem: "#dateYear",
    trigger: "click",
    type: "year",
    max: maxYear,
    done: function(dateYear){

        if (dateYear !== ""){
            $("#layUIRowColList").empty();
            $("#memoryDate").empty();
            getPhotoAlbumInfo(dateYear);
        }
    }
});