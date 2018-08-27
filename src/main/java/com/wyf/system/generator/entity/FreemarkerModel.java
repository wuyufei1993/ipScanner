package com.wyf.system.generator.entity;

public class FreemarkerModel {
	
	private String author;
	
	private String createDate;
	
	private String packageName;
	
	private String tableAnnotation;
	
	private DatabaseTable table;
	
	public FreemarkerModel() {
		
	}

	public FreemarkerModel(DatabaseTable table) {
		this.table = table;
	}

	public DatabaseTable getTable() {
		return table;
	}

	public void setTable(DatabaseTable table) {
		this.table = table;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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

}
