package com.zhbit.user.dao;

import java.util.List;
import java.util.Set;

import com.zhbit.user.entity.TAddress;

public interface AddressDao {
	public void add(TAddress address);
	public void delete(TAddress address);
	public Set<TAddress> queryByUserId(int userId);
	public void deleteByAddressId(Integer id);
	public TAddress findByAddressId(Integer Id);
	public void update(TAddress address);
	public int findCount(int userId);
	public List<TAddress> findAddressByUserId(int begin, int limit, int userId);
}
