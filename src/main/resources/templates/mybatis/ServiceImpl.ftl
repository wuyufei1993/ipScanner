package ${package_name}.service.impl;

import ${package_name}.dto.${table_name}DTO;
import com.github.pagehelper.Page;
import ${package_name}.dao.${table_name}DAO;
import ${package_name}.service.I${table_name}Service;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

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
	public ${table_name}DTO findById(String id){
		return ${table_name?uncap_first}DAO.findById(id);
	}
	
	@Override
	public List<${table_name}DTO> findAll(${table_name}DTO ${table_name?uncap_first}DTO){
		return ${table_name?uncap_first}DAO.findAll(${table_name?uncap_first}DTO);
	}
	
	@Override
	public Page<${table_name}DTO> findByPage(${table_name}DTO ${table_name?uncap_first}DTO){
		return ${table_name?uncap_first}DAO.findByPage(${table_name?uncap_first}DTO);
	}
	
	@Override
	public void create(${table_name}DTO ${table_name?uncap_first}DTO){
		${table_name?uncap_first}DAO.create(${table_name?uncap_first}DTO);
	}
	
	@Override
	public void delete(String id){
		${table_name?uncap_first}DAO.delete(id);
	}
	
	@Override
	public void update(${table_name}DTO ${table_name?uncap_first}DTO){
		${table_name?uncap_first}DAO.update(${table_name?uncap_first}DTO);
	}

}