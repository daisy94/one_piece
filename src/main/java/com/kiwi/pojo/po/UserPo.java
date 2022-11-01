package com.kiwi.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.kiwi.pojo.po.base.BasePo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 用户信息
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("t_user")
public class UserPo extends BasePo {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 登录名
     */
    @TableField("account")
    private String account;
    /**
     * 登录密码
     */
    @TableField("password")
    private String password;
    /**
     * 用户名
     */
    @TableField("name")
    private String name;

}
