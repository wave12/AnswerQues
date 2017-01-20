package com.crab.entity;

/**
 * CbAdmUser entity. @author MyEclipse Persistence Tools
 */
public class CbAdmUser extends AbstractCbAdmUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public CbAdmUser() {
	}

	/** full constructor */
	public CbAdmUser(String userName, String passD) {
		super(userName, passD);
	}

}
