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
}
