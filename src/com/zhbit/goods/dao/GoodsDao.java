package com.zhbit.goods.dao;

import java.util.List;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.category.entity.TType;
import com.zhbit.goods.entity.Category;
import com.zhbit.goods.entity.TGoods;


public interface GoodsDao {
	public TType findByType(TType type);
	public int findCount();
	public List<TGoods> queryAllGoods(int begin, int limit);
	public TGoods findByGoodsId(Integer goodsId);
	public List<TGoods> findByFirstCategory(String type);
	public List<TGoods> findByTypeId(Integer tid);
	public List<TGoods> findAllGoods();
	
	public void add(TGoods goods);
	public void update(TGoods goods);
	public void delete(TGoods goods);
	public List<TGoods> queryByType(String type);
	public List<Category> categoryInfo();
	public TType findTypeBytid(Integer typeId);
	public List<TGoods> findByGoodsNo(String goodsNo);
}
