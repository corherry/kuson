package com.zhbit.goods.dao.impl;

import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.ejb.FinderException;

import org.apache.taglibs.standard.tag.common.core.SetSupport;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.category.entity.TType;
import com.zhbit.goods.dao.GoodsDao;
import com.zhbit.goods.entity.TGoods;


@Transactional
public class GoodsDaoImpl implements GoodsDao{
	@Resource
	private SessionFactory sessionFactory;
	
	//增加商品
	@Override
	public void add(TGoods goods) {
		TType type = goods.getTType();
		type.getProducts().add(goods);
		goods.setTType(type);
		sessionFactory.getCurrentSession().persist(type);
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
	
	//查询所有商品
	public List<TGoods> queryAllGoods(){
		String hql = "from TGoods";
		List<TGoods> goodsList = sessionFactory.getCurrentSession().createQuery(hql).list();
		return goodsList;
	}
	//按类别查询商品
	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<TGoods> queryByType(String type) {
		return null;
	}


}
