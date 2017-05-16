package com.zhbit.admin.action;

import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Else;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.zhbit.admin.entity.TAdminInfo;
import com.zhbit.admin.service.AdminService;
import com.zhbit.util.PageBean;

public class AdminAction extends ActionSupport implements Preparable {
	@Resource
	private AdminService adminService;
	private Integer pageIndex;
	private Integer adminAuthority;
	private Integer adminId;
	private TAdminInfo admin;
	private TAdminInfo adminInfo;
	private String rePassword;

	public String findAdminByAuthority() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		adminAuthority = Integer.parseInt(request.getParameter("adminAuthority"));
		PageBean<TAdminInfo> pageBean = adminService.findAdminByAuthority(pageIndex, adminAuthority);
		ActionContext.getContext().put("pageBean", pageBean);
		request.setAttribute("adminAuthority", adminAuthority);
		return "findAdmin";
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	// ɾ������Ա
	public String delete() throws Exception {
		adminService.deleteAdminById(adminId);
		return findAdminByAuthority();
	}

	public String update() throws Exception {
		adminService.update(adminInfo);
		return findAdminByAuthority();
	}

	// ��ӹ���Ա
	public String addAdmin() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String authority = request.getParameter("adminAuthority");
		adminAuthority = Integer.parseInt(authority);
		adminInfo.setAdminAuthority(adminAuthority);
		adminService.add(adminInfo);
		request.setAttribute("adminAuthority", adminAuthority);
		return findAdminByAuthority();
	}
	
	public void validateAddAdmin(){
		String regex = "^[0-9a-zA-Z]{5,12}";
		if(adminInfo.getAdminAccount() == ""){
			this.addFieldError("adminInfo.adminAccount", "����");
		}else if(adminInfo.getAdminAccount().length() < 5 || adminInfo.getAdminAccount().length() >12){
			this.addFieldError("adminInfo.adminAccount", "����Ա�˺ų���Ϊ5-12λ");		
		}else if(Pattern.matches(regex, adminInfo.getAdminAccount()) == false){
			this.addFieldError("adminInfo.adminAccount", "�˺�ֻ�ܰ�����ĸ������");
		}
		if(adminInfo.getAdminName().length() == 0){
			this.addFieldError("adminInfo.adminName", "����");
		}
		if(adminInfo.getAdminPassword() == null){
			this.addFieldError("adminInfo.adminPassword", "����");
		}else if(adminInfo.getAdminPassword().length() < 5 || adminInfo.getAdminPassword().length() > 12){
			this.addFieldError("adminInfo.adminPassword", "���볤�ȱ���Ϊ5~12λ");
		}else if(Pattern.matches(regex, adminInfo.getAdminPassword()) == false){
			this.addFieldError("adminInfo.adminPassword", "����ֻ�ܰ�����ĸ������");
		}
		if(rePassword == "" || rePassword == null){
			this.addFieldError("rePassword", "����");
		}else if(rePassword.equals(adminInfo.getAdminPassword()) == false){
			this.addFieldError("rePassword", "�����벻һ��");
		}
	}

	public void validateUpdate() {
		String regex = "^[0-9a-zA-Z]{5,12}";
		if (adminInfo.getAdminAccount() == null || adminInfo.getAdminAccount().length() == 0) {
			this.addFieldError("adminInfo.adminAccount", "����");
		}
		if (adminInfo.getAdminName() == null || adminInfo.getAdminName().length() == 0) {
			this.addFieldError("adminInfo.adminName", "����");
		}
		if (adminInfo.getAdminPassword() == null || adminInfo.getAdminPassword().length() == 0) {
			this.addFieldError("adminInfo.adminPassword", "����");
		} else if (adminInfo.getAdminPassword().length() < 5 || adminInfo.getAdminPassword().length() > 12) {
			this.addFieldError("adminInfo.adminPassword", "���볤�ȱ���Ϊ5~12λ");
		} else if (Pattern.matches(regex, adminInfo.getAdminPassword()) == false) {
			this.addFieldError("adminInfo.adminPassword", "����ֻ�ܰ�����ĸ������");
		}
	}

	public String findAdminById() throws Exception {
		TAdminInfo adminInfo = adminService.findByAdminId(adminId);
		ActionContext.getContext().getSession().put("adminInfo", adminInfo);
		return "find";
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void prepare() throws Exception {
		clearErrorsAndMessages();
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getAdminAuthority() {
		return adminAuthority;
	}

	public void setAdminAuthority(Integer adminAuthority) {
		this.adminAuthority = adminAuthority;
	}

	public TAdminInfo getAdmin() {
		return admin;
	}

	public TAdminInfo getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(TAdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}

	public void setAdmin(TAdminInfo admin) {
		this.admin = admin;
	}

}
