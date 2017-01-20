package com.crab.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * CbUser entity. @author MyEclipse Persistence Tools
 */

public class CbUser implements java.io.Serializable {

	// Fields

	private String id;
	private String userName;
	private String nickName;
	private String realName;
	private String pass;
	private String orgId;
	private Timestamp dt;
	private String tel;
	private String mobile;
	private String email;
	private String onlineTool;
	private Integer question;
	private String answer;
	private Integer isAdmin;
	private Integer isOnline;
	private Integer topicNums;
	private String bbsheadIcon;
	private Integer status;
	private String acCode;
	private String myClass;
	private Set cbDocs = new HashSet(0);

	// Constructors

	/** default constructor */
	public CbUser() {
	}

	/** minimal constructor */
	public CbUser(String id) {
		this.id = id;
	}

	/** full constructor */
	public CbUser(String id, String userName, String nickName, String realName, String pass, String orgId, Timestamp dt,
			String tel, String mobile, String email, String onlineTool, Integer question, String answer,
			Integer isAdmin, Integer isOnline, Integer topicNums, String bbsheadIcon, Integer status, String acCode,
			String myClass, Set cbDocs) {
		this.id = id;
		this.userName = userName;
		this.nickName = nickName;
		this.realName = realName;
		this.pass = pass;
		this.orgId = orgId;
		this.dt = dt;
		this.tel = tel;
		this.mobile = mobile;
		this.email = email;
		this.onlineTool = onlineTool;
		this.question = question;
		this.answer = answer;
		this.isAdmin = isAdmin;
		this.isOnline = isOnline;
		this.topicNums = topicNums;
		this.bbsheadIcon = bbsheadIcon;
		this.status = status;
		this.acCode = acCode;
		this.myClass = myClass;
		this.cbDocs = cbDocs;
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

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getOrgId() {
		return this.orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public Timestamp getDt() {
		return this.dt;
	}

	public void setDt(Timestamp dt) {
		this.dt = dt;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOnlineTool() {
		return this.onlineTool;
	}

	public void setOnlineTool(String onlineTool) {
		this.onlineTool = onlineTool;
	}

	public Integer getQuestion() {
		return this.question;
	}

	public void setQuestion(Integer question) {
		this.question = question;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Integer getIsOnline() {
		return this.isOnline;
	}

	public void setIsOnline(Integer isOnline) {
		this.isOnline = isOnline;
	}

	public Integer getTopicNums() {
		return this.topicNums;
	}

	public void setTopicNums(Integer topicNums) {
		this.topicNums = topicNums;
	}

	public String getBbsheadIcon() {
		return this.bbsheadIcon;
	}

	public void setBbsheadIcon(String bbsheadIcon) {
		this.bbsheadIcon = bbsheadIcon;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getAcCode() {
		return this.acCode;
	}

	public void setAcCode(String acCode) {
		this.acCode = acCode;
	}

	public String getMyClass() {
		return this.myClass;
	}

	public void setMyClass(String myClass) {
		this.myClass = myClass;
	}

	public Set getCbDocs() {
		return this.cbDocs;
	}

	public void setCbDocs(Set cbDocs) {
		this.cbDocs = cbDocs;
	}

}