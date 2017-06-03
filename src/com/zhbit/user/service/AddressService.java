package com.zhbit.user.service;

import java.util.List;
import java.util.Set;

import com.zhbit.user.entity.TAddress;
import com.zhbit.util.PageBean;

public interface AddressService {
	
	public void delete(TAddress address);
	public Set<TAddress> queryByUserId(int userId);
	public void add(TAddress address);
	public void deleteByAddressId(Integer id);
	public void update(TAddress address);
	public int getAddressTotalPages(int pageSize, int userId);
	public PageBean<TAddress> findAddressByUserId(Integer pageIndex, Integer userId);
	public TAddress findByAddressId(Integer addressId);
}
