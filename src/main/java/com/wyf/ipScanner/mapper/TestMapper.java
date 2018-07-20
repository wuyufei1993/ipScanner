package com.wyf.ipScanner.mapper;

import com.github.pagehelper.Page;
import com.wyf.ipScanner.entity.TestResult;

public interface TestMapper {
	public Page<TestResult> findByPage();
}
