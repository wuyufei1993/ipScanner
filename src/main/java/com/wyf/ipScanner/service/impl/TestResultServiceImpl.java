package com.wyf.ipScanner.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wyf.ipScanner.dao.TestResultDao;
import com.wyf.ipScanner.entity.TestResult;
import com.wyf.ipScanner.service.TestResultService;
import com.wyf.system.jpa.BaseDao;

@Service
public class TestResultServiceImpl implements TestResultService {
	
	@Autowired
	private TestResultDao testResultDao;
	
	@Override
	public BaseDao<TestResult, String> getDao() {
		return testResultDao;
	}

}
