package com.wyf.system.generator.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.wyf.system.generator.entity.DatabaseColumn;
import com.wyf.system.generator.entity.DatabaseTable;
import com.wyf.system.generator.entity.FreemarkerModel;

public abstract class DatabaseParser {

	private final String url;
	
	private final String user;
	
	private final String password;
	
	private final String driver;
	
	public DatabaseParser(String url, String user, String password, String driver) {
		this.url = url;
		this.user = user;
		this.password = password;
		this.driver = driver;
	}
	
	private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(driver);
        Connection connection = DriverManager.getConnection(url, user, password);
        return connection;
    }
	
	public FreemarkerModel parse(String tableName) throws Exception {
		try (Connection connection = getConnection()) {
			String [] pks = getPrimaryKey(connection, tableName);
			if(connection.isClosed()) {
				throw new Exception("connection is closed");
			}
			List<DatabaseColumn> columns = getDatabaseColumns(connection, tableName);
			DatabaseTable table = new DatabaseTable(tableName, columns);
			for (DatabaseColumn column : columns) {
				if(Arrays.asList(pks).contains(column.getColumnName())){
	            	column.setPk(true);
	            	table.setPk(column);
	            }
				if (column.getJavaType().equals(Date.class)) {
					table.setExistDate(true);
				}
				
			}
			return new FreemarkerModel(table);
		}
		
	}
	
	protected abstract String[] getPrimaryKey(Connection connection, String tableName) throws Exception;
	
	protected abstract List<DatabaseColumn> getDatabaseColumns(Connection connection, String tableName) throws Exception;
	
}
