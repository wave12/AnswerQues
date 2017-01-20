package com.crab.entity;

import java.sql.Timestamp;

/**
 * CbCart entity. @author MyEclipse Persistence Tools
 */

public class CbCart implements java.io.Serializable {

	// Fields

	private String id;
	private Integer cartType;
	private Float price;
	private Timestamp dt;
	private String sendType;
	private String userId;
	private String address;
	private Integer status;
	private String alipayNo;
	private Timestamp dtPay;

	// Constructors

	/** default constructor */
	public CbCart() {
	}

	/** minimal constructor */
	public CbCart(String id) {
		this.id = id;
	}

	/** full constructor */
	public CbCart(String id, Integer cartType, Float price, Timestamp dt, String sendType, String userId,
			String address, Integer status, String alipayNo, Timestamp dtPay) {
		this.id = id;
		this.cartType = cartType;
		this.price = price;
		this.dt = dt;
		this.sendType = sendType;
		this.userId = userId;
		this.address = address;
		this.status = status;
		this.alipayNo = alipayNo;
		this.dtPay = dtPay;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getCartType() {
		return this.cartType;
	}

	public void setCartType(Integer cartType) {
		this.cartType = cartType;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Timestamp getDt() {
		return this.dt;
	}

	public void setDt(Timestamp dt) {
		this.dt = dt;
	}

	public String getSendType() {
		return this.sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAlipayNo() {
		return this.alipayNo;
	}

	public void setAlipayNo(String alipayNo) {
		this.alipayNo = alipayNo;
	}

	public Timestamp getDtPay() {
		return this.dtPay;
	}

	public void setDtPay(Timestamp dtPay) {
		this.dtPay = dtPay;
	}

}