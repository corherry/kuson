package com.zhbit.user.dao;

import java.util.List;

import com.zhbit.user.entity.TAddress;

public interface AddressDao {
	public void delete(TAddress address);
	public List<TAddress> queryByUserId(Integer userId);
	public TAddress findByAddressId(Integer Id);
	public void update(TAddress address);
	public int findCount(int userId);
	public List<TAddress> findAddressByUserId(int begin, int limit, int userId);
	public void addAddress(TAddress taddress);
}
