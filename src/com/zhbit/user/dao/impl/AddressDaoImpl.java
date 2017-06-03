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
	//����ջ���ַ
	@Override
	public void add(int userId, TAddress address) {
		TEmailuser user = (TEmailuser)sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
		user.getTAddresses().add(address);
		address.setTEmailuser(user);
		sessionFactory.getCurrentSession().update(user);
	}*/
	
	
	//����ջ���ַ
	@Override
	public void add(TAddress address){
		sessionFactory.getCurrentSession().persist(address);
		
	}

	//ɾ���ջ���ַ
	@Override
	public void delete(TAddress address) {
		sessionFactory.getCurrentSession().delete(address);
	}
	
	//���ջ���ַIDɾ���ջ���ַ
	@Override
	public void deleteByAddressId(Integer id){
		TAddress address = findByAddressId(id);
		sessionFactory.getCurrentSession().delete(address);
	}
	
	//����ַId���ҵ�ַ
	@Override
	public TAddress findByAddressId(Integer Id) {
		TAddress address = (TAddress) sessionFactory.getCurrentSession().get(TAddress.class, Id);
		if(address != null)
			return address;
		return null;
	}

	//�޸��ջ���ַ
	@Override
	public void update(TAddress address){
		sessionFactory.getCurrentSession().merge(address);
	}
	
	
	//���û�Id��ȡ��¼��
	@Override
	public int findCount(int userId) {
		String hql = "from TAddress T where T.TEmailuser.userId = :userId";
		List<TAddress> list = sessionFactory.getCurrentSession().createQuery(hql).
				setInteger("userId", userId).list();
		return list.size();
	}
	
	
	//���û�Id��ҳ��ʾ�ջ���ַ
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
