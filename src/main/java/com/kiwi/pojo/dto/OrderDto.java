package com.kiwi.pojo.dto;

import lombok.Data;

@Data
public class OrderDto {

    /**
     * 关键字
     */
    private String keyword;
    /**
     * 订单时间
     */
    private String orderTime;
    /**
     * 是否发货（0：否，1：是）
     */
    private String isDeliver;
}
