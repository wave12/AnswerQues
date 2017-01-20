package com.crab.entity;

import java.sql.Timestamp;

/**
 * CbDoc entity. @author MyEclipse Persistence Tools
 */

public class CbDoc implements java.io.Serializable {

	// Fields

	private String id;
	private CbUser cbUser;
	private String docTitle;
	private Integer docType;
	private Integer price;
	private String comeFrom;
	private String author;
	private Integer isTuijian;
	private Integer click;
	private Integer discussNums;
	private Timestamp dt;
	private String con;
	private String primaryCon;
	private String videoUrl;
	private Integer status;

	// Constructors

	/** default constructor */
	public CbDoc() {
	}

	/** minimal constructor */
	public CbDoc(String id, CbUser cbUser, String docTitle, Integer docType, Integer isTuijian) {
		this.id = id;
		this.cbUser = cbUser;
		this.docTitle = docTitle;
		this.docType = docType;
		this.isTuijian = isTuijian;
	}

	/** full constructor */
	public CbDoc(String id, CbUser cbUser, String docTitle, Integer docType, Integer price, String comeFrom,
			String author, Integer isTuijian, Integer click, Integer discussNums, Timestamp dt, String con,
			String primaryCon, String videoUrl, Integer status) {
		this.id = id;
		this.cbUser = cbUser;
		this.docTitle = docTitle;
		this.docType = docType;
		this.price = price;
		this.comeFrom = comeFrom;
		this.author = author;
		this.isTuijian = isTuijian;
		this.click = click;
		this.discussNums = discussNums;
		this.dt = dt;
		this.con = con;
		this.primaryCon = primaryCon;
		this.videoUrl = videoUrl;
		this.status = status;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public CbUser getCbUser() {
		return this.cbUser;
	}

	public void setCbUser(CbUser cbUser) {
		this.cbUser = cbUser;
	}

	public String getDocTitle() {
		return this.docTitle;
	}

	public void setDocTitle(String docTitle) {
		this.docTitle = docTitle;
	}

	public Integer getDocType() {
		return this.docType;
	}

	public void setDocType(Integer docType) {
		this.docType = docType;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getComeFrom() {
		return this.comeFrom;
	}

	public void setComeFrom(String comeFrom) {
		this.comeFrom = comeFrom;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getIsTuijian() {
		return this.isTuijian;
	}

	public void setIsTuijian(Integer isTuijian) {
		this.isTuijian = isTuijian;
	}

	public Integer getClick() {
		return this.click;
	}

	public void setClick(Integer click) {
		this.click = click;
	}

	public Integer getDiscussNums() {
		return this.discussNums;
	}

	public void setDiscussNums(Integer discussNums) {
		this.discussNums = discussNums;
	}

	public Timestamp getDt() {
		return this.dt;
	}

	public void setDt(Timestamp dt) {
		this.dt = dt;
	}

	public String getCon() {
		return this.con;
	}

	public void setCon(String con) {
		this.con = con;
	}

	public String getPrimaryCon() {
		return this.primaryCon;
	}

	public void setPrimaryCon(String primaryCon) {
		this.primaryCon = primaryCon;
	}

	public String getVideoUrl() {
		return this.videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}