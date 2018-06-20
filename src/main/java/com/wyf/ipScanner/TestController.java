package com.wyf.ipScanner;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wyf.ipScanner.entity.Port;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/test")
@Api(description="测试接口模块")
public class TestController {

	@ApiOperation("测试")
	@GetMapping("/test/{name}")
	@ApiImplicitParam(name="name", value="名称", paramType="path", required=true)
	public String test(@PathVariable("name")String name) {
		return "swagger," + name;
	}
	
	@ApiOperation("测试2")
	@PostMapping(value = "/test2")
	public String test2(Port port) {
		return "swagger" + port.getId();
	}
	
}
