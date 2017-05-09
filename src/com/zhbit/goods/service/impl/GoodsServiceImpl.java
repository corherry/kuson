package com.zhbit.goods.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.zhbit.goods.dao.GoodsDao;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.goods.service.GoodsService;

public class GoodsServiceImpl implements GoodsService {
	@Resource
	private GoodsDao goodsDao;
	@Override
	public void add(TGoods goods) {
		goodsDao.add(goods);
	}

	@Override
	public void delete(TGoods goods) {
		goodsDao.delete(goods);
	}

	@Override
	public void update(TGoods goods) {
		goodsDao.update(goods);
	}

	@Override
	public List<TGoods> queryByType(String type) {
		return goodsDao.queryByType(type);
	}

	public GoodsDao getGoodsDao() {
		return goodsDao;
	}

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

}
