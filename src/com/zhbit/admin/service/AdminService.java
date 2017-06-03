package com.zhbit.admin.service;

import java.util.List;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.util.PageBean;

public interface AdminService {
	public TAdminInfo checkLogin(TAdminInfo admin);
	public void deleteAdminById(Integer id);
	public PageBean<TAdminInfo> findAdminByAuthority(Integer pageIndex, Integer adminAuthority);
	public TAdminInfo findByAdminId(Integer adminId);
	public void add(TAdminInfo admin);
	public void update(TAdminInfo admin);
	
}
