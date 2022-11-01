package com.kiwi.pojo.vo;

import lombok.Data;

/**
 * 订单信息Vo
 */
@Data
public class OrderVo {

    private Integer id;

    /**
     * 商品名称
     */
    private String productName;
    
    /**
     * 顾客微信名
     */
    private String customerName;

    /**
     * 发货地址
     */
    private String customerAddress;

    /**
     * 利润
     */
    private Integer profit;

    /**
     * 下单时间
     */
    private String orderTime;

    /**
     * 是否发货（0：未发，1：已发）
     */
    private Integer isDeliver;

}
