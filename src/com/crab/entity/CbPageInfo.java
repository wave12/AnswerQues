package com.crab.entity;

/**
 * CbPageInfo entity. @author MyEclipse Persistence Tools
 */

public class CbPageInfo implements java.io.Serializable {

	// Fields

	private String id;
	private String pageName;
	private String content;
	private String htmlName;
	private Integer cateId;
	private Integer orderId;

	// Constructors

	/** default constructor */
	public CbPageInfo() {
	}

	/** full constructor */
	public CbPageInfo(String pageName, String content, String htmlName, Integer cateId, Integer orderId) {
		this.pageName = pageName;
		this.content = content;
		this.htmlName = htmlName;
		this.cateId = cateId;
		this.orderId = orderId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPageName() {
		return this.pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHtmlName() {
		return this.htmlName;
	}

	public void setHtmlName(String htmlName) {
		this.htmlName = htmlName;
	}

	public Integer getCateId() {
		return this.cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

}