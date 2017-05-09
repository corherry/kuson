package com.zhbit.admin.action;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.admin.service.AdminService;

public class LoginAction extends ActionSupport {
	private TAdminInfo admin;
	@Resource
	private	AdminService adminService;
	public String login() throws Exception{
		TAdminInfo adminInfo = adminService.checkLogin(admin);
		if(adminInfo != null){
			this.setAdmin(adminInfo);
			ActionContext.getContext().getSession().put("admin", adminInfo);
			return SUCCESS;
		}
		else {
			this.addFieldError("admin.adminAcount", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ!");
			return LOGIN;
		}
	}
	
	public TAdminInfo getAdmin() {
		return admin;
	}
	public void setAdmin(TAdminInfo admin) {
		this.admin = admin;
	}
}
