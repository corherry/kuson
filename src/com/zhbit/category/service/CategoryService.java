package com.zhbit.category.service;

import com.zhbit.category.entity.TType;
import com.zhbit.util.PageBean;

public interface CategoryService {
	public PageBean<TType> findByFirstType(Integer pageIndex, String firstType);
	public void delete(Integer typeId);
	public TType add(TType type);
	public void update(TType type);
	
	public TType addFirstType(TType type);
	public PageBean<String> showFirtType(Integer pageIndex);
	public void deleteByFirstType(String type);
	public TType addFirtType(TType type);
	public void updateByFirstType(String firstType, String type);
	public TType findByTypeId(Integer typeId);
}
