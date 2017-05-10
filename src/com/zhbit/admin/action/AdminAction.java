package com.zhbit.admin.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.admin.service.AdminService;

public class AdminAction extends ActionSupport{
	private final int pageSize = 2; //每页显示数量
	private int pageIndex = 1; //当前页
	private int adminAuthority;
	@Resource
	private AdminService adminService;
	private List<TAdminInfo> adminList;
	public String getAdmin() throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		String authority = request.getParameter("adminAuthority");
		adminAuthority = Integer.parseInt(authority);
		int totalPages = adminService.getAdminTotalPages(pageSize, adminAuthority); //总页数
		System.out.println("-----------------------pagesize:" + pageSize);
		System.out.println("-----------------------total:" + totalPages);
		String currentPage=request.getParameter("pageIndex");	//确定当前页
		if(currentPage == null){
			currentPage = "1";
		}
		pageIndex = Integer.parseInt(currentPage);
		if(pageIndex<1){
			pageIndex = 1;
		}else if(pageIndex > totalPages){
			pageIndex = totalPages;
		}
		System.out.println("-----------------------xxxxxxxxx" +pageIndex);
		if(totalPages == 0)
			pageIndex = 0;	
		adminList = adminService.adminPageList(pageSize, pageIndex, adminAuthority);
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("totalPages", totalPages);
		request.setAttribute("adminAuthority", adminAuthority);
		request.setAttribute("list", adminList);
		return SUCCESS;
	}
	public String delete() throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		String id = request.getParameter("adminId");
		int adminId = Integer.parseInt(id);
		adminService.deleteAdminById(adminId);
		return getAdmin();
	}
	public List<TAdminInfo> getAdminList() {
		return adminList;
	}
	public void setAdminList(List<TAdminInfo> adminList) {
		this.adminList = adminList;
	}
	
}
