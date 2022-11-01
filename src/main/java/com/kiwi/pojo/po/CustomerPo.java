package com.kiwi.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.kiwi.pojo.po.base.BasePo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 顾客信息
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("t_customer")
public class CustomerPo extends BasePo {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 微信名
     */
    @TableField("name")
    private String name;
    /**
     * 地址
     */
    @TableField("address")
    private String address;

}
