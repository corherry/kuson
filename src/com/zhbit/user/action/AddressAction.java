package com.zhbit.user.action;

import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.user.entity.TAddress;
import com.zhbit.user.entity.TEmailuser;
import com.zhbit.user.service.AddressService;
import com.zhbit.user.service.UserService;
import com.zhbit.util.PageBean;

public class AddressAction extends ActionSupport{

	@Resource
	private UserService userService;
	@Resource
	private AddressService addressService;
	private String receiver;
	private String phone;
	private String address;
	private TEmailuser user;
	private Integer addressId;
	private Integer pageIndex;
	private TAddress addressInfo;
	private Integer op;

	public String addAddress() throws Exception{
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		TAddress taddress = new TAddress();
		taddress.setReceiver(receiver);
		taddress.setPhone(phone);
		taddress.setAddress(address);
		taddress.setUser(emailuser);
		addressService.addAddress(taddress);
		if(op == 1){
			return queryByUserId();
		}else{
			return showAddress();
		}
	}
	public String queryByUserId() throws Exception{
		TEmailuser user = (TEmailuser) ActionContext.getContext().getSession().get("user");
		List<TAddress> addressList = addressService.queryByUserId(user.getUserId());
		ActionContext.getContext().getSession().put("addressList", addressList);
		return "showUserAddress";
	}
	public String deleteAddress() throws Exception{
		TAddress address = addressService.findByAddressId(addressId);
		addressService.delete(address);
		return showAddress();
	}
	public String showAddress() throws Exception{
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		PageBean<TAddress> pageBean = addressService.findAddressByUserId(pageIndex, emailuser.getUserId());
		ActionContext.getContext().getSession().put("pageBean", pageBean);
		return SUCCESS;
	}
	public String update() throws Exception{
		TEmailuser emailuser = (TEmailuser) ActionContext.getContext().getSession().get("user");
		addressInfo.setUser(emailuser);
		addressService.update(addressInfo);
		return showAddress();
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
	public TEmailuser getUser() {
		return user;
	}
	public void setUser(TEmailuser user) {
		this.user = user;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public TAddress getAddressInfo() {
		return addressInfo;
	}
	public void setAddressInfo(TAddress addressInfo) {
		this.addressInfo = addressInfo;
	}
	public Integer getOp() {
		return op;
	}
	public void setOp(Integer op) {
		this.op = op;
	}
	
}
