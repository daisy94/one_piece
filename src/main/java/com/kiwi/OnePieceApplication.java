package com.kiwi;

import com.kiwi.controller.base.BaseController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class OnePieceApplication extends BaseController {

    public static void main(String[] args) {
        SpringApplication.run(OnePieceApplication.class, args);
        log.info("\n==================== ONE PIECE服务启动成功 ====================");
    }

}
