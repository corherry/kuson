package com.zhbit.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.zhbit.admin.dao.AdminDao;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.admin.service.AdminService;

public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminDao adminDao;
	@Override
	public void add(TAdminInfo admin) {
		adminDao.add(admin);
	}

	@Override
	public void delete(TAdminInfo admin) {
		adminDao.delete(admin);
	}

	@Override
	public void update(TAdminInfo admin) {
		adminDao.update(admin);
	}

	@Override
	public List<TAdminInfo> queryByGoodsAdminInfo() {
		return adminDao.queryByGoodsAdminInfo();
	}

	@Override
	public List<TAdminInfo> queryByOrderAdminInfo() {
		return adminDao.queryByOrderAdminInfo();
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
	public int getAdminTotalPages(int pageSize, int adminAuthority) {
		int count = adminDao.getAdminCount(adminAuthority);	//�ܼ�¼��
    	int totalpages = 0; 
    	totalpages =(count % pageSize ==0) ? (count / pageSize):(count / pageSize + 1);
    	return totalpages;
	}

	@Override
	public List<TAdminInfo> adminPageList(int pageSize, int pageIndex, int adminAuthority) {
		return adminDao.getAdminPage(pageSize, pageIndex, adminAuthority);
	}

	@Override
	public void deleteAdminById(int id) {
		adminDao.deleteAdminById(id);
	}
}