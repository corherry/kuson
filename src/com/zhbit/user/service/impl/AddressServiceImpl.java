//package com.zhbit.user.service.impl;
//
//import java.util.List;
//import java.util.Set;
//
//import com.zhbit.user.dao.AddressDao;
//import com.zhbit.user.entity.TAddress;
//import com.zhbit.user.service.AddressService;
//
//public class AddressServiceImpl implements AddressService {
//
//	private AddressDao addressDao;
//	@Override
//	public void add(int userId, TAddress address) {
//		addressDao.add(userId, address);
//	}
//
//	@Override
//	public void delete(TAddress address) {
//		addressDao.delete(address);
//	}
//
//	@Override
//	public void update(int userId, TAddress address) {
//		addressDao.update(userId, address);
//	}
//
//	@Override
//	public Set<TAddress> queryByUserId(int userId) {
//		return addressDao.queryByUserId(userId);
//	}
//
//	public AddressDao getAddressDao() {
//		return addressDao;
//	}
//
//	public void setAddressDao(AddressDao addressDao) {
//		this.addressDao = addressDao;
//	}
//
//
//}
