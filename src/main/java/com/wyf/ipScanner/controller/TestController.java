package com.wyf.ipScanner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wyf.ipScanner.entity.Port;
import com.wyf.ipScanner.entity.TestResult;
import com.wyf.ipScanner.mapper.TestMapper;
import com.wyf.ipScanner.service.TestResultService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

@RestController
@Api
public class TestController {

	@Autowired
	private TestMapper testMapper;
	
	@Autowired
	private TestResultService testResultService;
	
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
	public PageInfo<TestResult> testPage(int page, int size) {
		PageHelper.startPage(page, size);
		return testMapper.findByPage().toPageInfo();
	}
	
	@ApiOperation("测试hibernate")
	@GetMapping(value = "/testHibernate")
	public Object testHibernate(int page, int size) {
		return testResultService.findPageList(PageRequest.of(page, size));
	}
	
}
