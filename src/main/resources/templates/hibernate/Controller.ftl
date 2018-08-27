package ${package_name}.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jqkj.common.PageResult;
import ${package_name}.model.${table_name};
import ${package_name}.service.I${table_name}Service;

/**
* 描述：${table_annotation}Controller
* @author ${author}
* @date ${date}
*/

@RestController
@RequestMapping("/api")
public class ${table_name}Controller {

	@Autowired
	private I${table_name}Service ${table_name?uncap_first}Service;
	
	@GetMapping("/${table_name}/{id}")
	public ${table_name} findById(@PathVariable("id") String id) {
		return ${table_name?uncap_first}Service.findById(id);
	}
	
	@GetMapping("/${table_name}/findAll")
	public List<${table_name}> findAll() {
		return ${table_name?uncap_first}Service.findAll();
	}
	
	@GetMapping("/${table_name}/findByPage")
	public PageResult<${table_name}> findByPage(int page, int size) {
		Page<${table_name}> result = ${table_name?uncap_first}Service.findPageList(PageRequest.of(page, size));
		return new PageResult<>(result.getContent(), page, size, result.getTotalElements());
	}
	
	@PostMapping("/${table_name}")
	public void create(${table_name} ${table_name?uncap_first}) {
		${table_name?uncap_first}Service.save(${table_name?uncap_first});
	}
	
	@DeleteMapping("/${table_name}/{id}")
	public void delete(String id){
		${table_name?uncap_first}Service.deleteById(id);
	}
	
	@PutMapping("/${table_name}")
	public void update(${table_name} ${table_name?uncap_first}){
		${table_name?uncap_first}Service.save(${table_name?uncap_first});
	}

}