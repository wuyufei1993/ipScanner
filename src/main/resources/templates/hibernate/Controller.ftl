package ${package_name}.controller;

import ${package_name}.model.${table_name};
import ${package_name}.service.I${table_name}Service;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public ${table_name} findById(String id) {
		return ${table_name?uncap_first}Service.findById(id);
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<${table_name}> findAll() {
		return ${table_name?uncap_first}Service.findAll();
	}
	
	@RequestMapping("/findByPage")
	@ResponseBody
	public Page<${table_name}> findByPage(int page, int size) {
		return ${table_name?uncap_first}Service.findPageList(PageRequest.of(page, size));
	}
	
	@RequestMapping("/create")
	public void create(${table_name} ${table_name?uncap_first}) {
		${table_name?uncap_first}Service.save(${table_name?uncap_first});
	}
	
	@RequestMapping("/delete")
	public void delete(String id){
		${table_name?uncap_first}Service.deleteById(id);
	}
	
	@RequestMapping("/update")
	public void update(${table_name} ${table_name?uncap_first}){
		${table_name?uncap_first}Service.save(${table_name?uncap_first});
	}

}