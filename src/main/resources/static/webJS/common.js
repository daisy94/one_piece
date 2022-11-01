// 表单验证规则
form.verify({
    orderTime: function (value) {
        if (value === "" || value == null) {
            return "订单时间是必填项哦";
        }
    },
    customerName: function (value) {
        if (value === "" || value == null) {
            return "小伙伴微信名是必填项哦";
        }
    },
    productAmount: function (value) {
        if (value === "" || value == null) {
            return "宝贝的数量是必填项哦";
        }
    },
    profit: function (value) {
        if (value === "" || value == null) {
            return "赚了多少钱是必填项哦";
        }
    },
    productList: function (value) {
        if (value === "" || value == null) {
            return "要先把宝贝添加到列表哦";
        }
    },
    customerAddress: function (value) {
        if (value === "" || value == null) {
            return "发货地址一定要填哦";
        }
    },
    productName: function (value) {
        if (value === "" || value == null) {
            return "商品名一定要填哦";
        }
    },
    price: function (value) {
        if (value === "" || value == null) {
            return "商品卖价一定要填哦";
        }
    },
    cost: function (value) {
        if (value === "" || value == null) {
            return "商品拿价一定要填哦";
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