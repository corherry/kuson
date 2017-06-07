package com.zhbit.user.action;

import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;

public class ActiveAcountAction extends ActionSupport{
	@Resource
	private UserService userService;
	private String signupEmail;
	private String validateCode;
	public String active() throws Exception{
		TEmailuser user = userService.findByEmail(signupEmail);
		if(user != null){
			if(user.getStatus() == 0){
				Date curDate = new Date();
				if(curDate.before(user.getLastActivateTime())){
					if(validateCode.equals(user.getValidateCode())){
						user.setStatus(1);
						userService.updateEmailUser(user);
						ActionContext.getContext().getSession().put("user", user);
					}else{
						throw new Exception("validate code is not correct!");  
					}
				}else{
					userService.deleteUserById(user.getUserId());
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
	public String getSignupEmail() {
		return signupEmail;
	}
	public void setSignupEmail(String signupEmail) {
		this.signupEmail = signupEmail;
	}
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
}
