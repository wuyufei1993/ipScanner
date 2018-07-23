package ${packageName}.controller;

import ${packageName}.model.${table.className};
import ${packageName}.service.${table.className}Service;
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
@RequestMapping("/${table.className}")
public class ${table.className}Controller {

	@Autowired
	private I${table.className}Service ${table.className?uncap_first}Service;
	
	@RequestMapping("/findById")
	@ResponseBody
	public ${table.className} findById(String id) {
		return ${table.className?uncap_first}Service.findById(id);
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<${table.className}> findAll() {
		return ${table.className?uncap_first}Service.findAll();
	}
	
	@RequestMapping("/findByPage")
	@ResponseBody
	public Page<${table.className}> findByPage(int page, int size) {
		return ${table.className?uncap_first}Service.findPageList(PageRequest.of(page, size));
	}
	
	@RequestMapping("/create")
	public void create(${table.className} ${table.className?uncap_first}) {
		${table.className?uncap_first}Service.save(${table.className?uncap_first});
	}
	
	@RequestMapping("/delete")
	public void delete(String id){
		${table.className?uncap_first}Service.deleteById(id);
	}
	
	@RequestMapping("/update")
	public void update(${table.className} ${table.className?uncap_first}){
		${table.className?uncap_first}Service.save(${table.className?uncap_first});
	}

}