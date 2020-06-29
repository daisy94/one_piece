function formatDate(date){

    let str = new String();
    let arr = new Array();
    arr = date.split('-');
    for(let i=0;i<arr.length;i++){
        str += arr[i];
    }

    return str
};

function formatDateMonth(date){

    let month = new String();
    if(date < 10){

        month = "0" + date;
        return month;
    }else{

        month = date;
        return month;
    }
};

function isNumber(val){

    var regPos = /^\d+(\.\d+)?$/; //非负浮点数
    var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
    if(regPos.test(val) || regNeg.test(val)){
        return true;
    }else{
        return false;
    }
};