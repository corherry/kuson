package com.zhbit.category.dao;

import java.util.List;

import com.zhbit.category.entity.TType;

public interface CategoryDao {
	public List<TType> findByFirstType(int begin, int limit, String firstType);
	public int findCount(String firstType);
	public void delete(Integer typeId);
	public TType add(TType type);
	public TType update(TType type);
	public List<TType> findAllCategory();
	
	public TType addFirstType(TType type);
	public int findFirstCategoryType();
	public List<String> showFirtType(int begin, int limit);
	public void deleteByFirstType(String type);
	public TType addFirtType(TType type);
	public void updateByFirstType(String firstType, String type);
	public TType findByTypeId(Integer typeId);
	public List<String> findFirstType();
	public List<TType> checkFirstType(String firstType);
}
