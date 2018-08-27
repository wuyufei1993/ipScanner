package ${group}.generator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;

import ${group}.generator.entity.CodeGeneratorParam;
import ${group}.generator.entity.ColumnClass;
import ${group}.system.util.DateUtil;
import ${group}.system.util.FileZip;
import ${group}.system.util.FreeMarkerTemplateUtils;

import freemarker.template.Template;

public abstract class CodeGenerator {

	protected String AUTHOR;
    protected String CURRENT_DATE = DateUtil.dateToStringFormat(new Date(), "yyyy-MM-dd");
    protected String tableName;
    protected String packageName;
    protected String tableAnnotation;
    protected String URL;
    protected String USER;
    protected String PASSWORD;
    protected String DRIVER = "com.mysql.jdbc.Driver";
    protected String diskPath;
    protected String changeTableName;
    protected String packagepath;
    
    private String type;
    
    private CodeGeneratorParam generatorParam;
    
	public CodeGenerator(CodeGeneratorParam generatorParam, String type) throws Exception {
		this.generatorParam = generatorParam;
		if (!StringUtils.isEmpty(generatorParam.getAuthor())) {
			this.AUTHOR = generatorParam.getAuthor();
		}
		if (!StringUtils.isEmpty(generatorParam.getTableName())) {
			this.tableName = generatorParam.getTableName();
		}
		if (!StringUtils.isEmpty(generatorParam.getPackageName())) {
			this.packageName = generatorParam.getPackageName();
		}
		if (!StringUtils.isEmpty(generatorParam.getTableAnnotation())) {
			this.tableAnnotation = generatorParam.getTableAnnotation();
		}
		if (!StringUtils.isEmpty(generatorParam.getUrl())) {
			this.URL = generatorParam.getUrl();
		}
		if (!StringUtils.isEmpty(generatorParam.getUser())) {
			this.USER = generatorParam.getUser();
		}
		if (!StringUtils.isEmpty(generatorParam.getPassword())) {
			this.PASSWORD = generatorParam.getPassword();
		}
		if (!StringUtils.isEmpty(generatorParam.getDiskPath())) {
			this.diskPath = generatorParam.getDiskPath();
		} else {
			throw new Exception("diskPath is null");
		}
		if (!StringUtils.isEmpty(type)) {
			this.type = type;
		} else {
			throw new Exception("type is null");
		}
		this.changeTableName = replaceUnderLineAndUpperCase(tableName);
		this.packagepath = getPackagepath(packageName);
	}

	private Connection getConnection() throws Exception{
        Class.forName(DRIVER);
        Connection connection= DriverManager.getConnection(URL, USER, PASSWORD);
        return connection;
    }
    
	/**
	 * 执行入口
	 * @throws Exception 
	 */
	public void generate() throws Exception{
		String path = ResourceUtils.getURL(ResourceUtils.CLASSPATH_URL_PREFIX).getPath();
		if (path.startsWith("/")) {
			path = path.substring(1).replaceAll("target/classes/", "");
		}
		path += "src/main/java/";
		diskPath = path;
		Connection connection = getConnection();
		DatabaseMetaData databaseMetaData = connection.getMetaData();
		ResultSet resultSet = databaseMetaData.getColumns(null,"%", tableName,"%");
		Map<String,Object> dataMap = getDataMap(resultSet);
		generateModelFile(dataMap);
		generateCommonFile(dataMap);
		generateControllerFile(dataMap);
		generateServiceFile(dataMap);
		generateDaoFile(dataMap);
		if ("否".equals(generatorParam.getFlag())) {
			FileZip.doCompress(diskPath + packageName.split("\\.")[0], diskPath + changeTableName + ".zip");
		}
	}

	private Map<String,Object> getDataMap(ResultSet resultSet) throws Exception{
        Map<String,Object> dataMap = new HashMap<>();
		List<ColumnClass> columnClassList = new ArrayList<>();
        List<String> importList = new ArrayList<String>();
        ColumnClass columnClass = null;
        String[] pks = getMysqlPrimaryKey(getConnection(),tableName);
        while(resultSet.next()){
        	
            columnClass = new ColumnClass();
            //获取字段名称
            String columnName = resultSet.getString("COLUMN_NAME");
            //获取字段类型
            String typeName = resultSet.getString("TYPE_NAME");
            if(Arrays.asList(pks).contains(columnName)){
            	columnClass.setPk(true);
            	if (typeName.equals("INT") || typeName.equals("INTEGER") || typeName.equals("LONG")) {
            		dataMap.put("pk_class", "Long");
            	} else if (typeName.equals("VARCHAR")) {
            		dataMap.put("pk_class", "String");
            	} else {
            		dataMap.put("pk_class", "String");
            	}
            }
            columnClass.setColumnName(columnName);
            if(typeName.equals("INT")){
            	columnClass.setColumnType("INTEGER");
            }else if(typeName.equals("TIME") || typeName.equals("DATETIME")) {
            	columnClass.setColumnType("TIMESTAMP");
            } else {
            	columnClass.setColumnType(typeName);
            }
            if(typeName.equals("TIMESTAMP") || typeName.equals("DATE") || typeName.equals("TIME") || typeName.equals("DATETIME") || typeName.equals("YEAR") ){
            	importList.add("import java.util.Date");
            }
            //转换字段名称，如 sys_name 变成 SysName
            columnClass.setChangeColumnName(replaceUnderLineAndUpperCase(resultSet.getString("COLUMN_NAME")));
            //字段在数据库的注释
            columnClass.setColumnComment(resultSet.getString("REMARKS"));
            columnClassList.add(columnClass);
        }
        dataMap.put("model_column",columnClassList);
        dataMap.put("importList",importList);
        return dataMap;
	}
	
	protected abstract void generateModelFile(Map<String, Object> dataMap) throws Exception;
	
	/**
	 * 生成公用的文件
	 * @param dataMap
	 * @throws Exception
	 */
	protected abstract void generateCommonFile(Map<String, Object> dataMap) throws Exception;
	
	/**
	 * 生成Controller
	 * @param dataMap
	 * @throws Exception
	 */
	private void generateControllerFile(Map<String,Object> dataMap) throws Exception {
        String suffix = "Controller.java";
        String prefix = "controller";
        String path = diskPath+packagepath+"//"+prefix +"//" + changeTableName + suffix;
        String templateName = "Controller.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
	}
	
	/**
	 * 生成Service
	 * @param dataMap
	 * @throws Exception
	 */
	protected abstract void generateServiceFile(Map<String,Object> dataMap) throws Exception;
	
	/**
	 * 生成Dao
	 * @param dataMap
	 * @throws Exception
	 */
	protected abstract void generateDaoFile(Map<String,Object> dataMap) throws Exception;
	
	protected void generateFileByTemplate(final String templateName,File file,Map<String,Object> dataMap) throws Exception{
        Template template = FreeMarkerTemplateUtils.getTemplate(templateName, type);
        dataMap.put("table_name_small",tableName);
        dataMap.put("table_name",changeTableName);
        dataMap.put("author",AUTHOR);
        dataMap.put("date",CURRENT_DATE);
        dataMap.put("package_name",packageName);
        dataMap.put("table_annotation",tableAnnotation);
        try (Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"),10240)) {
        	template.process(dataMap,out);
        }
    }
	
	private String replaceUnderLineAndUpperCase(String str){
        StringBuffer sb = new StringBuffer();
        sb.append(str);
        int count = sb.indexOf("_");
        while(count!=0){
            int num = sb.indexOf("_",count);
            count = num + 1;
            if(num != -1){
                char ss = sb.charAt(count);
                if (ss >= 'a' && ss <= 'z') {
                	char ia = (char) (ss - 32);
        			sb.replace(count , count + 1,ia + "");
        		}
            }
        }
        String result = sb.toString().replaceAll("_","");
        return StringUtils.capitalize(result);
    }
	
	/**
	 * 根据数据库连接和表明获取主键名
	 * @param con 传进来一个数据库连接对象
	 * @param table 数据库中的表名
	 * @return  执行成功返回一个主键名的字符数组，否则返回null或抛出一个异常
	 * @exception 抛出sql执行异常
	 */
	private static String[] getMysqlPrimaryKey(Connection con,String table)throws Exception{
		
		String sql="SHOW CREATE TABLE "+table;
		
		try {
	
			PreparedStatement pre=con.prepareStatement(sql);
			ResultSet rs=pre.executeQuery();
			if(rs.next()){
 
				//正则匹配数据
				Pattern pattern = Pattern.compile("PRIMARY KEY \\(\\`(.*)\\`\\)");
				Matcher matcher =pattern.matcher(rs.getString(2));
				matcher.find();
				String data=matcher.group();
				//过滤对于字符
				data=data.replaceAll("\\`|PRIMARY KEY \\(|\\)", "");
				//拆分字符
				String [] stringArr= data.split(",");
				
				return stringArr;
			}
			
		}catch(Exception e){
			throw e;
		}
		return null;
	}

	private String getPackagepath(String packagename){
		String a = packagename.replace(".", "//");
		return a;
	}

}
