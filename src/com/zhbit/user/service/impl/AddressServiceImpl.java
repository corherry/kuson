package com.zhbit.user.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.user.dao.AddressDao;
import com.zhbit.user.entity.TAddress;
import com.zhbit.user.service.AddressService;
import com.zhbit.util.PageBean;

public class AddressServiceImpl implements AddressService {

	@Resource
	private AddressDao addressDao;
	
	@Override
	public void add(TAddress address) {
		addressDao.add(address);
	}

	@Override
	public void delete(TAddress address) {
		addressDao.delete(address);
	}
	
	@Override
	public void deleteByAddressId(Integer id){
		addressDao.deleteByAddressId(id);
	}

	@Override
	public void update(TAddress address) {
		addressDao.update(address);
	}
	
	@Override
	public int getAddressTotalPages(int pageSize, int userId) {
		int count = addressDao.findCount(userId); //×Ü¼ÇÂ¼Êý
    	int totalpages = 0; 
    	totalpages =(count % pageSize ==0) ? (count / pageSize):(count / pageSize + 1);
    	return totalpages;
	}
	
	@Override
	public PageBean<TAddress> findAddressByUserId(Integer pageIndex, Integer userId) {
		PageBean<TAddress> pageBean = new PageBean<TAddress>();
		int limit = 10;
		int totalCount = addressDao.findCount(userId);
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(totalCount == 0)
			pageIndex = 0;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		pageBean.setPageIndex(pageIndex);
		pageBean.setTotalPage(totalPage);
		int begin = (pageIndex - 1) * limit;
		List<TAddress> addressList = null;
		if(begin >= 0)
			addressList = addressDao.findAddressByUserId(begin, limit, userId);
		pageBean.setList(addressList);
		return pageBean;
	}

	@Override
	public TAddress findByAddressId(Integer addressId){
		return addressDao.findByAddressId(addressId);
	}
	
	@Override
	public Set<TAddress> queryByUserId(int userId) {
		return addressDao.queryByUserId(userId);
	}


}
