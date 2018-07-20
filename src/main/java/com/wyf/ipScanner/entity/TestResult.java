package com.wyf.ipScanner.entity;

import java.util.Date;

public class TestResult {

	private String id;

	private String imei;

	private Integer electricQuantity;

	private Integer lock1;

	private Integer lock2;

	private Integer lock3;

	private Integer lock4;

	private Integer door1;

	private Integer door2;

	private Integer door3;

	private Integer door4;
	
	private Integer testResult;
	
	private Date createTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei;
	}

	public Integer getElectricQuantity() {
		return electricQuantity;
	}

	public void setElectricQuantity(Integer electricQuantity) {
		this.electricQuantity = electricQuantity;
	}

	public Integer getLock1() {
		return lock1;
	}

	public void setLock1(Integer lock1) {
		this.lock1 = lock1;
	}

	public Integer getLock2() {
		return lock2;
	}

	public void setLock2(Integer lock2) {
		this.lock2 = lock2;
	}

	public Integer getLock3() {
		return lock3;
	}

	public void setLock3(Integer lock3) {
		this.lock3 = lock3;
	}

	public Integer getLock4() {
		return lock4;
	}

	public void setLock4(Integer lock4) {
		this.lock4 = lock4;
	}

	public Integer getDoor1() {
		return door1;
	}

	public void setDoor1(Integer door1) {
		this.door1 = door1;
	}

	public Integer getDoor2() {
		return door2;
	}

	public void setDoor2(Integer door2) {
		this.door2 = door2;
	}

	public Integer getDoor3() {
		return door3;
	}

	public void setDoor3(Integer door3) {
		this.door3 = door3;
	}

	public Integer getDoor4() {
		return door4;
	}

	public void setDoor4(Integer door4) {
		this.door4 = door4;
	}

	public Integer getTestResult() {
		return testResult;
	}

	public void setTestResult(Integer testResult) {
		this.testResult = testResult;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
