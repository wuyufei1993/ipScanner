package com.wyf.system.common;

import com.fasterxml.jackson.annotation.JsonValue;

public enum MessageCode {
	SUCCESS(100, "成功"),
	ERROR(101, "失败");
	
	private int messageCode;
	
	private String desc;
	
	MessageCode(int messageCode, String desc) {
		this.messageCode = messageCode;
		this.desc = desc;
	}

	@JsonValue
	public int getMessageCode() {
		return messageCode;
	}

	public void setMessageCode(int messageCode) {
		this.messageCode = messageCode;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
