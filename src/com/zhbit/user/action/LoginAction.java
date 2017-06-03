package com.zhbit.user.action;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;

public class LoginAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private TEmailuser user;
	@Resource
	private UserService userService;
	public String login() throws Exception{
		TEmailuser emailuser = userService.checkEmailUser(user);
		System.out.println(user.getEmail());
		if(emailuser != null){
			this.setUser(emailuser);
			ActionContext.getContext().getSession().put("user", emailuser);
			return SUCCESS;
		}
		else {
			ActionContext.getContext().getSession().put("imfo", "” œ‰ªÚ’ﬂ√‹¬Î¥ÌŒÛ£¨«Î÷ÿ–¬µ«¬Ω");
			return LOGIN;
		}
	}
	
	public String logoff()throws Exception{
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
	public TEmailuser getUser() {
		return user;
	}

	public void setUser(TEmailuser user) {
		this.user = user;
	}
}
