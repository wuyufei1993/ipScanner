package ${packageName}.service.impl;

import ${packageName}.model.${table.className};
import ${packageName}.dao.${table.className}DAO;
import ${packageName}.dao.BaseDao;
import ${packageName}.service.I${table.className}Service;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
* 描述：${table_annotation}DTO
* @author ${author}
* @date ${date}
*/
@Service
public class ${table.className}ServiceImpl implements I${table.className}Service{
	
	@Autowired
	private ${table.className}DAO ${table.className?uncap_first}DAO;
	
	@Override
	public BaseDao<${table.className}, String> getDao() {
		return ${table.className?uncap_first}DAO;
	}

}