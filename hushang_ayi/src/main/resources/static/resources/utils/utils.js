function formatDate(date){

    if (date !== "" && date !== null){
        let str = String();
        let arr = date.split('-');
        for(let i=0;i<arr.length;i++){
            str += arr[i];
        }
        return str;
    }else {
        return date;
    }
}

function formatDateMonth(date){

    let month = "";
    if(date < 10){

        month = "0" + date;
        return month;
    }else{

        month = date.toString();
        return month;
    }
}

function isNumber(val){

    let regPos = /^\d+(\.\d+)?$/; //非负浮点数
    let regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
    return regPos.test(val) || regNeg.test(val);
}

//获取项目根路径
function getRootPathWeb() {
    
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    let curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    let pathName = window.document.location.pathname;
    let pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    let localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    let projectName = pathName.substring(0, pathName.substr(1).indexOf("/") + 1);
    return (localhostPaht + projectName + "/");
}

//获取GET请求携带的参数
function getQueryString(name) {
    let result = window.location.search.match(new RegExp("[\?\&]" + name + "=([^\&]+)", "i"));
    if (result == null || result.length < 1) {
        return "";
    }
    return result[1];
}