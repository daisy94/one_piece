// 表单验证规则
form.verify({
    orderTime: function (value) {
        if (value === "" || value == null) {
            return "订单时间是必填项";
        }
    },
    customerName: function (value) {
        if (value === "" || value == null) {
            return "小伙伴微信名是必填项";
        }
    },
    productAmount: function (value) {
        if (value === "" || value == null) {
            return "宝贝的数量是必填项";
        }
    },
    profit: function (value) {
        if (value === "" || value == null) {
            return "赚了多少钱是必填项";
        }
    },
    productList: function (value) {
        if (value === "" || value == null) {
            return "要先把宝贝添加到列表";
        }
    },
    customerAddress: function (value) {
        if (value === "" || value == null) {
            return "发货地址一定要填";
        }
    },
    productName: function (value) {
        if (value === "" || value == null) {
            return "商品名一定要填";
        }
    },
    price: function (value) {
        if (value === "" || value == null) {
            return "商品卖价一定要填";
        }
    },
    cost: function (value) {
        if (value === "" || value == null) {
            return "商品拿价一定要填";
        }
    }
});

// 年月选择器
layDate.render({
    elem: "#date",
    type: "month",
    btns: ['clear', 'confirm'],
    max: maxYearMonth,
    value: new Date(),
    done: function (orderTime) {
        if (orderTime !== "") {
            getOrderInfo({"orderTime": orderTime});
            getOrderEChartsByMonth(orderTime);
        }
    }
});

// 年选择器
layDate.render({
    elem: "#year",
    type: "year",
    btns: ['clear', 'confirm'],
    max: maxYear,
    value: new Date(),
    done: function (dateYear) {
        if (dateYear !== "") {
            getDataByYear(dateYear);
        }
    }
});