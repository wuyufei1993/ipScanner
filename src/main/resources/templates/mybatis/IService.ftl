package ${package_name}.service;

import com.github.pagehelper.Page;
import ${package_name}.dto.${table_name}DTO;

import java.util.List;

/**
* 描述：${table_annotation}DTO
* @author ${author}
* @date ${date}
*/
public interface I${table_name}Service{

	public ${table_name}DTO findById(String id);

	public List<${table_name}DTO> findAll(${table_name}DTO ${table_name?uncap_first}DTO);

	public Page<${table_name}DTO> findByPage(${table_name}DTO ${table_name?uncap_first}DTO);
	
	public void create(${table_name}DTO ${table_name?uncap_first}DTO);
	
	public void delete(String id);
	
	public void update(${table_name}DTO ${table_name?uncap_first}DTO);

}