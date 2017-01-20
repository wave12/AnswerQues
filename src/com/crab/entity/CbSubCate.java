package com.crab.entity;

/**
 * CbSubCate entity. @author MyEclipse Persistence Tools
 */

public class CbSubCate implements java.io.Serializable {

	// Fields

	private String id;
	private String cateId;
	private String cateName;
	private Integer cateType;
	private String con;

	// Constructors

	/** default constructor */
	public CbSubCate() {
	}

	/** full constructor */
	public CbSubCate(String cateId, String cateName, Integer cateType, String con) {
		this.cateId = cateId;
		this.cateName = cateName;
		this.cateType = cateType;
		this.con = con;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCateId() {
		return this.cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return this.cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public Integer getCateType() {
		return this.cateType;
	}

	public void setCateType(Integer cateType) {
		this.cateType = cateType;
	}

	public String getCon() {
		return this.con;
	}

	public void setCon(String con) {
		this.con = con;
	}

}