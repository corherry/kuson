package com.zhbit.goods.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.category.entity.TType;
import com.zhbit.goods.dao.GoodsDao;
import com.zhbit.goods.entity.Category;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.goods.service.GoodsService;
import com.zhbit.util.PageBean;

@Transactional
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
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TGoods> queryByType(String type) {
		return goodsDao.queryByType(type);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean<TGoods> queryAllGoods(Integer pageIndex) {
		PageBean<TGoods> pageBean = new PageBean<TGoods>();
		int limit = 10;
		int totalCount = goodsDao.findCount();
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(totalCount == 0)
			pageIndex = 0;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setPageIndex(pageIndex);
		pageBean.setTotalPage(totalPage);
		int begin = (pageIndex - 1) * limit;
		List<TGoods> goodsList = null;
		if(begin >= 0)
			goodsList = goodsDao.queryAllGoods(begin, limit);
		pageBean.setList(goodsList);
		return pageBean;
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TType findByType(TType type) {
		return goodsDao.findByType(type);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TGoods findByGoodsId(Integer goodsId) {
		return goodsDao.findByGoodsId(goodsId);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TGoods> findByFirstCategory(String type) {
		return goodsDao.findByFirstCategory(type);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TGoods> findByTypeId(Integer tid) {
		return goodsDao.findByTypeId(tid);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Category> categoryInfo() {
		return goodsDao.categoryInfo();
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TType findTypeBytid(Integer typeId) {
		return goodsDao.findTypeBytid(typeId);
	}

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TGoods> findAllGoods() {
		return goodsDao.findAllGoods();
	}

	@Override
	public List<TGoods> findByGoodsNo(String goodsNo) {
		return goodsDao.findByGoodsNo(goodsNo);
	}

	@Override
	public List<TGoods> queryBySearch(String search) {
		return goodsDao.queryBySearch(search);
	}


}
