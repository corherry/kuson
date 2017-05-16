package com.zhbit.goods.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhbit.goods.entity.TGoods;
import com.zhbit.category.entity.TType;
import com.zhbit.goods.service.GoodsService;

public class GoodsAction extends ActionSupport {
	private static final int BUFFER_SIZE = 10*10;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private TGoods goods;
	private TType type;
	@Resource
	private GoodsService goodsService;
	private List<TGoods> goodsList;
	
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
		HttpServletRequest request= ServletActionContext.getRequest();
		goodsList = goodsService.queryAllGoods();
		request.setAttribute("goodsList", goodsList);
		return SUCCESS;
	}
	public String addGoods() throws Exception{
		String path = ServletActionContext.getServletContext().getRealPath(this.getSavePath()) + "\\" + this.getUploadFileName();
		goods.setGoodsPicUrl(this.uploadFileName);
		File target = new File(path);
		copy(this.upload, target);
		goodsService.add(goods);
		return execute();
	}
	public List<TGoods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<TGoods> goodsList) {
		this.goodsList = goodsList;
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
}
