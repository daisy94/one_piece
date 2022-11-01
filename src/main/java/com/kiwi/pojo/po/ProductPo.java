package com.kiwi.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.kiwi.pojo.po.base.BasePo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品信息
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("t_product")
public class ProductPo extends BasePo {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 商品名字
     */
    @TableField("name")
    private String name;
    /**
     * 卖价
     */
    @TableField("price")
    private Integer price;
    /**
     * 成本
     */
    @TableField("cost")
    private Integer cost;
    /**
     * 利润（补充字段）
     */
    @TableField(exist = false)
    private BigDecimal profit;

}
