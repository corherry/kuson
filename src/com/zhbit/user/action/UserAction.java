package com.zhbit.user.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;

public class UserAction extends ActionSupport{
	@Resource
	private UserService userService;
	private String username;
	public String updateName(){
		TEmailuser user = (TEmailuser)ActionContext.getContext().getSession().get("user");
		user.setUsername(username);
		userService.updateEmailUser(user);
		ActionContext.getContext().getSession().put("user", user);
		return "personal";
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
