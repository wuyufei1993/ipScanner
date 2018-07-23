package com.wyf.system.generator.entity;

import com.wyf.system.generator.database.DatabaseTypes;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description="代码生成器参数")
public class GeneratorParam {
	
	@ApiModelProperty(value="持久层类别", required=true, allowEmptyValue=false, allowableValues="mybatis,hibernate")
    private String type;
	
	@ApiModelProperty(value="数据库类别", required=true, allowEmptyValue=false, allowableValues="MYSQL,ORACLE")
    private DatabaseTypes databaseType;
	
	@ApiModelProperty(value="表名", required=true, allowEmptyValue=false)
    private String tableName;
    
	@ApiModelProperty(value="包名", required=true)
    private String packageName;
    
	@ApiModelProperty(value="数据库链接", required=true)
    private String url;
    
	@ApiModelProperty(value="数据库用户", required=true)
    private String user;
    
	@ApiModelProperty(value="数据库密码", required=true)
    private String password;

	@ApiModelProperty(value="作者", allowEmptyValue=true)
	private String author;
    
	@ApiModelProperty(value="注释内容", allowEmptyValue=true)
    private String tableAnnotation;
	
	@ApiModelProperty(hidden=true)
    private String diskPath;
    
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public DatabaseTypes getDatabaseType() {
		return databaseType;
	}
	public void setDatabaseType(DatabaseTypes databaseType) {
		this.databaseType = databaseType;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getTableAnnotation() {
		return tableAnnotation;
	}
	public void setTableAnnotation(String tableAnnotation) {
		this.tableAnnotation = tableAnnotation;
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
    
}
