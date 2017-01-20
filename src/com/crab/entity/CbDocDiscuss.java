package com.crab.entity;

import java.sql.Timestamp;

/**
 * CbDocDiscuss entity. @author MyEclipse Persistence Tools
 */

public class CbDocDiscuss implements java.io.Serializable {

	// Fields

	private Integer id;
	private String topicId;
	private Integer userId;
	private String con;
	private Timestamp dt;

	// Constructors

	/** default constructor */
	public CbDocDiscuss() {
	}

	/** minimal constructor */
	public CbDocDiscuss(String con) {
		this.con = con;
	}

	/** full constructor */
	public CbDocDiscuss(String topicId, Integer userId, String con, Timestamp dt) {
		this.topicId = topicId;
		this.userId = userId;
		this.con = con;
		this.dt = dt;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTopicId() {
		return this.topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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

}