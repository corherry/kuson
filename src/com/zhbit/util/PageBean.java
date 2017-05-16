package com.zhbit.util;

import java.util.List;

public class PageBean<T> {

	private int limit;// ÿҳ��ʾ����
	private int pageIndex;// ��ǰҳ
	private int totalCount;// �ܼ�¼��
	private int totalPage;// ��ҳ��
	private List<T> list;
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}



}
