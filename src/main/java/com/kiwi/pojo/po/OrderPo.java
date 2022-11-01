package com.kiwi.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.kiwi.pojo.po.base.BasePo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 订单信息
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("t_order")
public class OrderPo extends BasePo {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 商品名称
     */
    @TableField("product_name")
    private String productName;
    /**
     * 顾客微信名
     */
    @TableField("customer_name")
    private String customerName;
    /**
     * 发货地址
     */
    @TableField("customer_address")
    private String customerAddress;
    /**
     * 利润
     */
    @TableField("profit")
    private Integer profit;
    /**
     * 下单时间
     */
    @TableField("order_time")
    private String orderTime;
    /**
     * 是否发货（0：未发，1：已发）
     */
    @TableField("is_deliver")
    private Integer isDeliver;

}
