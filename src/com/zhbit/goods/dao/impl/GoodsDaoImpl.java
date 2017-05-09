package com.zhbit.goods.dao.impl;

import java.util.List;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zhbit.goods.dao.GoodsDao;
import com.zhbit.goods.entity.TGoods;

@Transactional
public class GoodsDaoImpl implements GoodsDao{
	@Resource
	private SessionFactory sessionFactory;
	
	//������Ʒ
	@Override
	public void add(TGoods goods) {
		sessionFactory.getCurrentSession().persist(goods);
	}

	//�޸���Ʒ
	@Override
	public void update(TGoods goods) { 
		sessionFactory.getCurrentSession().merge(goods);		
	}

	//ɾ����Ʒ
	@Override
	public void delete(TGoods goods) { 
		sessionFactory.getCurrentSession().delete(goods);	
	}
	
	//������ѯ��Ʒ
	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<TGoods> queryByType(String type) {
		String hql = "from TGoods where goodsTypde = :goodsType";
		List<TGoods> goodsList = sessionFactory.getCurrentSession().createQuery(hql).
				setString("goodsType", type).list();
		if(goodsList.isEmpty() == true)
			return null;
		else
			return goodsList;
	}
	
}
