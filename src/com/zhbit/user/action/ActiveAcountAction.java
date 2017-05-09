package com.zhbit.user.action;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;

public class ActiveAcountAction extends ActionSupport{
	private UserService userService;
	public String active() throws Exception{
		HttpServletRequest request =ServletActionContext.getRequest();
		String signupEmail = request.getParameter("signupEmail");
		String validateCode = request.getParameter("validateCode");
		TEmailuser user = userService.findByEmail(signupEmail);
		if(user != null){
			if(user.getStatus() == 0){
				Date curDate = new Date();
				if(curDate.before(user.getLastActivateTime())){
					if(validateCode.equals(user.getValidateCode())){
						user.setStatus(1);
						userService.updateEmailUser(user);
					}else{
						throw new Exception("validate code is not correct!");  
					}
				}else{
					throw new Exception("validate code has been expired!");
				}
			}else{
				throw new Exception("email has been activated!");  
			}
		}else{
			throw new Exception("this email has not been registered!");  
		}
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
