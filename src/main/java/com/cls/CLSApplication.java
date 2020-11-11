package com.cls;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author WeiMaomao
 */
@EnableAsync
@SpringBootApplication
@EnableTransactionManagement
@MapperScan("com.cls.*.mapper")
public class CLSApplication {

    public static void main(String[] args) {
        new SpringApplicationBuilder(CLSApplication.class)
                .web(WebApplicationType.SERVLET)
                .run(args);
    }
}
