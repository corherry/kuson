package com.zhbit.goods.entity;

import java.sql.Timestamp;
import com.zhbit.user.entity.TEmailuser;
/**
 * TEvaluation entity. @author MyEclipse Persistence Tools
 */

public class TEvaluation implements java.io.Serializable {

	// Fields

	private Integer evaluationId;
	private String evaluateContent;
	private Integer status;
	private Timestamp evaluateTime;
	private TEmailuser TEmailuser;
	private TGoods TGoods;

	// Constructors

	/** default constructor */
	public TEvaluation() {
	}

	/** minimal constructor */
	public TEvaluation(Integer evaluationId, TEmailuser TEmailuser, TGoods TGoods, Integer status,
			Timestamp evaluateTime) {
		this.evaluationId = evaluationId;
		this.TEmailuser = TEmailuser;
		this.TGoods = TGoods;
		this.status = status;
		this.evaluateTime = evaluateTime;
	}

	/** full constructor */
	public TEvaluation(Integer evaluationId, TEmailuser TEmailuser, TGoods TGoods, String evaluateContent,
			Integer status, Timestamp evaluateTime) {
		this.evaluationId = evaluationId;
		this.TEmailuser = TEmailuser;
		this.TGoods = TGoods;
		this.evaluateContent = evaluateContent;
		this.status = status;
		this.evaluateTime = evaluateTime;
	}

	// Property accessors

	public Integer getEvaluationId() {
		return this.evaluationId;
	}

	public void setEvaluationId(Integer evaluationId) {
		this.evaluationId = evaluationId;
	}

	public TEmailuser getTEmailuser() {
		return this.TEmailuser;
	}

	public void setTEmailuser(TEmailuser TEmailuser) {
		this.TEmailuser = TEmailuser;
	}

	public TGoods getTGoods() {
		return this.TGoods;
	}

	public void setTGoods(TGoods TGoods) {
		this.TGoods = TGoods;
	}

	public String getEvaluateContent() {
		return this.evaluateContent;
	}

	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getEvaluateTime() {
		return this.evaluateTime;
	}

	public void setEvaluateTime(Timestamp evaluateTime) {
		this.evaluateTime = evaluateTime;
	}

}