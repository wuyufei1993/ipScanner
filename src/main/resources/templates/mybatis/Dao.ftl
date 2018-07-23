package ${package_name}.dao;

import com.github.pagehelper.Page;

import ${package_name}.model.${table_name};
import ${package_name}.dto.${table_name}DTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* 描述：${table_annotation}DTO
* @author ${author}
* @date ${date}
*/
@Mapper
public interface ${table_name}DAO{

	 ${table_name}DTO findById(@Param("id")String id);

	 List<${table_name}DTO> findAll(@Param("${table_name?uncap_first}DTO")${table_name}DTO ${table_name?uncap_first}DTO);
	 
	 Page<${table_name}DTO> findByPage(@Param("${table_name?uncap_first}DTO")${table_name}DTO ${table_name?uncap_first}DTO);
	
	 void create(@Param("${table_name?uncap_first}DTO")${table_name}DTO ${table_name?uncap_first}DTO);
	
	 void delete(@Param("id")String id);
	
	 void update(@Param("${table_name?uncap_first}DTO")${table_name}DTO ${table_name?uncap_first}DTO);

}