package com.zhbit.goods.dao;

import java.util.List;

import com.zhbit.goods.entity.TGoods;
import com.zhbit.goods.entity.TType;

public interface GoodsDao {
	public void deleteSecondClassification(String type, String secondType);
	public void deleteFirstClassification(String type);
	public void add(TGoods goods);
	public void update(TGoods goods);
	public void delete(TGoods goods);
	public List<TGoods> queryByType(String type);
}
