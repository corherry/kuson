package com.zhbit.user.action;

import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;

import org.jboss.cache.StringFqn;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.util.SendEmail;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;
import com.zhbit.util.MD5Util;

public class EmailRegisterAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private TEmailuser user;
	@Resource
	private UserService userService;
	private String rePassword;
	public String register() throws Exception{
		TEmailuser emailuser = new TEmailuser(user.getUsername(), MD5Util.encode2hex(user.getPassword()), user.getEmail(), 0, MD5Util.encode2hex(user.getEmail()), new Timestamp((new Date()).getTime()));
		TEmailuser existingUser = userService.findByEmail(user.getEmail());
		if(existingUser != null){
			System.out.println("email is existing");
			return INPUT;
		}else{
			userService.addEmailUser(emailuser);
			StringBuffer content = new StringBuffer(emailuser.getEmail());
			content.append(",����:");
			content.append("<br/>");
			content.append("����������������(��������48Сʱ����Ч)��������ڿ�ɭ��װ�콢�����֤");
			content.append("<br/>");
			content.append("<br/>");
			content.append("<a href = \"http://localhost:8080/Kuson/user_active!active.action?signupEmail="); 
			content.append(emailuser.getEmail());
			content.append("&validateCode=");
			content.append(emailuser.getValidateCode());
			content.append("\">");
			content.append("http://localhost:8080/Kuson/user_active!active.action?signupEmail=");
			content.append(emailuser.getEmail());
			content.append("&validateCode=");
			content.append(emailuser.getValidateCode());
			content.append("</a>");
			content.append("<br/>");
			content.append("(��������޷�������븴����������������)");
			content.append("<br/>");
			content.append("���ʼ���ϵͳ�Զ�����������ظ�");
			content.append("<br/>");
	        SendEmail.send(emailuser.getEmail(), content.toString());
			return SUCCESS;
		}
	}
	public TEmailuser getUser() {
		return user;
	}
	public void setUser(TEmailuser user) {
		this.user = user;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
}
