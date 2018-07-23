package ${packageName}.service;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;

import ${packageName}.dao.BaseDao;


/**
* 描述：BaseService
* @author ${author}
* @date ${date}
*/
public interface BaseService<T, ID extends Serializable> {
	
	public BaseDao<T, ID> getDao();
	
	/**
	 * 通过Id查询
	 * 
	 * @param id
	 * @return
	 */
	public default T findById(ID id) {
		return getDao().getOne(id);
	}

	/**
	 * 查询列表信息
	 * 
	 * @return
	 */
	public default List<T> findAll() {
		return getDao().findAll();
	}

	/**
	 * 通过Id集合查询列表
	 * 
	 * @param ids
	 * @return
	 */
	public default List<T> findListByIds(ID[] ids) {
		return getDao().findAllById(Arrays.asList(ids));
	}

	/**
	 * 分页查询
	 * 
	 * @param spec
	 * @param pageable
	 * @return
	 */
	public default Page<T> findPageList(Pageable pageable) {
		return getDao().findAll(pageable);
	}

	/**
	 * 条件分页查询
	 * 
	 * @param spec
	 * @param pageable
	 * @return
	 */
	public default Page<T> findPageList(Specification<T> spec, Pageable pageable) {
		return spec == null ? getDao().findAll(pageable) : getDao().findAll(spec, pageable);
	}

	/**
	 * 查询记录数
	 * 
	 * @param spec
	 * @return
	 */
	public default long count(Specification<T> spec) {
		return getDao().count(spec);
	}

	/**
	 * 通过Id判断是否存在
	 * 
	 * @param id
	 * @return
	 */
	public default boolean existsById(ID id) {
		return getDao().existsById(id);
	}

	/**
	 * 保存或更新
	 * 
	 * @param entity
	 */
	public default T save(T entity) {
		return getDao().save(entity);
	}

	/**
	 * 根据Id删除
	 * 
	 * @param id
	 */
	public default void deleteById(ID id) {
		getDao().deleteById(id);
	}

	/**
	 * 通过Id[]批量删除
	 * 
	 * @param ids
	 */
	public default void deleteByIds(Iterable<ID> ids) {
		for (ID id : ids) {
			getDao().deleteById(id);
		}
	}

	/**
	 * 通过Iterable<T> entitys删除
	 * 
	 * @param entitys
	 */
	public default void delete(Iterable<T> entitys) {
		getDao().deleteAll(entitys);
	}

	/**
	 * 删除单个实体
	 * 
	 * @param entity
	 */
	public default void delete(T entity) {
		getDao().delete(entity);
	}

	/**
	 * 按照条件排序
	 * 
	 * @param spec
	 * @param sort
	 * @return
	 */
	public default List<T> findSortList(Specification<T> spec, Sort sort) {
		return getDao().findAll(spec, sort);
	}
	
}