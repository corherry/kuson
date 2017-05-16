package com.zhbit.category.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.zhbit.category.dao.CategoryDao;
import com.zhbit.category.entity.TType;
import com.zhbit.category.service.CategoryService;
import com.zhbit.util.PageBean;

public class CategoryServiceImpl implements CategoryService{

	@Resource
	private CategoryDao categoryDao;
	@Override
	public PageBean<TType> findByFirstType(Integer pageIndex, String firstType) {
		PageBean<TType> pageBean = new PageBean<TType>();
		int limit = 10;
		int totalCount = categoryDao.findCount(firstType);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(totalCount == 0)
			pageIndex = 0;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setPageIndex(pageIndex);
		pageBean.setTotalPage(totalPage);
		int begin = (pageIndex - 1) * limit;
		List<TType> categoryList = null;
		if(begin >= 0)
			categoryList = categoryDao.findByFirstType(begin, limit, firstType);
		pageBean.setList(categoryList);
		return pageBean;
	}
	@Override
	public void delete(Integer typeId) {
		categoryDao.delete(typeId);
		
	}
	@Override
	public TType add(TType type) {
		return categoryDao.add(type);
	}
	
	@Override
	public void update(TType type){
		categoryDao.update(type);
	}
	
	@Override
	public PageBean<String> showFirtType(Integer pageIndex) {
		PageBean<String> pageBean = new PageBean<String>();
		int limit = 10;
		int totalCount = categoryDao.findFirstCategoryType();
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(totalCount == 0)
			pageIndex = 0;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setPageIndex(pageIndex);
		pageBean.setTotalPage(totalPage);
		int begin = (pageIndex - 1) * limit;
		List<String> categoryList = null;
		if(begin >= 0)
			categoryList = categoryDao.showFirtType(begin, limit);
		pageBean.setList(categoryList);
		return pageBean;
	}
	@Override
	public void deleteByFirstType(String type) {
		categoryDao.deleteByFirstType(type);
		
	}
	@Override
	public TType addFirtType(TType type) {
		return categoryDao.addFirtType(type);
	}
	@Override
	public void updateByFirstType(String firstType, String type) {
		categoryDao.updateByFirstType(firstType, type);
		
	}
	@Override
	public TType addFirstType(TType type) {
		return categoryDao.addFirstType(type);
	}
	@Override
	public TType findByTypeId(Integer typeId) {
		return categoryDao.findByTypeId(typeId);
	}

}
