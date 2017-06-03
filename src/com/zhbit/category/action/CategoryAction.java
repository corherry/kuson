package com.zhbit.category.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.category.entity.TType;
import com.zhbit.category.service.CategoryService;
import com.zhbit.goods.service.GoodsService;
import com.zhbit.util.PageBean;

public class CategoryAction extends ActionSupport{
	private String firstType;
	private Integer typeId;
	private Integer pageIndex;
	private String secondType;
	private TType typeInfo;
	@Resource
	private CategoryService categoryService;
	
	public String addFirstType() throws Exception{
		TType type = new TType();
		type.setTypeOne(firstType);
		categoryService.addFirstType(type);
		return showFirstCategory();
	}
	public String showFirstCategory() throws Exception{
		PageBean<String> pageBean = categoryService.showFirtType(pageIndex);
		ActionContext.getContext().put("pageBean", pageBean);
		return "showFirstType";
	}
	public String showindexFirstCategory() throws Exception{
		PageBean<String> pageBean = categoryService.showFirtType(pageIndex);
		ActionContext.getContext().getSession().put("pageBean", pageBean);
		return "showFirstType";
	}
	public String setFirstCategory() throws Exception{
		ActionContext.getContext().getSession().put("firstType", firstType);
		return "set";
	}
	public String setSecondCategory() throws Exception{
		TType type = categoryService.findByTypeId(typeId);
		ActionContext.getContext().getSession().put("category", type);
		return "setCategory";
	}
	public String deleteByFirstType() throws Exception{
		categoryService.deleteByFirstType(firstType);
		return showFirstCategory();
	}
	public String findByFirstType() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		firstType = request.getParameter("firstType");
		PageBean<TType> pageBean = categoryService.findByFirstType(pageIndex, firstType);
		ActionContext.getContext().put("pageBean", pageBean);
		request.setAttribute("firstType", firstType);
		return "showSecondType";
	}
	public String updateFirstCategory() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String type = (String) request.getSession().getAttribute("firstType");
		categoryService.updateByFirstType(firstType, type);
		return showFirstCategory();
	}
	public String delete() throws Exception{
		categoryService.delete(typeId);
		return findByFirstType();
	}
	public String add() throws Exception{
		TType type = new TType();
		type.setTypeOne(firstType);
		type.setTypeTwo(secondType);
		TType category = categoryService.add(type);
		return findByFirstType();
	}
	public String update() throws Exception{
		categoryService.update(typeInfo);
		return findByFirstType();
	}
	public String getFirstType() {
		return firstType;
	}
	public void setFirstType(String firstType) {
		this.firstType = firstType;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public String getSecondType() {
		return secondType;
	}
	public void setSecondType(String secondType) {
		this.secondType = secondType;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public TType getTypeInfo() {
		return typeInfo;
	}
	public void setTypeInfo(TType typeInfo) {
		this.typeInfo = typeInfo;
	}

}
