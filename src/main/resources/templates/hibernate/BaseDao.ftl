package ${packageName}.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

/**
* 描述：BaseService
* @author ${author}
* @date ${date}
*/
@NoRepositoryBean
public interface BaseDao<T, ID> extends JpaRepository<T, ID>, JpaSpecificationExecutor<T> {
	
}