package com.zhbit.user.service;

import java.util.List;
import java.util.Set;

import com.zhbit.user.entity.TAddress;
import com.zhbit.util.PageBean;

public interface AddressService {
	
	public void delete(TAddress address);
	public List<TAddress> queryByUserId(Integer userId);
	public void update(TAddress address);
	public PageBean<TAddress> findAddressByUserId(Integer pageIndex, Integer userId);
	public TAddress findByAddressId(Integer addressId);
	public void addAddress(TAddress taddress);
}
