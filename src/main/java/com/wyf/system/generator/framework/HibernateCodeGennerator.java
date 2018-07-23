package com.wyf.system.generator.framework;

import java.io.File;

import com.wyf.system.generator.CodeGenerator;
import com.wyf.system.generator.entity.GeneratorParam;

public class HibernateCodeGennerator extends CodeGenerator {

	public HibernateCodeGennerator(GeneratorParam generatorParam) throws Exception {
		super(generatorParam);
	}

	@Override
	protected void generateModelFile() throws Exception {
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

	@Override
	protected void generateServiceFile() throws Exception {
		generateBaseService();
		generateService();
		generateServiceImpl();
	}

	@Override
	protected void generateDaoFile() throws Exception {
		generateBaseDao();
		generateDao();
	}

	private void generateBaseService() throws Exception {
		String suffix = "BaseService.java";
		String prefix = "service";
		String path = diskPath + packagepath + "/" + prefix + "/" + suffix;
		String templateName = "BaseService.ftl";
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

	private void generateBaseDao() throws Exception {
		String suffix = "BaseDao.java";
		String prefix = "dao";
		String path = diskPath + packagepath + "/" + prefix + "/" + suffix;
		String templateName = "BaseDao.ftl";
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

}
