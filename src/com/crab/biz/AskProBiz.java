package com.crab.biz;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.lang.xwork.StringEscapeUtils;

import com.crab.dao.IAskProDAO;
import com.crab.dao.IUserInfoDAO;
import com.crab.entity.CbAnswer;
import com.crab.entity.CbCartDetail;
import com.crab.entity.CbQuestion;
import com.crab.entity.CbUser;
import com.crab.entity.Pager;

public class AskProBiz implements IAskProBiz {
	IAskProDAO  askProDAO;
	public void setAskProDAO(IAskProDAO askProDAO){
		this.askProDAO = askProDAO;
	}
	IUserInfoDAO userInfoDAO;
	public void setUserDAO(IUserInfoDAO userInfoDAO){
		this.userInfoDAO = userInfoDAO;
	}
	
	@Override
	public List<CbQuestion> getQuestionList(CbQuestion condition, int iPageNo, int iPageSize) {
		// TODO Auto-generated method stub
		List<CbQuestion> lstRet = new ArrayList<CbQuestion>();
		List<CbQuestion> lst = askProDAO.getQuestionList(condition, iPageNo, iPageSize);
		for (int i = 0; i < lst.size(); ++i) {
			CbQuestion obj = lst.get(i);
			String con = obj.getCon();
			String conRet = StringEscapeUtils.unescapeHtml(con);
			obj.setCon(conRet);
						
			lstRet.add(obj);
		}
		return lstRet;		
	} 

	@Override
	public Pager getQuestionPagerByCondition(CbQuestion condition, int iPageSize) {
		int count = askProDAO.getQuestionCountByCondition(condition);
		Pager pager = new Pager();
		pager.setPerPageRows(iPageSize);
		pager.setRowCount(count);
		return pager;
	}
	
	@Override
	public CbQuestion getQuestionInfoByID(String id) {
		CbQuestion obj = askProDAO.getQuestionInfoByID(id);
		String con = obj.getCon();
		String conRet = StringEscapeUtils.unescapeHtml(con);
		obj.setCon(conRet);
		
		Set setAnswerNew = new LinkedHashSet();
		Set setAnswer = obj.getCbAnswers();
		Iterator it = setAnswer.iterator();
		for(;it.hasNext();){
			CbAnswer e = (CbAnswer)it.next();
			String con2 = e.getCon();
			String conRet2 = StringEscapeUtils.unescapeHtml(con2);
			e.setCon(conRet2);
			
			setAnswerNew.add(e);
		}
		obj.setCbAnswers(setAnswerNew);
		
		return obj;
	}
	
	@Override
	public int AnswerQuestion(String userID, String questionID, String con) {
		CbAnswer obj = new CbAnswer();
		String rndID = UUID.randomUUID().toString();
		rndID = rndID.replace("-", "");
		obj.setId(rndID);
		CbUser user = new CbUser();
		user.setId(userID);
		obj.setCbUser(user);
		CbQuestion ques = new CbQuestion();
		ques.setId(questionID);
		obj.setCbQuestion(ques);
		String conRet = StringEscapeUtils.escapeHtml(con);
		obj.setCon(conRet);
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		obj.setDt(ts);
		
		int iRet = askProDAO.AnswerQuestion(obj);
		return iRet;
	}
	
	@Override
	public int MakeOneQestion(String userID, String questionTitle, float price, String con) {
		 
		String rndID = UUID.randomUUID().toString();
		rndID = rndID.replace("-", "");
		 
		CbQuestion ques = new CbQuestion();
		ques.setId(rndID); 
		CbUser user = new CbUser();
		user.setId(userID);
		ques.setCbUser(user);
		
		ques.setCateId(1);
		ques.setPrice(price);
		
		
		ques.setQuestionTitle(questionTitle);
		
		// 内容需要转义 
		String conRet = StringEscapeUtils.escapeHtml(con);
		ques.setCon(conRet);
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		ques.setDt(ts);
		
		int iRet = askProDAO.MakeOneQestion(ques);
		return iRet;
	}
	
	public Integer getQuestionCountByCondition(CbQuestion condition) {
		// TODO Auto-generated method stub
		return askProDAO.getQuestionCountByCondition(condition);
	}
	
	@Override
	public boolean PayQuestionMon(String id, float price) {
		float mon = userInfoDAO.GetMonById(id);
		if(mon >= -price) {
			//与数据库层交互更新id用户的mon值，字段Mon
			askProDAO.PayQuestionMon(id, mon+price);
			return true;
		}
		return false;
	}
	
	@Override
	public int PayQuestion(String userID, String cardID, String questionTitle, float price) {
		String productName = price + ":{" + questionTitle;
		if(productName.length() > 100) {
			productName = productName.substring(0, 98);
		}
		productName += "}";
		CbCartDetail cartDetail = new CbCartDetail();
		cartDetail.setCartId(cardID);
		cartDetail.setProductName(productName);
		cartDetail.setPrice(price);
		askProDAO.PayQuestion(cartDetail);
		return 0;
	}
	
}
