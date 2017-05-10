package com.zhbit.admin.service;

import java.util.List;
import com.zhbit.admin.entity.TAdminInfo;

public interface AdminService {
	public TAdminInfo checkLogin(TAdminInfo admin);
	public void add(TAdminInfo admin);
	public void delete(TAdminInfo admin);
	public void update(TAdminInfo admin);
	public List<TAdminInfo> queryByGoodsAdminInfo();
	public List<TAdminInfo> queryByOrderAdminInfo();
	public int getAdminTotalPages(int pageSize, int adminAuthority); //总页数
	public List<TAdminInfo> adminPageList(int pageSize, int pageIndex, int adminAuthority); //当前页显示信息
	public void deleteAdminById(int id);
}
