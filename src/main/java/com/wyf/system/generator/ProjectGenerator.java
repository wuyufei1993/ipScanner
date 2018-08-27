package com.wyf.system.generator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

import org.springframework.util.ResourceUtils;

import com.wyf.system.generator.entity.ProjectGeneratorParam;
import com.wyf.system.utils.FileZip;
import com.wyf.system.utils.FreeMarkerTemplateUtils;

import freemarker.template.Template;

public class ProjectGenerator {
	
	private ProjectGeneratorParam generatorParam;
	
	public ProjectGenerator (ProjectGeneratorParam generatorParam) {
		this.generatorParam = generatorParam;
	}
	
	public void generate() throws Exception {
		createPath();
		createCommFiles();
		createSystemFiles();
		unzipFile();
		FileZip.doCompress(generatorParam.getDiskPath() + generatorParam.getArtifact(), generatorParam.getDiskPath() + generatorParam.getArtifact() + ".zip");
	}
	
	private void unzipFile() throws FileNotFoundException {
		String basePath = generatorParam.getDiskPath() + generatorParam.getArtifact() + "/";
		String freemarkerPath = basePath + "src/main/resources/freemarker/";
		FileZip.unZip(ResourceUtils.getFile("projectFile/freemarker.zip"), freemarkerPath);
		FileZip.unZip(ResourceUtils.getFile("projectFile/mvn.zip"), basePath);
	}

	private void createPath() {
		String basePath = generatorParam.getDiskPath();
		String packagePath = generatorParam.getGroup().replaceAll("\\.", "/") + "/";
		String codePath = "src/main/java/" + packagePath + generatorParam.getArtifact();
		String systemPath = "src/main/java/" + packagePath + "system";
		String generatorPath = "src/main/java/" + packagePath + "generator";
		String testCodePath = "src/test/java/" + packagePath + generatorParam.getArtifact();
		String staticPath = "src/main/resources/static";
		String templatesPath = "src/main/resources/templates";
		String configPath = "src/main/resources/config";
		String freemarkerPath = "src/main/resources/freemarker";
		String[] paths = new String[] {".mvn/wrapper", codePath, systemPath, generatorPath, staticPath, templatesPath, configPath, freemarkerPath, testCodePath};
		for (String path : paths) {
			path = basePath + "/" + generatorParam.getArtifact() + "/" + path;
			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
		}
	}
	
	private void createCommFiles() throws Exception {
		String basePath = generatorParam.getDiskPath() + "/" + generatorParam.getArtifact() + "/";
//		String packagePath = generatorParam.getGroup().replaceAll("\\.", "/") + "/";
		//创建pom
		String templateName = "pom.ftl";
        String path = basePath + "pom.xml";
        generateFileByTemplate(templateName, path);
        //创建application.yml
        templateName = "application.ftl";
        path = basePath + "src/main/resources/config/application.yml";
        generateFileByTemplate(templateName, path);
        //创建freemarker模板文件
        
	}
	
	private void createSystemFiles()  throws Exception {
		String basePath = generatorParam.getDiskPath() + "/" + generatorParam.getArtifact() + "/src/main/java/";
		String packagePath = generatorParam.getGroup().replaceAll("\\.", "/") + "/";
        //创建启动类Application.java
        String templateName = "StartApplication.ftl";
        String path = basePath + packagePath + "StartApplication.java";
        generateFileByTemplate(templateName, path);
		//system
		//common
        templateName = "MessageCode.ftl";
        path = basePath + packagePath + "system/common/MessageCode.java";
        generateFileByTemplate(templateName, path);
        templateName = "Result.ftl";
        path = basePath + packagePath + "system/common/Result.java";
        generateFileByTemplate(templateName, path);
        templateName = "PageResult.ftl";
        path = basePath + packagePath + "system/common/PageResult.java";
        generateFileByTemplate(templateName, path);
        //config
        templateName = "FastJsonConfig.ftl";
        path = basePath + packagePath + "system/config/FastJsonConfig.java";
        generateFileByTemplate(templateName, path);
        templateName = "SwaggerConfig.ftl";
        path = basePath + packagePath + "system/config/SwaggerConfig.java";
        generateFileByTemplate(templateName, path);
        //jpa
        templateName = "BaseDao.ftl";
        path = basePath + packagePath + "system/jpa/BaseDao.java";
        generateFileByTemplate(templateName, path);
        templateName = "BaseService.ftl";
        path = basePath + packagePath + "system/jpa/BaseService.java";
        generateFileByTemplate(templateName, path);
        templateName = "SimpleSpecification.ftl";
        path = basePath + packagePath + "system/jpa/specification/SimpleSpecification.java";
        generateFileByTemplate(templateName, path);
        templateName = "SimpleSpecificationBuilder.ftl";
        path = basePath + packagePath + "system/jpa/specification/SimpleSpecificationBuilder.java";
        generateFileByTemplate(templateName, path);
        templateName = "SpecificationOperator.ftl";
        path = basePath + packagePath + "system/jpa/specification/SpecificationOperator.java";
        generateFileByTemplate(templateName, path);
        //utils
        templateName = "CodeGeneratorUtils.ftl";
        path = basePath + packagePath + "system/util/CodeGeneratorUtils.java";
        generateFileByTemplate(templateName, path);
        templateName = "FileZip.ftl";
        path = basePath + packagePath + "system/util/FileZip.java";
        generateFileByTemplate(templateName, path);
        templateName = "FreeMarkerTemplateUtils.ftl";
        path = basePath + packagePath + "system/util/FreeMarkerTemplateUtils.java";
        generateFileByTemplate(templateName, path);
        templateName = "DateUtil.ftl";
        path = basePath + packagePath + "system/util/DateUtil.java";
        generateFileByTemplate(templateName, path);
        //generator
        templateName = "CodeGeneratorParam.ftl";
        path = basePath + packagePath + "generator/entity/CodeGeneratorParam.java";
        generateFileByTemplate(templateName, path);
        templateName = "ColumnClass.ftl";
        path = basePath + packagePath + "generator/entity/ColumnClass.java";
        generateFileByTemplate(templateName, path);
        templateName = "CodeGenerator.ftl";
        path = basePath + packagePath + "generator/CodeGenerator.java";
        generateFileByTemplate(templateName, path);
        templateName = "HibernateCodeGenerator.ftl";
        path = basePath + packagePath + "generator/HibernateCodeGenerator.java";
        generateFileByTemplate(templateName, path);
        templateName = "MyBatisCodeGenerator.ftl";
        path = basePath + packagePath + "generator/MyBatisCodeGenerator.java";
        generateFileByTemplate(templateName, path);
        templateName = "GenerateController.ftl";
        path = basePath + packagePath + "generator/api/GenerateController.java";
        generateFileByTemplate(templateName, path);
	}
	
	private void generateFileByTemplate(final String templateName, String path) throws Exception {
		File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
		Template template = FreeMarkerTemplateUtils.getTemplate(templateName, "project");
		try (Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(mapperFile), "utf-8"), 10240)) {
			template.process(generatorParam, out);
		}
	}
	
}
