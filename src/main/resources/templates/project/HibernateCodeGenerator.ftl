package ${group}.generator;

import java.io.File;
import java.util.Map;

import com.jqkj.generator.entity.CodeGeneratorParam;

public class HibernateCodeGenerator extends CodeGenerator {

	public HibernateCodeGenerator(CodeGeneratorParam generatorParam) throws Exception {
		super(generatorParam, "hibernate");
	}
	
	@Override
	protected void generateModelFile(Map<String, Object> dataMap) throws Exception {
		String suffix = ".java";
        String prefix = "model";
        String path = diskPath+packagepath+"//"+prefix +"//" + changeTableName + suffix;
        String templateName = "Model.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName, mapperFile, dataMap);
	}
	
	@Override
	protected void generateServiceFile(Map<String, Object> dataMap) throws Exception {
		generateService(dataMap);
		generateServiceImpl(dataMap);
	}

	@Override
	protected void generateDaoFile(Map<String, Object> dataMap) throws Exception {
		generateDao(dataMap);
	}
	
	private void generateService(Map<String, Object> dataMap) throws Exception {
		String suffix = "Service.java";
		String prefix = "service";
		String path = diskPath + packagepath + "/" + prefix + "/I" + changeTableName + suffix;
		String templateName = "IService.ftl";
		File mapperFile = new File(path);
		if (!mapperFile.exists()) {
			mapperFile.getParentFile().mkdirs();
		}
		generateFileByTemplate(templateName, mapperFile, dataMap);
	}
	
	private void generateServiceImpl(Map<String, Object> dataMap) throws Exception {
        String suffix = "ServiceImpl.java";
        String prefix = "service";
        String path = diskPath+packagepath+"/"+prefix +"/impl/" + changeTableName + suffix;
        String templateName = "ServiceImpl.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
	}
	
	private void generateDao(Map<String, Object> dataMap) throws Exception {
        String suffix = "DAO.java";
        String prefix = "dao";
        String path = diskPath+packagepath+"/"+prefix +"/" + changeTableName + suffix;
        String templateName = "Dao.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
	}

	@Override
	protected void generateCommonFile(Map<String, Object> dataMap) throws Exception {
		
	}

}