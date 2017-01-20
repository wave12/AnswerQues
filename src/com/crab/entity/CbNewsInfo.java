package com.crab.entity;

import java.sql.Timestamp;

/**
 * CbNewsInfo entity. @author MyEclipse Persistence Tools
 */

public class CbNewsInfo implements java.io.Serializable {

	// Fields

	private String id;
	private String newsTitle;
	private String note;
	private String author;
	private String comeFrom;
	private Integer hits;
	private String con;
	private Timestamp dt;
	private Integer cateId;

	// Constructors

	/** default constructor */
	public CbNewsInfo() {
	}

	/** minimal constructor */
	public CbNewsInfo(String id) {
		this.id = id;
	}

	/** full constructor */
	public CbNewsInfo(String id, String newsTitle, String note, String author, String comeFrom, Integer hits,
			String con, Timestamp dt, Integer cateId) {
		this.id = id;
		this.newsTitle = newsTitle;
		this.note = note;
		this.author = author;
		this.comeFrom = comeFrom;
		this.hits = hits;
		this.con = con;
		this.dt = dt;
		this.cateId = cateId;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNewsTitle() {
		return this.newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getComeFrom() {
		return this.comeFrom;
	}

	public void setComeFrom(String comeFrom) {
		this.comeFrom = comeFrom;
	}

	public Integer getHits() {
		return this.hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public String getCon() {
		return this.con;
	}

	public void setCon(String con) {
		this.con = con;
	}

	public Timestamp getDt() {
		return this.dt;
	}

	public void setDt(Timestamp dt) {
		this.dt = dt;
	}

	public Integer getCateId() {
		return this.cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

}