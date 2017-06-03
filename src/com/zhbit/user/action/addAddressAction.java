package com.zhbit.user.action;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.user.entity.TAddress;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.AddressService;
import com.zhbit.user.service.UserService;

public class addAddressAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource
	private UserService userService;
	@Resource
	private AddressService addressService;
	private String receiver;
	private String phone;
	private String address;
	private String postcode;
	private TEmailuser user;
	@SuppressWarnings("unchecked")
	public String addAddress() throws Exception{
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		TAddress taddress = new TAddress();
		taddress.setReceiver(receiver);
		taddress.setPhone(phone);
		taddress.setAddress(address);
		taddress.setPostcode(postcode);
		taddress.setTEmailuser(emailuser);
		addressService.add(taddress);
		ActionContext.getContext().getSession().put("user", emailuser);
		ActionContext.getContext().getSession().put("info", "ÐÞ¸Ä³É¹¦");
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public TEmailuser getUser() {
		return user;
	}
	public void setUser(TEmailuser user) {
		this.user = user;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String deleteAddress() throws Exception{
		return SUCCESS;
	}
	public String showAddress() throws Exception{
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		return SUCCESS;
	}
}
