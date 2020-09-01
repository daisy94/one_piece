package com.kiwi.hushang_ayi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableTransactionManagement
@SpringBootApplication
public class HushangAyiApplication {

	public static void main(String[] args) {
		SpringApplication.run(HushangAyiApplication.class, args);
	}

}
