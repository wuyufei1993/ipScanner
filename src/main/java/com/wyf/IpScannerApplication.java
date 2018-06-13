package com.wyf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.wyf.**.mapper")
public class IpScannerApplication {
	public static void main(String[] args) {
		SpringApplication.run(IpScannerApplication.class, args);
	}
}
