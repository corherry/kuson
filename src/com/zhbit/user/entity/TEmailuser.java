package com.zhbit.user.entity;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.zhbit.goods.entity.TEvaluation;
import com.zhbit.order.entity.TOrder;

/**
 * TEmailuser entity. @author MyEclipse Persistence Tools
 */

public class TEmailuser implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String username;
	private String password;
	private String email;
	private Integer status;
	private String validateCode;
	private Timestamp signupTime;
	private Double money;
	private Set<TAddress> TAddresses = new HashSet<TAddress>();
	private Set<TEvaluation> TEvaluations = new HashSet<TEvaluation>();
	private Set<TOrder> TOrders = new HashSet<TOrder>();

	// Constructors

	/** default constructor */
	public TEmailuser() {
	}

	/** minimal constructor */
	public TEmailuser(Integer userId, String username, String password, String email, Integer status,
			String validateCode, Timestamp signupTime) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.status = status;
		this.validateCode = validateCode;
		this.signupTime = signupTime;
	}

	/** full constructor */
	public TEmailuser(Integer userId, String username, String password, String email, Integer status,
			String validateCode, Timestamp signupTime, Double money, Set TAddresses, Set TEvaluations, Set TOrders) {
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.email = email;
		this.status = status;
		this.validateCode = validateCode;
		this.signupTime = signupTime;
		this.money = money;
		this.TAddresses = TAddresses;
		this.TEvaluations = TEvaluations;
		this.TOrders = TOrders;
	}
	public TEmailuser(String username, String password, String email, Integer status,
			String validateCode, Timestamp signupTime) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.status = status;
		this.validateCode = validateCode;
		this.signupTime = signupTime;
	}
	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getValidateCode() {
		return this.validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public Timestamp getSignupTime() {
		return this.signupTime;
	}

	public void setSignupTime(Timestamp signupTime) {
		this.signupTime = signupTime;
	}

	public Double getMoney() {
		return this.money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

	public Set getTAddresses() {
		return this.TAddresses;
	}

	public void setTAddresses(Set TAddresses) {
		this.TAddresses = TAddresses;
	}

	public Set getTEvaluations() {
		return this.TEvaluations;
	}

	public void setTEvaluations(Set TEvaluations) {
		this.TEvaluations = TEvaluations;
	}

	public Set getTOrders() {
		return this.TOrders;
	}

	public void setTOrders(Set TOrders) {
		this.TOrders = TOrders;
	}
	public Date getLastActivateTime() {
        Calendar cl = Calendar.getInstance();
        cl.setTime(signupTime);
        cl.add(Calendar.DATE , 2);

        return cl.getTime();
    }

}
