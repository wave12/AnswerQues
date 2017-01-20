package com.crab.entity;

/**
 * CbSucCateRecord entity. @author MyEclipse Persistence Tools
 */

public class CbSucCateRecord implements java.io.Serializable {

	// Fields

	private String id;
	private String subCateId;
	private String con;

	// Constructors

	/** default constructor */
	public CbSucCateRecord() {
	}

	/** full constructor */
	public CbSucCateRecord(String subCateId, String con) {
		this.subCateId = subCateId;
		this.con = con;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubCateId() {
		return this.subCateId;
	}

	public void setSubCateId(String subCateId) {
		this.subCateId = subCateId;
	}

	public String getCon() {
		return this.con;
	}

	public void setCon(String con) {
		this.con = con;
	}

}