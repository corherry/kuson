package com.zhbit.admin.entity;

/**
 * TAdminInfo entity. @author MyEclipse Persistence Tools
 */

public class TAdminInfo implements java.io.Serializable {

	// Fields

	private Integer adminId;
	private String adminName;
	private String adminAccount;
	private String adminPassword;
	private Integer adminAuthority;

	// Constructors

	/** default constructor */
	public TAdminInfo() {
	}

	/** full constructor */
	public TAdminInfo(Integer adminId, String adminName, String adminAccount, String adminPassword,
			Integer adminAuthority) {
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminAccount = adminAccount;
		this.adminPassword = adminPassword;
		this.adminAuthority = adminAuthority;
	}

	// Property accessors

	public Integer getAdminId() {
		return this.adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return this.adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminAccount() {
		return this.adminAccount;
	}

	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}

	public String getAdminPassword() {
		return this.adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public Integer getAdminAuthority() {
		return this.adminAuthority;
	}

	public void setAdminAuthority(Integer adminAuthority) {
		this.adminAuthority = adminAuthority;
	}

}