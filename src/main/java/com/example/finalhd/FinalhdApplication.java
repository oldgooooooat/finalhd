package com.example.finalhd;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example")
public class FinalhdApplication {

    public static void main(String[] args) {
        SpringApplication.run(FinalhdApplication.class, args);
    }

}
