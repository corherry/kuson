package com.zhbit.user.action;

import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.UserService;
import com.zhbit.util.PageBean;

public class ShowUserAction extends ActionSupport implements Preparable {
	private TEmailuser user;
	private Integer pageIndex;
	private Integer userId;
	private String email;
	
	@Resource
	private UserService userService;
	
	//��ҳ��ʾ�û���Ϣ
	public String findUser() throws Exception {
		PageBean<TEmailuser> pageBean = userService.findUserInfo(pageIndex);
		ActionContext.getContext().put("pageBean", pageBean);
		return "findUser";
	}
	
	//���û�Idɾ�����û�
	public String delete() throws Exception{
		userService.deleteUserById(userId);
		return findUser();
	}
	
	//��Id���Ҹ��û�
	public String findUserById() throws Exception {
		System.out.print(userId);
		TEmailuser emailuser = userService.findByUserId(userId);
		System.out.print(emailuser.getUserId());
		System.out.print(emailuser.getEmail());
		ActionContext.getContext().getSession().put("emailuser", emailuser);
		return "find";
	}
	
	//��Email�����û�
	public String findUserByEmail() throws Exception{
		TEmailuser emailuser = userService.findByEmail(email);
		ActionContext.getContext().getSession().put("emailuser", emailuser);
		return "find";
	}
	
	//�޸��û���Ϣ
	public String update() throws Exception {
		userService.updateEmailUser(user);
		return findUser();
	}
	
	public void validateUpdate() {
		String regex = "^[0-9a-zA-Z]{5,12}";
		if (user.getUsername() == null || user.getUsername().length() == 0) {
			this.addFieldError("user.username", "����");
		}
		if (user.getPassword() == null || user.getPassword().length() == 0) {
			this.addFieldError("user.password", "����");
		} else if (user.getPassword().length() < 5 || user.getPassword().length() > 12) {
			this.addFieldError("user.password", "���볤�ȱ���Ϊ5~12λ");
		} else if (Pattern.matches(regex, user.getPassword()) == false) {
			this.addFieldError("user.password", "����ֻ�ܰ�����ĸ������");
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

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
