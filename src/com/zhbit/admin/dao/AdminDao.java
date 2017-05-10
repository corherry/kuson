package com.zhbit.admin.dao;

import java.util.List;

import com.zhbit.admin.entity.TAdminInfo;

public interface AdminDao {
	public TAdminInfo checkLogin(TAdminInfo admin);
	public void add(TAdminInfo admin);
	public void delete(TAdminInfo admin);
	public void update(TAdminInfo admin);
	public List<TAdminInfo> queryByGoodsAdminInfo();
	public List<TAdminInfo> queryByOrderAdminInfo();
	public int getAdminCount(int adminAuthority); //总记录数
	public List<TAdminInfo> getAdminPage(int pageSize, int pageIndex, int adminAuthority); //显示当前页
	public void deleteAdminById(int id);
}
