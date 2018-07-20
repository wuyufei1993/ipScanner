package com.wyf.system.common;

import org.springframework.data.domain.AbstractPageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class Page extends AbstractPageRequest {

	private static final long serialVersionUID = 576249161804008115L;

	private final int page;
	
	private final int size;
	
	private Sort sort = Sort.unsorted();
	
	public Page(int page, int size) {
		super(page, size);
		this.page = page;
		this.size = size;
	}
	
	public Page(int page, int size, Sort sort) {
		super(page, size);
		this.page = page;
		this.size = size;
		this.sort = sort;
	}
	
	public int getPage() {
		return page;
	}

	public int getSize() {
		return size;
	}

	public void setSort(Sort sort) {
		this.sort = sort;
	}

	@Override
	public Sort getSort() {
		return sort;
	}

	@Override
	public Pageable next() {
		return new Page(getPage() + 1, getSize());
	}

	@Override
	public Pageable previous() {
		return new Page(getPage() - 1, getSize());
	}

	@Override
	public Pageable first() {
		return new Page(1, getPageSize());
	}
	
}
