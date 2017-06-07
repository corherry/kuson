package com.zhbit.category.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.category.dao.CategoryDao;
import com.zhbit.category.entity.TType;
import com.zhbit.category.service.CategoryService;
import com.zhbit.util.PageBean;

@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Resource
	private CategoryDao categoryDao;
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean<TType> findByFirstType(Integer pageIndex, String firstType) {
		PageBean<TType> pageBean = new PageBean<TType>();
		int limit = 7;
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
	public TType update(TType type){
		return categoryDao.update(type);
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TType> checkFirstType(String firstType){
		return categoryDao.checkFirstType(firstType);
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean<String> showFirtType(Integer pageIndex) {
		PageBean<String> pageBean = new PageBean<String>();
		int limit = 5;
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
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TType findByTypeId(Integer typeId) {
		return categoryDao.findByTypeId(typeId);
	}
	
	@Override
	public List<String> findFirstType() {
		return categoryDao.findFirstType();
	}
	@Override
	public List<TType> findAllCategory() {
		return categoryDao.findAllCategory();
	}

}
