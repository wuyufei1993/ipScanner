package com.wyf.ipScanner;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
public class Swagger2 {

	@Bean
	public Docket createRestApi() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("test")
				.useDefaultResponseMessages(false)
				.select().apis(RequestHandlerSelectors.basePackage("com.wyf"))
//				.paths(PathSelectors.any())
				.build();
	}
}