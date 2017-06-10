package com.zhbit.user.action;

import java.util.regex.Pattern;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;
import com.zhbit.util.MD5Util;

@SuppressWarnings("serial")
public class ResetPassword extends ActionSupport implements Preparable{
	private TEmailuser user;
	@Resource
	private UserService userService;
	private String newPassword;
	private String rePassword;
	public String resetPassword() throws Exception{
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		emailuser.setPassword(MD5Util.encode2hex(newPassword));
		userService.updateEmailUser(emailuser);
		ActionContext.getContext().getSession().put("user", emailuser);
		ActionContext.getContext().getSession().put("info", "修改成功");
		return SUCCESS;
	}
	public void validateResetPassword(){
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		user.setPassword(MD5Util.encode2hex(user.getPassword()));
		if(user.getPassword().equals(emailuser.getPassword()) == false){
			this.addFieldError("user.password", "密码不正确");
		}else if(newPassword.equals(rePassword) == false){
			this.addFieldError("rePassword", "新密码不一致");
		}else if(newPassword.equals(user.getPassword()) == true){
			this.addFieldError("rePassword", "新密码不能与原密码相同");
		}else if(newPassword.length() < 5 || newPassword.length() > 12){
			this.addFieldError("rePassword", "新密码长度必须为5~12位");
		}else{
			String regex = "^[0-9a-zA-Z]{5,12}";
			if(Pattern.matches(regex, newPassword) == false){
				this.addFieldError("rePassword", "密码只能包含字母和数字");
			}
		}
	}
	public void prepare() throws Exception {
        clearErrorsAndMessages() ;
    }
	public TEmailuser getUser() {
		return user;
	}
	public void setUser(TEmailuser user) {
		this.user = user;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
}
