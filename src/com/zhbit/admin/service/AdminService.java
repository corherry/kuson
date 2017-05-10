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
	public int getAdminTotalPages(int pageSize, int adminAuthority); //��ҳ��
	public List<TAdminInfo> adminPageList(int pageSize, int pageIndex, int adminAuthority); //��ǰҳ��ʾ��Ϣ
	public void deleteAdminById(int id);
}
