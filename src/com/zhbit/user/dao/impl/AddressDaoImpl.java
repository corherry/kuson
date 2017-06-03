package com.zhbit.user.dao.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.user.dao.AddressDao;
import com.zhbit.user.entity.TAddress;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.util.PageHibernateCallBack;

@Transactional
public class AddressDaoImpl  extends HibernateDaoSupport implements AddressDao {
	
	@Resource
	private SessionFactory sessionFactory;
	
	/*
	//添加收货地址
	@Override
	public void add(int userId, TAddress address) {
		TEmailuser user = (TEmailuser)sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
		user.getTAddresses().add(address);
		address.setTEmailuser(user);
		sessionFactory.getCurrentSession().update(user);
	}*/
	
	
	//添加收货地址
	@Override
	public void add(TAddress address){
		sessionFactory.getCurrentSession().persist(address);
		
	}

	//删除收货地址
	@Override
	public void delete(TAddress address) {
		sessionFactory.getCurrentSession().delete(address);
	}
	
	//按收货地址ID删除收货地址
	@Override
	public void deleteByAddressId(Integer id){
		TAddress address = findByAddressId(id);
		sessionFactory.getCurrentSession().delete(address);
	}
	
	//按地址Id查找地址
	@Override
	public TAddress findByAddressId(Integer Id) {
		TAddress address = (TAddress) sessionFactory.getCurrentSession().get(TAddress.class, Id);
		if(address != null)
			return address;
		return null;
	}

	//修改收货地址
	@Override
	public void update(TAddress address){
		sessionFactory.getCurrentSession().merge(address);
	}
	
	
	//按用户Id获取记录数
	@Override
	public int findCount(int userId) {
		String hql = "from TAddress T where T.TEmailuser.userId = :userId";
		List<TAddress> list = sessionFactory.getCurrentSession().createQuery(hql).
				setInteger("userId", userId).list();
		return list.size();
	}
	
	
	//按用户Id分页显示收货地址
	@Override
	public List<TAddress> findAddressByUserId(int begin, int limit, int userId) {
		String hql = "from TAddress  where TAddress.TEmailuser.userId = ?";
		List<TAddress> addressList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TAddress>(hql, new Object[]{userId}, begin, limit));
		if(addressList != null && addressList.size() > 0)
			return addressList;
		return null;
	}

	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Set<TAddress> queryByUserId(int userId) {
		TEmailuser user = (TEmailuser)sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
		return user.getTAddresses();
	}

}
