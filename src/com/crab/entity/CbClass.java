package com.crab.entity;

import java.sql.Timestamp;

/**
 * CbClass entity. @author MyEclipse Persistence Tools
 */

public class CbClass implements java.io.Serializable {

	// Fields

	private String classId;
	private CbUser cbUser;
	private String className;
	private String mainPic;
	private Integer starNums;
	private String classType;
	private String orgId;
	private String mainTeacher;
	private Integer price;
	private String priceNote;
	private Timestamp dtCreate;
	private String classPrimaryIntro;
	private String classCharacter;
	private String classOutline;
	private String classTeacherIntro;
	private String defineCateName1;
	private Integer defineCateVisible1;
	private String defineCateCon1;
	private String defineCateName2;
	private Integer defineCateVisible2;
	private String defineCateCon2;
	private String defineCateName3;
	private Integer defineCateVisible3;
	private String defineCateCon3;
	private Integer state;

	// Constructors

	/** default constructor */
	public CbClass() {
	}

	/** minimal constructor */
	public CbClass(String classId, String className, Integer starNums, String orgId, String mainTeacher, Integer price,
			String classPrimaryIntro, Integer defineCateVisible1, Integer defineCateVisible2,
			Integer defineCateVisible3) {
		this.classId = classId;
		this.className = className;
		this.starNums = starNums;
		this.orgId = orgId;
		this.mainTeacher = mainTeacher;
		this.price = price;
		this.classPrimaryIntro = classPrimaryIntro;
		this.defineCateVisible1 = defineCateVisible1;
		this.defineCateVisible2 = defineCateVisible2;
		this.defineCateVisible3 = defineCateVisible3;
	}

	/** full constructor */
	public CbClass(String classId, CbUser cbUser, String className, String mainPic, Integer starNums, String classType,
			String orgId, String mainTeacher, Integer price, String priceNote, Timestamp dtCreate,
			String classPrimaryIntro, String classCharacter, String classOutline, String classTeacherIntro,
			String defineCateName1, Integer defineCateVisible1, String defineCateCon1, String defineCateName2,
			Integer defineCateVisible2, String defineCateCon2, String defineCateName3, Integer defineCateVisible3,
			String defineCateCon3, Integer state) {
		this.classId = classId;
		this.cbUser = cbUser;
		this.className = className;
		this.mainPic = mainPic;
		this.starNums = starNums;
		this.classType = classType;
		this.orgId = orgId;
		this.mainTeacher = mainTeacher;
		this.price = price;
		this.priceNote = priceNote;
		this.dtCreate = dtCreate;
		this.classPrimaryIntro = classPrimaryIntro;
		this.classCharacter = classCharacter;
		this.classOutline = classOutline;
		this.classTeacherIntro = classTeacherIntro;
		this.defineCateName1 = defineCateName1;
		this.defineCateVisible1 = defineCateVisible1;
		this.defineCateCon1 = defineCateCon1;
		this.defineCateName2 = defineCateName2;
		this.defineCateVisible2 = defineCateVisible2;
		this.defineCateCon2 = defineCateCon2;
		this.defineCateName3 = defineCateName3;
		this.defineCateVisible3 = defineCateVisible3;
		this.defineCateCon3 = defineCateCon3;
		this.state = state;
	}

	// Property accessors

	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public CbUser getCbUser() {
		return this.cbUser;
	}

	public void setCbUser(CbUser cbUser) {
		this.cbUser = cbUser;
	}

	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMainPic() {
		return this.mainPic;
	}

	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}

	public Integer getStarNums() {
		return this.starNums;
	}

	public void setStarNums(Integer starNums) {
		this.starNums = starNums;
	}

	public String getClassType() {
		return this.classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getOrgId() {
		return this.orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	public String getMainTeacher() {
		return this.mainTeacher;
	}

	public void setMainTeacher(String mainTeacher) {
		this.mainTeacher = mainTeacher;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getPriceNote() {
		return this.priceNote;
	}

	public void setPriceNote(String priceNote) {
		this.priceNote = priceNote;
	}

	public Timestamp getDtCreate() {
		return this.dtCreate;
	}

	public void setDtCreate(Timestamp dtCreate) {
		this.dtCreate = dtCreate;
	}

	public String getClassPrimaryIntro() {
		return this.classPrimaryIntro;
	}

	public void setClassPrimaryIntro(String classPrimaryIntro) {
		this.classPrimaryIntro = classPrimaryIntro;
	}

	public String getClassCharacter() {
		return this.classCharacter;
	}

	public void setClassCharacter(String classCharacter) {
		this.classCharacter = classCharacter;
	}

	public String getClassOutline() {
		return this.classOutline;
	}

	public void setClassOutline(String classOutline) {
		this.classOutline = classOutline;
	}

	public String getClassTeacherIntro() {
		return this.classTeacherIntro;
	}

	public void setClassTeacherIntro(String classTeacherIntro) {
		this.classTeacherIntro = classTeacherIntro;
	}

	public String getDefineCateName1() {
		return this.defineCateName1;
	}

	public void setDefineCateName1(String defineCateName1) {
		this.defineCateName1 = defineCateName1;
	}

	public Integer getDefineCateVisible1() {
		return this.defineCateVisible1;
	}

	public void setDefineCateVisible1(Integer defineCateVisible1) {
		this.defineCateVisible1 = defineCateVisible1;
	}

	public String getDefineCateCon1() {
		return this.defineCateCon1;
	}

	public void setDefineCateCon1(String defineCateCon1) {
		this.defineCateCon1 = defineCateCon1;
	}

	public String getDefineCateName2() {
		return this.defineCateName2;
	}

	public void setDefineCateName2(String defineCateName2) {
		this.defineCateName2 = defineCateName2;
	}

	public Integer getDefineCateVisible2() {
		return this.defineCateVisible2;
	}

	public void setDefineCateVisible2(Integer defineCateVisible2) {
		this.defineCateVisible2 = defineCateVisible2;
	}

	public String getDefineCateCon2() {
		return this.defineCateCon2;
	}

	public void setDefineCateCon2(String defineCateCon2) {
		this.defineCateCon2 = defineCateCon2;
	}

	public String getDefineCateName3() {
		return this.defineCateName3;
	}

	public void setDefineCateName3(String defineCateName3) {
		this.defineCateName3 = defineCateName3;
	}

	public Integer getDefineCateVisible3() {
		return this.defineCateVisible3;
	}

	public void setDefineCateVisible3(Integer defineCateVisible3) {
		this.defineCateVisible3 = defineCateVisible3;
	}

	public String getDefineCateCon3() {
		return this.defineCateCon3;
	}

	public void setDefineCateCon3(String defineCateCon3) {
		this.defineCateCon3 = defineCateCon3;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}