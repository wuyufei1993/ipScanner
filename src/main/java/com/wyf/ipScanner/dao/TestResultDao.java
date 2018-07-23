package com.wyf.ipScanner.dao;

import org.springframework.stereotype.Repository;

import com.wyf.ipScanner.entity.TestResult;
import com.wyf.system.jpa.BaseDao;

@Repository
public interface TestResultDao extends BaseDao<TestResult, String>{
	
}
