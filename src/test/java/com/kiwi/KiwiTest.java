package com.kiwi;

import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.kiwi.controller.base.BaseController;
import com.kiwi.pojo.po.base.BasePo;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Collections;

@SpringBootTest
public class KiwiTest {

    @Test
    public void MyBatisPlusGenerator() {

        FastAutoGenerator.create(
                        "jdbc:mysql://47.102.120.26:3306/granary_card?useUnicode=true&characterEncoding=utf8",
                        "root",
                        "hxkjnj@20220822")
                .globalConfig((scanner, builder) -> builder
                        .author("FuJH")
                        .outputDir(System.getProperty("user.dir") + "\\src\\main\\java"))
                .packageConfig((scanner, builder) -> builder
                        .parent("com.honorsun")
                        .entity("pojo.po")
                        .service("service")
                        .serviceImpl("service.impl")
                        .controller("controller")
                        .mapper("mapper")
                        .xml("mapper")
                        .pathInfo(Collections.singletonMap(OutputFile.xml, System.getProperty("user.dir") + "\\src\\main\\resources\\mapper")))
                .strategyConfig((scanner, builder) -> builder
                        .addInclude("t_inbound,t_inbound_carrier,t_inbound_register,t_inbound_test,t_grain_depot,t_tenant")
                        .addTablePrefix("t_")
                        .serviceBuilder()
                        .formatServiceFileName("%sService")
                        .formatServiceImplFileName("%sServiceImpl")
                        .entityBuilder()
                        .formatFileName("%sPo")
                        .enableLombok()
                        .logicDeleteColumnName("deleted")
                        .enableTableFieldAnnotation()
                        .addIgnoreColumns("id", "update_id", "update_time", "create_id", "create_time", "deleted")
                        .superClass(BasePo.class)
                        .controllerBuilder()
                        .enableHyphenStyle()
                        .formatFileName("%sController")
                        .enableRestStyle()
                        .superClass(BaseController.class)
                        .mapperBuilder()
                        .formatMapperFileName("%sMapper")
                        .enableMapperAnnotation()
                        .formatXmlFileName("%sMapper"))
                .execute();
    }

}
