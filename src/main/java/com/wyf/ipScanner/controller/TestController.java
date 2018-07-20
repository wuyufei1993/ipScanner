package com.wyf.ipScanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyf.ipScanner.entity.Port;
import com.wyf.ipScanner.entity.TestResult;
import com.wyf.ipScanner.mapper.TestMapper;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(description="测试接口模块")
public class TestController {

	@Autowired
	private TestMapper testMapper;
	
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
	
	@ApiOperation("测试分页")
	@GetMapping(value = "/testPage")
	public PageInfo<TestResult> testPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return testMapper.findByPage().toPageInfo();
	}
	
}
