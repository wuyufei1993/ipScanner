package com.wyf.system.generator.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.wyf.system.generator.entity.DatabaseColumn;
import com.wyf.system.utils.CodeGeneratorUtils;

public class MysqlParser extends DatabaseParser {

	public MysqlParser(String url, String user, String password, String driver) {
		super(url, user, password, driver);
	}

	@Override
	protected String[] getPrimaryKey(Connection connection, String tableName) throws Exception {
		String sql = "SHOW CREATE TABLE " + tableName;
		try {
			PreparedStatement pre = connection.prepareStatement(sql);
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				// 正则匹配数据
				Pattern pattern = Pattern.compile("PRIMARY KEY \\(\\`(.*)\\`\\)");
				Matcher matcher = pattern.matcher(rs.getString(2));
				matcher.find();
				String data = matcher.group();
				// 过滤对于字符
				data = data.replaceAll("\\`|PRIMARY KEY \\(|\\)", "");
				// 拆分字符
				String[] stringArr = data.split(",");
				return stringArr;
			}

		} catch (Exception e) {
			throw e;
		}
		return new String[] {};
	}

	@Override
	protected List<DatabaseColumn> getDatabaseColumns(Connection connection, String tableName) throws SQLException {
		List<DatabaseColumn> columnList = new ArrayList<>();
        DatabaseColumn column = null;
		ResultSet resultSet = connection.getMetaData().getColumns(null,"%", tableName,"%");
        while(resultSet.next()){
            column = new DatabaseColumn();
            //获取字段名称
            String columnName = resultSet.getString("COLUMN_NAME");
            //获取字段类型
            String typeName = resultSet.getString("TYPE_NAME");
            column.setColumnName(columnName);
            //将数据库字段类型统一，方便后续处理
            if(typeName.equals("INT") || typeName.equals("INTEGER") ){
            	column.setColumnType("INTEGER");
            	column.setJavaType(Integer.class);
            }else if(typeName.equals("TIME") || typeName.equals("DATETIME") || typeName.equals("TIMESTAMP") 
            		|| typeName.equals("DATE")) {
            	column.setColumnType("TIMESTAMP");
            	column.setJavaType(Date.class);
            } else if (typeName.equals("VARCHAR")) {
            	column.setColumnType("VARCHAR");
            	column.setJavaType(String.class);
            } else {
            	column.setColumnType(typeName);
            	column.setJavaType(Object.class);
            }
            //转换字段名称，如 sys_name 变成 SysName
            column.setChangeColumnName(CodeGeneratorUtils.replaceUnderLineAndUpperCase(resultSet.getString("COLUMN_NAME")));
            //字段在数据库的注释
            column.setColumnComment(resultSet.getString("REMARKS"));
            columnList.add(column);
        }
		return columnList;
	}

}
