package com.wyf.system.generator.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description="工程生成器参数")
public class ProjectGeneratorParam {
	
	@ApiModelProperty(value="包名", required=true, allowEmptyValue=false)
    private String group;
	
	@ApiModelProperty(value="项目名称", required=true, allowEmptyValue=false)
    private String artifact;
	
	@ApiModelProperty(value="项目描述", required=true, allowEmptyValue=false)
    private String desc;
	
	@ApiModelProperty(value="数据库链接", required=true)
    private String url;
    
	@ApiModelProperty(value="数据库用户", required=true)
    private String user;
    
	@ApiModelProperty(value="数据库密码", required=true)
    private String password;

	@ApiModelProperty(hidden=true)
    private String diskPath;

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getArtifact() {
		return artifact;
	}

	public void setArtifact(String artifact) {
		this.artifact = artifact;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDiskPath() {
		return diskPath;
	}

	public void setDiskPath(String diskPath) {
		this.diskPath = diskPath;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
    
}
