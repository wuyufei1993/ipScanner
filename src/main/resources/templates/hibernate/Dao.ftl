package ${package_name}.dao;

import ${package_name}.model.${table_name};
import org.springframework.stereotype.Repository;
import ${package_name}.system.jpa.BaseDao;

/**
* 描述：${table_annotation}DTO
* @author ${author}
* @date ${date}
*/
@Repository
public interface ${table_name}DAO extends BaseDao<${table_name}, ${pk_class}> {

}