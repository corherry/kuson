//package com.zhbit.user.dao.impl;
//
//import java.util.List;
//import java.util.Set;
//
//import javax.annotation.Resource;
//
//import org.hibernate.SessionFactory;
//import org.springframework.transaction.annotation.Propagation;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.zhbit.user.dao.AddressDao;
//import com.zhbit.user.entity.TAddress;
//import com.zhbit.user.entity.TEmailuser;
//
//@Transactional
//public class AddressDaoImpl implements AddressDao {
//	
//	@Resource
//	private SessionFactory sessionFactory;
//	
//	//添加收货地址
//	@Override
//	public void add(int userId, TAddress address) {
//		TEmailuser user = (TEmailuser)sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
//		user.getAddressSet().add(address);
//		address.setTEmailuser(user);;
//		sessionFactory.getCurrentSession().update(user);
//	}
//
//	@Override
//	public void delete(TAddress address) {
//		sessionFactory.getCurrentSession().delete(address);
//	}
//
//	@Override
//	public void update(int userId, TAddress address) {
//		TEmailuser user = (TEmailuser)sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
//		user.getAddressSet().add(address);
//		address.setTEmailuser(user);
//		sessionFactory.getCurrentSession().merge(user);
//	}
//
//	@Override
//	@Transactional(propagation=Propagation.NOT_SUPPORTED)
//	public Set<TAddress> queryByUserId(int userId) {
//		TEmailuser user = (TEmailuser)sessionFactory.getCurrentSession().get(TEmailuser.class, userId);
//		return user.getAddressSet();
//	}
//
//}
