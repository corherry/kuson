package com.zhbit.index.action;

import java.util.List;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.category.entity.TType;
import com.zhbit.category.service.CategoryService;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.goods.service.GoodsService;

public class IndexAction extends ActionSupport{
	@Resource
	private GoodsService goodsService;
	@Resource
	private CategoryService categoryService;
	public String execute() throws Exception{
		List<TGoods> goodsList = goodsService.findAllGoods();
		ActionContext.getContext().getSession().put("goodsList", goodsList);
		List<String> firstCategoryList = categoryService.findFirstType();
		ActionContext.getContext().getSession().put("firstCategoryList", firstCategoryList);
		List<TType> categoryList = categoryService.findAllCategory();
		ActionContext.getContext().getSession().put("categoryList", categoryList);
		return SUCCESS;
	}
}
