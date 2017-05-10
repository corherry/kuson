package com.zhbit.goods.service;

import java.util.List;

import com.zhbit.goods.entity.TGoods;
import com.zhbit.goods.entity.TType;

public interface GoodsService {
	public void deleteSecondClassification(String type, String secondType);
	public void deleteFirstClassification(String type);
	public void add(TGoods goods);
	public void delete(TGoods goods);
	public void update(TGoods goods);
	public List<TGoods> queryByType(String type);
}
