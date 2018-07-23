package ${packageName}.dao;

import ${packageName}.model.${table_name};
import org.springframework.stereotype.Repository;

/**
* 描述：${tableAnnotation}DTO
* @author ${author}
* @date ${date}
*/
@Repository
public interface ${table.className}DAO extends BaseDao<${table.className}, ${table.pk.javaType}> {

}