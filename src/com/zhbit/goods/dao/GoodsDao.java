package com.zhbit.goods.dao;

import java.util.List;

import com.zhbit.goods.entity.TGoods;

public interface GoodsDao {
	public void add(TGoods goods);
	public void update(TGoods goods);
	public void delete(TGoods goods);
	public List<TGoods> queryByType(String type);
}
