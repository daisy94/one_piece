function formatDate(date){

    let str = [];
    let arr = date.split('-');
    for(let i=0;i<arr.length;i++){
        str += arr[i];
    }
    return str
}

function formatDateMonth(date){

    let month = [];
    if(date < 10){

        month = "0" + date;
        return month;
    }else{

        month = date;
        return month;
    }
}

function isNumber(val){

    let regPos = /^\d+(\.\d+)?$/; //非负浮点数
    let regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
    return regPos.test(val) || regNeg.test(val);
}