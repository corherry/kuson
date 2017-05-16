package com.zhbit.goods.service;

import java.util.List;
import com.zhbit.goods.entity.TGoods;

public interface GoodsService {
	
	public void add(TGoods goods);
	public void delete(TGoods goods);
	public void update(TGoods goods);
	public List<TGoods> queryByType(String type);
	public List<TGoods> queryAllGoods();
}
