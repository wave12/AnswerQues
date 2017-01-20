package com.crab.entity;

/**
 * CbProduct entity. @author MyEclipse Persistence Tools
 */

public class CbProduct implements java.io.Serializable {

	// Fields

	private Integer id;
	private String productName;
	private String productDescribe;
	private String content;
	private Integer hits;
	private String pic;

	// Constructors

	/** default constructor */
	public CbProduct() {
	}

	/** full constructor */
	public CbProduct(String productName, String productDescribe, String content, Integer hits, String pic) {
		this.productName = productName;
		this.productDescribe = productDescribe;
		this.content = content;
		this.hits = hits;
		this.pic = pic;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescribe() {
		return this.productDescribe;
	}

	public void setProductDescribe(String productDescribe) {
		this.productDescribe = productDescribe;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getHits() {
		return this.hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}