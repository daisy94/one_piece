function formatDate(date) {

    if (date !== "" && date !== null) {
        let str = String();
        let arr = date.split('-');
        for (let i = 0; i < arr.length; i++) {
            str += arr[i];
        }
        return str;
    } else {
        return date;
    }
}

function formatDateMonth(date) {

    let month = "";
    if (date < 10) {

        month = "0" + date;
        return month;
    } else {

        month = date.toString();
        return month;
    }
}