package com.wyf.system.generator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

import org.springframework.util.StringUtils;

import com.wyf.system.generator.database.DatabaseParser;
import com.wyf.system.generator.database.DatabaseTypes;
import com.wyf.system.generator.database.MysqlParser;
import com.wyf.system.generator.entity.FreemarkModel;
import com.wyf.system.generator.entity.GeneratorParam;
import com.wyf.system.utils.CodeGeneratorUtils;
import com.wyf.system.utils.FileZip;
import com.wyf.system.utils.FreeMarkerTemplateUtils;

import freemarker.template.Template;

public abstract class CodeGenerator {

	protected String AUTHOR;
    protected String CURRENT_DATE;
    protected String tableName;
    protected String packageName;
    protected String tableAnnotation = "注释内容";
    protected String URL;
    protected String USER;
    protected String PASSWORD;
    protected String DRIVER = "com.mysql.jdbc.Driver";
    protected String diskPath;
    protected String changeTableName;
    protected String packagepath;
    
    private String type;
    
    private DatabaseParser databaseParser;
    
    private FreemarkModel model;

	public CodeGenerator(GeneratorParam generatorParam) throws Exception {
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
		if (generatorParam.getDatabaseType() == null) {
			if (DatabaseTypes.MYSQL.equals(generatorParam.getDatabaseType())) {
				databaseParser = new MysqlParser(URL, USER, PASSWORD, DRIVER);
			} else {
				//目前只支持mysql
			}
		} else {
			throw new Exception("databaseType is null");
		}
		this.changeTableName = CodeGeneratorUtils.replaceUnderLineAndUpperCase(tableName);
		this.packagepath = getPackagepath(packageName);
		this.type = generatorParam.getType();
	}
    
	/**
	 * 执行入口
	 * @throws Exception 
	 */
	public void generate() throws Exception{
		this.model = databaseParser.parse(tableName);
		this.generateModelFile();
		this.generateControllerFile();
		this.generateServiceFile();
		this.generateDaoFile();
		FileZip.doCompress(diskPath+packageName.split("\\.")[0], diskPath+changeTableName+".zip");
	}
	
	protected abstract void generateModelFile() throws Exception;
	
	/**
	 * 生成Controller
	 * @param dataMap
	 * @throws Exception
	 */
	private void generateControllerFile() throws Exception {
		String suffix = "Controller.java";
		String prefix = "controller";
		String path = diskPath + packagepath + "/" + prefix + "/" + changeTableName + suffix;
		String templateName = "Controller.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}
	
	/**
	 * 生成Service
	 * @param dataMap
	 * @throws Exception
	 */
	protected abstract void generateServiceFile() throws Exception;
	
	/**
	 * 生成Dao
	 * @param dataMap
	 * @throws Exception
	 */
	protected abstract void generateDaoFile() throws Exception;
	
	protected void generateFileByTemplate(final String templateName, File file) throws Exception {
		Template template = FreeMarkerTemplateUtils.getTemplate(templateName, type);
		model.setAuthor(AUTHOR);
		model.setPackageName(packageName);
		model.setTableAnnotation(tableAnnotation);
		try (Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"), 10240)) {
			template.process(model, out);
		}
	}
	
	private String getPackagepath(String packagename){
		String a = packagename.replace(".", "//");
		return a;
	}

}
