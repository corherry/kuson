package com.zhbit.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.zhbit.admin.dao.AdminDao;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.admin.service.AdminService;
import com.zhbit.util.PageBean;

public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDao adminDao;
	@Override
	public void add(TAdminInfo admin) {
		adminDao.add(admin);
	}

	@Override
	public void update(TAdminInfo admin) {
		adminDao.update(admin);
	}


	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public TAdminInfo checkLogin(TAdminInfo admin) {
		return adminDao.checkLogin(admin);
	}

	@Override
	public void deleteAdminById(Integer id) {
		adminDao.deleteAdminById(id);
	}

	@Override
	public PageBean<TAdminInfo> findAdminByAuthority(Integer pageIndex, Integer adminAuthority) {
		PageBean<TAdminInfo> pageBean = new PageBean<TAdminInfo>();
		int limit = 10;
		int totalCount = adminDao.findCount(adminAuthority);
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
		List<TAdminInfo> adminList = null;
		if(begin >= 0)
			adminList = adminDao.findAdminByAuthority(begin, limit, adminAuthority);
		pageBean.setList(adminList);
		return pageBean;
	}

	@Override
	public TAdminInfo findByAdminId(Integer adminId) {
		return adminDao.findByAdminId(adminId);
	}
}
