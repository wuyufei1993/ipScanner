package com.wyf.ipScanner.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description="description",discriminator="discriminator",value="value", reference="reference")
public class Port {
	

	@ApiModelProperty(value="idaaaa", required = true)
	private Integer id;
	
	private Integer ipId;
	
	@ApiModelProperty(hidden=true)
	private Integer port;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIpId() {
		return ipId;
	}

	public void setIpId(Integer ipId) {
		this.ipId = ipId;
	}

	public Integer getPort() {
		return port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}
	
	
}
