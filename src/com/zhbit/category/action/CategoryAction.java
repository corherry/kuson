package com.zhbit.category.action;

import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.zhbit.category.entity.TType;
import com.zhbit.category.service.CategoryService;
import com.zhbit.goods.service.GoodsService;
import com.zhbit.util.PageBean;

public class CategoryAction extends ActionSupport implements Preparable{
	private String firstType;
	private Integer typeId;
	private Integer pageIndex;
	private String secondType;
	private TType typeInfo;
	@Resource
	private CategoryService categoryService;
	
	public String addFirstType() throws Exception{
		if(firstType.length() == 0){
			this.addFieldError("firstType", "必填");
			return "input1";
		}else if(categoryService.checkFirstType(firstType) != null){
			this.addFieldError("firstType", "该一级分类已存在");
			return "input1";
		}
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
		if(firstType.length() == 0){
			this.addFieldError("firstType", "必填");
			return "input2";
		}else if(firstType.equals(type) == false && categoryService.checkFirstType(firstType) != null){
			this.addFieldError("firstType", "该一级分类已存在");
			return "input2";
		}
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
		if(secondType.length() == 0){
			this.addFieldError("secondType", "必填");
			return "input3";
		}
		TType category = categoryService.add(type);
		if(category == null){
			this.addFieldError("firstType", "该分类已存在，请重新输入");
			return "input3";
		}
		return findByFirstType();
	}
	public String update() throws Exception{
		TType type = (TType)ActionContext.getContext().getSession().get("category");
		if(typeInfo.getTypeTwo().length() == 0){
			this.addFieldError("typeInfo.typeTwo", "请输入二级分类");
			return "input4";
		}else if(type.getTypeTwo().equals(typeInfo.getTypeTwo()) == true){
			return findByFirstType();
		}
		TType category = categoryService.update(typeInfo);
		if(category == null){
			this.addFieldError("typeInfo.typeOne", "该分类已存在，请重新输入");
			return "input4";
		}
		return findByFirstType();
	}
	
	public void validateAddFirstType(){
		if(firstType == ""){
			this.addFieldError("firstType", "必填");
		}
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
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		clearErrorsAndMessages();
	}
	

}
