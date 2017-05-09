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
			this.addFieldError("admin.adminPassword", "���벻��ȷ");
		}else if(newPassword.equals(rePassword) == false){
			this.addFieldError("rePassword", "�����벻һ��");
		}else if(newPassword.equals(admin.getAdminPassword()) == true){
			this.addFieldError("rePassword", "�����벻����ԭ������ͬ");
		}else if(newPassword.length() < 5 || newPassword.length() > 12){
			this.addFieldError("rePassword", "�����볤�ȱ�����5-12֮��");
		}else{
			String regex = "^[0-9a-zA-Z]{5,12}";
			if(Pattern.matches(regex, newPassword) == false){
				this.addFieldError("rePassword", "����ֻ�ܰ�����ĸ������");
			}
		}
	}
}
