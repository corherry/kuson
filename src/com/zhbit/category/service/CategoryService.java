package com.zhbit.category.service;

import java.util.List;

import com.zhbit.category.entity.TType;
import com.zhbit.util.PageBean;

public interface CategoryService {
	public PageBean<TType> findByFirstType(Integer pageIndex, String firstType);
	public void delete(Integer typeId);
	public TType add(TType type);
	public TType update(TType type);
	public List<String> findFirstType();
	public List<TType> findAllCategory();
	
	public TType addFirstType(TType type);
	public PageBean<String> showFirtType(Integer pageIndex);
	public void deleteByFirstType(String type);
	public TType addFirtType(TType type);
	public void updateByFirstType(String firstType, String type);
	public TType findByTypeId(Integer typeId);
	public List<TType> checkFirstType(String firstType);
}
