package ${package_name}.controller;

import ${package_name}.dto.${table_name}DTO;
import ${package_name}.service.I${table_name}Service;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
* 描述：${table_annotation}Controller
* @author ${author}
* @date ${date}
*/

@Controller
@RequestMapping("/${table_name}")
public class ${table_name}Controller {

	@Autowired
	private I${table_name}Service ${table_name?uncap_first}Service;
	
	@RequestMapping("/findById")
	@ResponseBody
	public ${table_name}DTO findById(String id) {
		return ${table_name?uncap_first}Service.findById(id);
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<${table_name}DTO> findAll(${table_name}DTO ${table_name?uncap_first}DTO) {
		return ${table_name?uncap_first}Service.findAll(${table_name?uncap_first}DTO);
	}
	
	@RequestMapping("/findByPage")
	@ResponseBody
	public PageInfo<${table_name}DTO> findByPage(int page, int size, ${table_name}DTO ${table_name?uncap_first}DTO) {
		PageHelper.startPage(page, size);
		return ${table_name?uncap_first}Service.findByPage(${table_name?uncap_first}DTO).toPageInfo();
	}
	
	@RequestMapping("/create")
	public void create(${table_name}DTO ${table_name?uncap_first}DTO) {
		${table_name?uncap_first}Service.create(${table_name?uncap_first}DTO);
	}
	
	@RequestMapping("/delete")
	public void delete(String id){
		${table_name?uncap_first}Service.delete(id);
	}
	
	@RequestMapping("/update")
	public void update(${table_name}DTO ${table_name?uncap_first}DTO){
		${table_name?uncap_first}Service.update(${table_name?uncap_first}DTO);
	}

}