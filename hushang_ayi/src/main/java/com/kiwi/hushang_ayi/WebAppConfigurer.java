package com.kiwi.hushang_ayi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * Web MVC 配置适配器
 * @ClassName: WebAppConfigurer
 * WebAppConfigurer extends WebMvcConfigurerAdapter 在Spring Boot2.0版本已过时了，用官网说的新的类替换
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {

    @Autowired
    SessionInterceptor sessionInterceptor;

    /**
     * springmvc视图解析
     * @Title: viewResolver
     * @return
     */
    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    /**
     * SpringBoot设置首页
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        WebMvcConfigurer.super.addViewControllers(registry);
        registry.addViewController("/").setViewName("login");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }

    /**
     * 配置拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(sessionInterceptor)
                // 设置拦截所有路径地址
                .addPathPatterns("/**")
                // 设置过滤不需要拦截的路径地址,尤其是登录地址一定要加上
                .excludePathPatterns("/", "/login", "/resources/**");
    }
}
