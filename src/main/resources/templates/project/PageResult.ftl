package ${group}.system.common;

import java.util.List;

public class PageResult<E> {
	
	private List<E> list;
	
	private int current = 0;
	
	private int pageSize = 10;
	
	private long total = 0;
	
	public PageResult() {
		super();
	}

	public PageResult(List<E> list, int current, int pageSize, long total) {
		super();
		this.list = list;
		this.current = current;
		this.pageSize = pageSize;
		this.total = total;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
}
