package com.zhbit.admin.dao;

import java.util.List;

import com.zhbit.admin.entity.TAdminInfo;

public interface AdminDao{
	public TAdminInfo checkLogin(TAdminInfo admin);
	public void deleteAdminById(Integer id);
	public int findCount(int adminAuthority); //×Ü¼ÇÂ¼Êý
	public List<TAdminInfo> findAdminByAuthority(int begin, int limit, int adminAuthority);
	public TAdminInfo findByAdminId(Integer adminId);
	public void add(TAdminInfo admin);
	public void update(TAdminInfo admin);
	public TAdminInfo findByAdminAccount(String adminAccount);
}
