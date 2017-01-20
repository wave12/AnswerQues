package com.crab.entity;

import java.sql.Timestamp;

/**
 * CbAnswer entity. @author MyEclipse Persistence Tools
 */

public class CbAnswer implements java.io.Serializable {

	// Fields

	private String id;
	private CbUser cbUser;
	private CbQuestion cbQuestion;
	private String con;
	private Timestamp dt;
	private Float reward;

	// Constructors

	/** default constructor */
	public CbAnswer() {
	}

	/** minimal constructor */
	public CbAnswer(String id) {
		this.id = id;
	}

	/** full constructor */
	public CbAnswer(String id, CbUser cbUser, CbQuestion cbQuestion, String con, Timestamp dt, Float reward) {
		this.id = id;
		this.cbUser = cbUser;
		this.cbQuestion = cbQuestion;
		this.con = con;
		this.dt = dt;
		this.reward = reward;
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

	public CbQuestion getCbQuestion() {
		return this.cbQuestion;
	}

	public void setCbQuestion(CbQuestion cbQuestion) {
		this.cbQuestion = cbQuestion;
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

	public Float getReward() {
		return this.reward;
	}

	public void setReward(Float reward) {
		this.reward = reward;
	}

}