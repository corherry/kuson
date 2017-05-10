package com.zhbit.goods.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.goods.entity.TType;
import com.zhbit.goods.service.GoodsService;

public class ClassifyAction extends ActionSupport {
	private GoodsService goodsService;
	public String classify() throws Exception{
		return SUCCESS;
	}
	public String deleteFirstType() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String type = request.getParameter("type");
		goodsService.deleteFirstClassification(type);
		return "delete";
	}
	public String deleteSecondType() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String type = request.getParameter("type");
		String secondType = request.getParameter("secondType");
		goodsService.deleteSecondClassification(type, secondType);
		return "deleteTwo";
	}
	public GoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
}
