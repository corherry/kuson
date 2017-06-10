package com.zhbit.goods.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.jboss.cache.StringFqn;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.zhbit.goods.entity.Category;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.category.entity.TType;
import com.zhbit.goods.service.GoodsService;
import com.zhbit.util.PageBean;

public class GoodsAction extends ActionSupport implements Preparable{
	private static final int BUFFER_SIZE = 10*10;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private TGoods goods;
	private TType type;
	private Integer pageIndex;
	private Integer goodsId;
	private String firstCategory;
	private String category;
	private Integer typeId;
	private String goodsNo;
	private String search;
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	@Resource
	private GoodsService goodsService;
	
	private static void copy(File source, File target){
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try{
			inputStream = new BufferedInputStream(new FileInputStream(source), BUFFER_SIZE);
			outputStream = new BufferedOutputStream(new FileOutputStream(target), BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int length = 0;
			while((length = inputStream.read(buffer)) > 0){
				outputStream.write(buffer, 0, length);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(inputStream != null){
				try{
					inputStream.close();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(outputStream != null){
				try{
					outputStream.close();
				}catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}
	public String execute() throws Exception{
		PageBean<TGoods> pageBean = goodsService.queryAllGoods(pageIndex);
		ActionContext.getContext().put("pageBean", pageBean);
		return SUCCESS;
	}
	public String addGoods() throws Exception{
		if(upload == null){
			goods.setGoodsPicUrl("nopicture.png");
		}else{
			String path = ServletActionContext.getServletContext().getRealPath(this.getSavePath()) + "\\" + this.getUploadFileName();
			goods.setGoodsPicUrl(this.uploadFileName);
			File target = new File(path);
			copy(this.upload, target);
		}
		type = goodsService.findTypeBytid(typeId);
		goods.setTType(type);
		goodsService.add(goods);
		return execute();
	}
	public void validateAddGoods() {
		String regex = "[0-9a-zA-Z]{1,}";
		if (goods.getGoodsNo() == null || goods.getGoodsNo().length() == 0) {
			this.addFieldError("goods.goodsNo", "必填");
		}else if(!goods.getGoodsNo().matches(regex)){
			this.addFieldError("goods.goodsNo", "商品编号只能包含数字和字母");
		}
		if (goods.getGoodsTitle() == null || goods.getGoodsTitle().length() == 0) {
			this.addFieldError("goods.goodsTitle", "必填");
		}
		if(goods.getGoodsPrice() == null){
			this.addFieldError("goods.goodsPrice", "必填");
		}
		if(goods.getGoodsSize() == null || goods.getGoodsSize().length() == 0){
			this.addFieldError("goods.goodsSize", "必填");
		}
		if(goods.getGoodsColor() == null || goods.getGoodsColor().length() == 0){
			this.addFieldError("goods.goodsColor", "必填");
		}
	}
	
	public String findGoodsByTypeId() throws Exception{
		List<TGoods> goodsList = goodsService.findByTypeId(typeId);
		ActionContext.getContext().getSession().put("goodsList", goodsList);
		return "showByCaterory";
	}
	public String getGoodsInfor() throws Exception{
		goods = goodsService.findByGoodsId(goodsId);
		ActionContext.getContext().getSession().put("goods", goods);
		List<Category> categoryList = goodsService.categoryInfo();
		ActionContext.getContext().put("categoryList", categoryList);
		return "goodsInfor";
	}
	public String updateGoods() throws Exception{
		if(upload != null){
			String path = goods.getGoodsPicUrl();
			File file = new File(ServletActionContext.getServletContext().getRealPath("/" + path));
			file.delete();
			String realPath = ServletActionContext.getServletContext().getRealPath(this.getSavePath()) + "\\" + this.getUploadFileName();
			File target = new File(realPath);
			copy(this.upload, target);
			goods.setGoodsPicUrl(this.uploadFileName);
		}else{
			goods.setGoodsPicUrl(goods.getGoodsPicUrl());
		}
		type = goodsService.findTypeBytid(typeId);
		goods.setTType(type);
		goodsService.update(goods);
		return execute();
	}
	public void validateUpdateGoods() {
		String regex = "[0-9a-zA-Z]{1,}";
		if (goods.getGoodsNo() == null || goods.getGoodsNo().length() == 0) {
			this.addFieldError("goods.goodsNo", "必填");
		}else if(!goods.getGoodsNo().matches(regex)){
			this.addFieldError("goods.goodsNo", "商品编号只能包含数字和字母");
		}
		if (goods.getGoodsTitle() == null || goods.getGoodsTitle().length() == 0) {
			this.addFieldError("goods.goodsTitle", "必填");
		}
		if(goods.getGoodsPrice() == null){
			this.addFieldError("goods.goodsPrice", "必填");
		}
		if(goods.getGoodsSize() == null || goods.getGoodsSize().length() == 0){
			this.addFieldError("goods.goodsSize", "必填");
		}
		if(goods.getGoodsColor() == null || goods.getGoodsColor().length() == 0){
			this.addFieldError("goods.goodsColor", "必填");
		}
	}
	
	
	public String delete() throws Exception{
		goods = goodsService.findByGoodsId(goodsId);
		goodsService.delete(goods);
		return execute();
	}
	public String findByFirstCategory() throws Exception{
		List<TGoods> goodsList = goodsService.findByFirstCategory(firstCategory);
		ActionContext.getContext().getSession().put("goodsList", goodsList);
		return "firstCategory";
	}
	
	public String findByTypeId() throws Exception{
		type = goodsService.findByType(type);
		List<TGoods> goodsList = goodsService.findByTypeId(type.getTypeId());
		ActionContext.getContext().getSession().put("goodsList", goodsList);
		return "secondCategory";
	}
	
	public String findByGoodsId() throws Exception{
		TGoods product = goodsService.findByGoodsId(goodsId);
		ActionContext.getContext().put("product", product);
		return "product";
	}
	public String findGoodsInfo() throws Exception{
		TGoods productInfo = goodsService.findByGoodsId(goodsId);
		ActionContext.getContext().getSession().put("productInfo", productInfo);
		return "productInfo";
	}
	public String categoryInfo() throws Exception{
		List<Category> categoryList = goodsService.categoryInfo();
		ActionContext.getContext().getSession().put("categoryList", categoryList);
		return "category";
	}
	public String queryBySearch() throws Exception{
		List<TGoods> goodsList = goodsService.queryBySearch(search);
		ActionContext.getContext().getSession().put("goodsList", goodsList);
		return "search";
	}
	public void prepare() throws Exception {
		clearErrorsAndMessages();
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public TType getType() {
		return type;
	}
	public void setType(TType type) {
		this.type = type;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public TGoods getGoods() {
		return goods;
	}
	public void setGoods(TGoods goods) {
		this.goods = goods;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getFirstCategory() {
		return firstCategory;
	}
	public void setFirstCategory(String firstCategory) {
		this.firstCategory = firstCategory;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
