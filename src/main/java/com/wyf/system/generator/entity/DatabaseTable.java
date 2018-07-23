package com.wyf.system.generator.entity;

import java.util.List;

import com.wyf.system.utils.CodeGeneratorUtils;

public class DatabaseTable {
	
	private String tableName;
	
	private String className;
	
	private DatabaseColumn pk;
	
	private List<DatabaseColumn> colums;
	
	private boolean isExistDate = false;
	
	public DatabaseTable() {
		
	}

	public DatabaseTable(String tableName) {
		this.tableName = tableName;
	}

	public DatabaseTable(String tableName, List<DatabaseColumn> colums) {
		this.tableName = tableName;
		this.className = CodeGeneratorUtils.replaceUnderLineAndUpperCase(tableName);
		this.colums = colums;
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
		this.className = CodeGeneratorUtils.replaceUnderLineAndUpperCase(tableName);
	}

	public String getClassName() {
		return className;
	}

	public DatabaseColumn getPk() {
		return pk;
	}

	public void setPk(DatabaseColumn pk) {
		this.pk = pk;
	}

	public List<DatabaseColumn> getColums() {
		return colums;
	}

	public void setColums(List<DatabaseColumn> colums) {
		this.colums = colums;
	}

	public boolean isExistDate() {
		return isExistDate;
	}

	public void setExistDate(boolean isExistDate) {
		this.isExistDate = isExistDate;
	}
	
	
}
