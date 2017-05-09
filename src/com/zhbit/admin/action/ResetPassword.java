package com.zhbit.admin.action;

import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.struts2.components.Else;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.admin.service.AdminService;

public class ResetPassword extends ActionSupport {
	private TAdminInfo admin;
	@Resource
	private AdminService adminService;
	private String newPassword;
	private String rePassword;
	public String resetPassword() throws Exception{
		TAdminInfo adminInfo = (TAdminInfo) ActionContext.getContext().getSession().get("admin");
		adminInfo.setAdminPassword(newPassword);
		adminService.update(adminInfo);
		ActionContext.getContext().getSession().put("admin", adminInfo);
		return SUCCESS;
	}
	public void validateResetPassword(){
		TAdminInfo adminInfo = (TAdminInfo) ActionContext.getContext().getSession().get("admin");
		if(admin.getAdminPassword().equals(adminInfo.getAdminPassword()) == false){
			this.addFieldError("admin.adminPassword", "密码不正确");
		}else if(newPassword.equals(rePassword) == false){
			this.addFieldError("rePassword", "新密码不一致");
		}else if(newPassword.equals(admin.getAdminPassword()) == true){
			this.addFieldError("rePassword", "新密码不能与原密码相同");
		}else if(newPassword.length() < 5 || newPassword.length() > 12){
			this.addFieldError("rePassword", "新密码长度必须在5-12之间");
		}else{
			String regex = "^[0-9a-zA-Z]{5,12}";
			if(Pattern.matches(regex, newPassword) == false){
				this.addFieldError("rePassword", "密码只能包含字母和数字");
			}
		}
	}
}
