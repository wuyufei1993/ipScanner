package ${group}.generator;

import java.io.File;
import java.util.Map;

import ${group}.generator.entity.CodeGeneratorParam;

public class MyBatisCodeGenerator extends CodeGenerator {

	public MyBatisCodeGenerator(CodeGeneratorParam generatorParam) throws Exception {
		super(generatorParam, "mybatis");
	}
	
	@Override
	protected void generateModelFile(Map<String, Object> dataMap) throws Exception {
		this.generateModel(dataMap);
		this.generateModelDTO(dataMap);
	}
	
	@Override
	protected void generateServiceFile(Map<String,Object> dataMap) throws Exception{
		this.generateService(dataMap);
		this.generateServiceImpl(dataMap);
    }
	
	@Override
	protected void generateDaoFile(Map<String,Object> dataMap) throws Exception{
		this.generateDao(dataMap);
		this.generateDaoImpl(dataMap);
    }
	
	private void generateModel(Map<String,Object> dataMap) throws Exception {
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
	
	private void generateModelDTO(Map<String,Object> dataMap) throws Exception {
        String suffix = "DTO.java";
        String prefix = "dto";
        String path = diskPath+packagepath+"//"+prefix +"//" + changeTableName + suffix;
        String templateName = "ModelDTO.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
	
	private void generateService(Map<String,Object> dataMap) throws Exception{
        String suffix = "Service.java";
        String prefix = "service";
        String path = diskPath+packagepath+"//"+prefix +"//I" + changeTableName + suffix;
        String templateName = "IService.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
	
	private void generateServiceImpl(Map<String,Object> dataMap) throws Exception{
        String suffix = "ServiceImpl.java";
        String prefix = "service";
        String path = diskPath+packagepath+"//"+prefix +"//impl//" + changeTableName + suffix;
        String templateName = "ServiceImpl.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
	
	private void generateDao(Map<String,Object> dataMap) throws Exception{
        String suffix = "DAO.java";
        String prefix = "dao";
        String path = diskPath+packagepath+"//"+prefix +"//" + changeTableName + suffix;
        String templateName = "Dao.ftl";
        File mapperFile = new File(path);
        if(!mapperFile.exists()){
        	mapperFile.getParentFile().mkdirs();
        }
        generateFileByTemplate(templateName,mapperFile,dataMap);
    }
	
	private void generateDaoImpl(Map<String,Object> dataMap) throws Exception{
        String suffix = "Mapper.xml";
        String prefix = "dao";
        String path = diskPath+packagepath+"//"+prefix +"//" + changeTableName + suffix;
        String templateName = "Mapper.ftl";
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