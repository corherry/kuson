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

public class AddressDaoImpl  extends HibernateDaoSupport implements AddressDao {
	
	@Resource
	private SessionFactory sessionFactory;
	

	//ɾ���ջ���ַ
	@Override
	public void delete(TAddress address) {
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
		String hql = "from TAddress a where a.user.userId = ?";
		List<TAddress> list = sessionFactory.getCurrentSession().createQuery(hql).
				setParameter(0, userId).list();
		return list.size();
	}
	
	
	//���û�Id��ҳ��ʾ�ջ���ַ
	@Override
	public List<TAddress> findAddressByUserId(int begin, int limit, int userId) {
		String hql = "from TAddress a where a.user.userId = ?";
		List<TAddress> addressList = this.getHibernateTemplate().execute(new PageHibernateCallBack<TAddress>(hql, new Object[]{userId}, begin, limit));
		if(addressList != null && addressList.size() > 0)
			return addressList;
		return null;
	}

	
	@Override
	public List<TAddress> queryByUserId(Integer userId) {
		String hql = "from TAddress a where a.user.userId = ?";
		List<TAddress> addressList = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, userId).list();
		if(addressList.size() > 0 || addressList != null)
			return addressList;
		return null;
	}

	@Override
	public void addAddress(TAddress taddress) {
		sessionFactory.getCurrentSession().persist(taddress);
		
	}

}
