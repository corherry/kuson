package com.zhbit.goods.service;

import java.util.List;

import com.zhbit.category.entity.TType;
import com.zhbit.goods.entity.Category;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.util.PageBean;

public interface GoodsService {
	
	public TType findByType(TType type);
	public PageBean<TGoods> queryAllGoods(Integer pageIndex);
	public TGoods findByGoodsId(Integer goodsId);
	public List<TGoods> findByFirstCategory(String type);
	public List<TGoods> findByTypeId(Integer tid);
	public List<Category> categoryInfo();
	public List<TGoods> findAllGoods();
	public List<TGoods> findByGoodsNo(String goodsNo);
	
	public void add(TGoods goods);
	public void delete(TGoods goods);
	public void update(TGoods goods);
	public List<TGoods> queryByType(String type);
	public TType findTypeBytid(Integer typeId);
	public List<TGoods> queryBySearch(String search);
}
