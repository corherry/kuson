package com.zhbit.user.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zhbit.user.dao.AddressDao;
import com.zhbit.user.entity.TAddress;
import com.zhbit.user.service.AddressService;
import com.zhbit.util.PageBean;
@Transactional
public class AddressServiceImpl implements AddressService {

	@Resource
	private AddressDao addressDao;
	

	@Override
	public void delete(TAddress address) {
		addressDao.delete(address);
	}


	@Override
	public void update(TAddress address) {
		addressDao.update(address);
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public PageBean<TAddress> findAddressByUserId(Integer pageIndex, Integer userId) {
		PageBean<TAddress> pageBean = new PageBean<TAddress>();
		int limit = 4;
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
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public TAddress findByAddressId(Integer addressId){
		return addressDao.findByAddressId(addressId);
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<TAddress> queryByUserId(Integer userId) {
		return addressDao.queryByUserId(userId);
	}


	@Override
	public void addAddress(TAddress taddress) {
		addressDao.addAddress(taddress);
		
	}


}
