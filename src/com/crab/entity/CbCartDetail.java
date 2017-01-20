package com.crab.entity;

/**
 * CbCartDetail entity. @author MyEclipse Persistence Tools
 */

public class CbCartDetail implements java.io.Serializable {

	// Fields

	private String id;
	private String cartId;
	private String productName;
	private Float price;
	private Integer nums;

	// Constructors

	/** default constructor */
	public CbCartDetail() {
	}

	/** minimal constructor */
	public CbCartDetail(String id) {
		this.id = id;
	}

	/** full constructor */
	public CbCartDetail(String id, String cartId, String productName, Float price, Integer nums) {
		this.id = id;
		this.cartId = cartId;
		this.productName = productName;
		this.price = price;
		this.nums = nums;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCartId() {
		return this.cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getNums() {
		return this.nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

}