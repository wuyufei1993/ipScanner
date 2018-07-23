package com.wyf.system.common;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel
public class Result<T> {
	@ApiModelProperty("状态码")
	private MessageCode code;
	
	@ApiModelProperty("返回数据")
	private T data;
	
	@ApiModelProperty("信息")
	private String msg;

	public static Result<Object> SUCCESS() {
		return new Result<>(MessageCode.SUCCESS);
	}

	public static Result<Object> ERROR() {
		return new Result<>(MessageCode.ERROR);
	}
	
	public Result(MessageCode code) {
		super();
		this.code = code;
	}

	public Result(MessageCode code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public Result(MessageCode code, T data) {
		super();
		this.code = code;
		this.data = data;
	}

	public Result(MessageCode code, T data, String msg) {
		super();
		this.code = code;
		this.data = data;
		this.msg = msg;
	}

	public MessageCode getCode() {
		return code;
	}

	public void setCode(MessageCode code) {
		this.code = code;
	}

	public T getData() {
		return data;
	}

	public void setT(T data) {
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
