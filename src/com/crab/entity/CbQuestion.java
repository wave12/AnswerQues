package com.crab.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * CbQuestion entity. @author MyEclipse Persistence Tools
 */

public class CbQuestion implements java.io.Serializable {

	// Fields

	private String id;
	private CbUser cbUser;
	private String questionTitle;
	private Integer cateId;
	private Float price;
	private Integer keepMinutes;
	private Timestamp dt;
	private String con;
	private Integer hits;
	private Short isOver;
	private Set cbAnswers = new HashSet(0);

	// Constructors

	/** default constructor */
	public CbQuestion() {
	}

	/** minimal constructor */
	public CbQuestion(String id) {
		this.id = id;
	}

	/** full constructor */
	public CbQuestion(String id, CbUser cbUser, String questionTitle, Integer cateId, Float price, Integer keepMinutes,
			Timestamp dt, String con, Integer hits, Short isOver, Set cbAnswers) {
		this.id = id;
		this.cbUser = cbUser;
		this.questionTitle = questionTitle;
		this.cateId = cateId;
		this.price = price;
		this.keepMinutes = keepMinutes;
		this.dt = dt;
		this.con = con;
		this.hits = hits;
		this.isOver = isOver;
		this.cbAnswers = cbAnswers;
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

	public String getQuestionTitle() {
		return this.questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public Integer getCateId() {
		return this.cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getKeepMinutes() {
		return this.keepMinutes;
	}

	public void setKeepMinutes(Integer keepMinutes) {
		this.keepMinutes = keepMinutes;
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

	public Integer getHits() {
		return this.hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public Short getIsOver() {
		return this.isOver;
	}

	public void setIsOver(Short isOver) {
		this.isOver = isOver;
	}

	public Set getCbAnswers() {
		return this.cbAnswers;
	}

	public void setCbAnswers(Set cbAnswers) {
		this.cbAnswers = cbAnswers;
	}

}