package ${group}.generator.api;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import ${group}.system.common.MessageCode;
import ${group}.system.common.Result;
import ${group}.generator.entity.CodeGeneratorParam;
import ${group}.generator.CodeGenerator;
import ${group}.generator.HibernateCodeGenerator;
import ${group}.generator.MyBatisCodeGenerator;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(value="代码生成器", tags = "代码生成器API")
public class GenerateController {
	
	private static final Logger log = LoggerFactory.getLogger(GenerateController.class);
	
	@Value("${r'${upload.path}'}")
	private String path;
	
	@GetMapping("/generateCode")
	@ApiOperation(value = "代码生成接口")
	public Result<Object> generateCode(HttpServletResponse response, CodeGeneratorParam generatorParam) {
		String dirPath = path + UUID.randomUUID().toString() + "/";
		generatorParam.setDiskPath(dirPath);
		try {
			CodeGenerator codeGenerateUtils = null;
			if ("mybatis".equals(generatorParam.getType())) {
				codeGenerateUtils = new MyBatisCodeGenerator(generatorParam);
			} else {
				codeGenerateUtils = new HibernateCodeGenerator(generatorParam);
			}
			codeGenerateUtils.generate();
			return new Result<>(MessageCode.SUCCESS);
		} catch (Exception e)  {
			log.error("", e);
		}
		return new Result<>(MessageCode.ERROR);
	}
	
}