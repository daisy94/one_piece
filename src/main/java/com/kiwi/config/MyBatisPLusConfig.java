package com.kiwi.config;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.context.annotation.Configuration;

import java.util.Date;

/**
 * Mybatis-Plus自动填充策略配置类
 *
 * @author FuJH
 */
@Configuration
public class MyBatisPLusConfig implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        strictInsertFill(metaObject, "createTime", DateUtil::dateSecond, Date.class);
        strictInsertFill(metaObject, "updateTime", DateUtil::dateSecond, Date.class);
        strictInsertFill(metaObject, "createId", StpUtil::getLoginIdAsInt, Integer.class);
        strictInsertFill(metaObject, "updateId", StpUtil::getLoginIdAsInt, Integer.class);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        metaObject.setValue("updateTime", null);
        strictUpdateFill(metaObject, "updateTime", DateUtil::dateSecond, Date.class);
        metaObject.setValue("updateId", null);
        strictUpdateFill(metaObject, "updateId", StpUtil::getLoginIdAsInt, Integer.class);
    }

}
