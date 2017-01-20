package com.crab.entity;

/**
 * AbstractCbAdmUser entity provides the base persistence definition of the
 * CbAdmUser entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCbAdmUser implements java.io.Serializable {

	// Fields

	private String id;
	private String userName;
	private String passD;

	// Constructors

	/** default constructor */
	public AbstractCbAdmUser() {
	}

	/** full constructor */
	public AbstractCbAdmUser(String userName, String passD) {
		this.userName = userName;
		this.passD = passD;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassD() {
		return this.passD;
	}

	public void setPassD(String passD) {
		this.passD = passD;
	}

}