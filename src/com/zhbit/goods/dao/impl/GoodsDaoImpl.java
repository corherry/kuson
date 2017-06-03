package com.zhbit.goods.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.FinderException;

import org.apache.taglibs.standard.tag.common.core.SetSupport;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.category.entity.TType;
import com.zhbit.goods.dao.GoodsDao;
import com.zhbit.goods.entity.Category;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.util.PageHibernateCallBack;


public class GoodsDaoImpl extends HibernateDaoSupport implements GoodsDao{
	@Resource
	private SessionFactory sessionFactory;
	
	public TType findByType(TType type){
		String hql = "from TType where typeOne = ? and typeTwo = ?";
		type = (TType)sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, type.getTypeOne()).setParameter(1, type.getTypeTwo()).uniqueResult();
		return type;
	}
	//增加商品
	@Override
	public void add(TGoods goods) {
		sessionFactory.getCurrentSession().persist(goods);
	}

	//修改商品
	@Override
	public void update(TGoods goods) { 
		sessionFactory.getCurrentSession().merge(goods);		
	}

	//删除商品
	@Override
	public void delete(TGoods goods) { 
		sessionFactory.getCurrentSession().delete(goods);	
	}
	
	public List<TGoods> findAllGoods(){
		String hql = "from TGoods where goodsId in (select min(goodsId) from TGoods group by goodsNo)";
		List<TGoods> goodsList = sessionFactory.getCurrentSession().createQuery(hql).list();
		return goodsList;
	}
	//查询所有商品
	public List<TGoods> queryAllGoods(int begin, int limit){
		String hql = "from TGoods";
		List<TGoods> goodsList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TGoods>(hql, null, begin, limit));
		if(goodsList != null && goodsList.size() > 0)
			return goodsList;
		return null;
	}
	//按类别查询商品
	@Override
	public List<TGoods> queryByType(String type) {
		return null;
	}
	
	@Override
	public int findCount() {
		String hql = "from TGoods";
		int size = sessionFactory.getCurrentSession().createQuery(hql).list().size();
		return size;
	}
	@Override
	public TGoods findByGoodsId(Integer goodsId) {
		TGoods product = (TGoods) sessionFactory.getCurrentSession().get(TGoods.class, goodsId);
		return product;
	}
	@Override
	public List<TGoods> findByFirstCategory(String type) {
		String hql = "from Goods g where g.type.typeOne = ?";
		List<TGoods> goodsList = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, type).list();
		return goodsList;
	}
	@Override
	public List<TGoods> findByTypeId(Integer tid) {
		String hql = "from Goods g where g.type.typeId = ?";
		List<TGoods> goodsList = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, tid).list();
		return goodsList;
	}
	@Override
	public List<Category> categoryInfo() {
		String hql = "from TType where typeTwo is not null";
		List<TType> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		List<Category> categoryList = new ArrayList<Category>();
		for(TType type:list){
			Category cry = new Category();
			cry.setCid(type.getTypeId());
			String cgy = type.getTypeOne() + "/" + type.getTypeTwo();
			cry.setCategory(cgy);
			categoryList.add(cry);
		}
		return categoryList;
	}
	@Override
	public TType findTypeBytid(Integer typeId) {
		TType type = (TType) sessionFactory.getCurrentSession().get(TType.class, typeId);
		return type;
	}
	@Override
	public List<TGoods> findByGoodsNo(String goodsNo) {
		String hql = "from TGoods where goodsNo = ?";
		List<TGoods> goodsInfoList = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, goodsNo).list();
		return goodsInfoList;
	}


}
