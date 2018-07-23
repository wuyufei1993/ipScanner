package ${package_name}.service.impl;

import ${package_name}.model.${table_name};
import ${package_name}.dao.${table_name}DAO;
import ${package_name}.dao.BaseDao;
import ${package_name}.service.I${table_name}Service;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

/**
* 描述：${table_annotation}DTO
* @author ${author}
* @date ${date}
*/
@Service
public class ${table_name}ServiceImpl implements I${table_name}Service{
	
	@Autowired
	private ${table_name}DAO ${table_name?uncap_first}DAO;
	
	@Override
	public BaseDao<${table_name}, String> getDao() {
		return ${table_name?uncap_first}DAO;
	}

}