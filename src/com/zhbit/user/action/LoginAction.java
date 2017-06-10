package com.zhbit.user.action;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;
import com.zhbit.util.MD5Util;

public class LoginAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private TEmailuser user;
	@Resource
	private UserService userService;
	public String login() throws Exception{
		TEmailuser emailuser = userService.findByEmail(user.getEmail());
		if(emailuser != null){
			if(emailuser.getStatus() == 1){
				user.setPassword(MD5Util.encode2hex(user.getPassword()));
				System.out.println(MD5Util.encode2hex(user.getPassword()));
				emailuser = userService.checkEmailUser(user);
				if(emailuser != null){
					this.setUser(emailuser);
					ActionContext.getContext().getSession().put("user", emailuser);
					return SUCCESS;
				}else{
					this.addFieldError("user.email", "’À∫≈/√‹¬Î¥ÌŒÛ!");
					return LOGIN;
				}
			}else{
				this.addFieldError("user.email", "” œ‰…–Œ¥º§ªÓ!");
				return LOGIN;
			}
		}
		else {
			this.addFieldError("user.email", "’À∫≈≤ª¥Ê‘⁄!");
			return LOGIN;
		}
	}
	
	public String logout()throws Exception{
		ActionContext.getContext().getSession().remove("user");
		return SUCCESS;
	}
	public TEmailuser getUser() {
		return user;
	}

	public void setUser(TEmailuser user) {
		this.user = user;
	}
}
