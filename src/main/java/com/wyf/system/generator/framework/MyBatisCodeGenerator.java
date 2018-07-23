package com.wyf.system.generator.framework;

import java.io.File;

import com.wyf.system.generator.CodeGenerator;
import com.wyf.system.generator.entity.GeneratorParam;

public class MyBatisCodeGenerator extends CodeGenerator {

	public MyBatisCodeGenerator(GeneratorParam generatorParam) throws Exception {
		super(generatorParam);
	}

	@Override
	protected void generateModelFile() throws Exception {
		this.generateModel();
		this.generateModelDTO();
	}

	@Override
	protected void generateServiceFile() throws Exception {
		this.generateService();
		this.generateServiceImpl();
	}

	@Override
	protected void generateDaoFile() throws Exception {
		this.generateDao();
		this.generateDaoImpl();
	}

	private void generateModel() throws Exception {
		String suffix = ".java";
		String prefix = "model";
		String path = diskPath + packagepath + "/" + prefix + "/" + changeTableName + suffix;
		String templateName = "Model.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}

	private void generateModelDTO() throws Exception {
		String suffix = "DTO.java";
		String prefix = "dto";
		String path = diskPath + packagepath + "/" + prefix + "/" + changeTableName + suffix;
		String templateName = "ModelDTO.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}

	private void generateService() throws Exception {
		String suffix = "Service.java";
		String prefix = "service";
		String path = diskPath + packagepath + "/" + prefix + "/" + changeTableName + suffix;
		String templateName = "IService.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}

	private void generateServiceImpl() throws Exception {
		String suffix = "ServiceImpl.java";
		String prefix = "service";
		String path = diskPath + packagepath + "/" + prefix + "/impl/" + changeTableName + suffix;
		String templateName = "ServiceImpl.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}

	private void generateDao() throws Exception {
		String suffix = "DAO.java";
		String prefix = "dao";
		String path = diskPath + packagepath + "/" + prefix + "/" + changeTableName + suffix;
		String templateName = "Dao.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}

	private void generateDaoImpl() throws Exception {
		String suffix = "Mapper.xml";
		String prefix = "dao";
		String path = diskPath + packagepath + "/" + prefix + "/" + changeTableName + suffix;
		String templateName = "Mapper.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile);
	}

}
