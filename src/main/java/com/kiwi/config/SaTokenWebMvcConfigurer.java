package com.kiwi.config;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Web配置类
 */
@Configuration
public class SaTokenWebMvcConfigurer implements WebMvcConfigurer {

    // 路由过滤器
    @Bean
    public SaServletFilter getSaServletFilter() {
        return new SaServletFilter()
                .addInclude("/**")
                .addExclude(
                        "/",
                        "/login",
                        "/css/*",
                        "/echarts/*",
                        "/image/*",
                        "/layui/**",
                        "/utils/*",
                        "/webJS/*"
                )
                .setAuth(obj -> {
                    if (!StpUtil.isLogin()) {
                        SaHolder.getResponse().redirect("/");
                        SaRouter.back();
                    }
                });
    }

}
