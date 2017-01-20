package com.crab.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.crab.biz.IAskProBiz;
import com.crab.entity.CbQuestion;
import com.crab.entity.Pager;
import com.opensymphony.xwork2.ActionSupport;

public class AskProAction  extends ActionSupport
		implements RequestAware, SessionAware{
	Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	String  id;    
	public String getId(){
		return id;
	}	
	public void setId(String id){
		this.id = id;
	}
	
	String  titleKey;    
	public String getTitleKey(){
		return titleKey;
	}	
	public void setTitleKey(String titleKey){
		this.titleKey = titleKey;
	}
	
	CbQuestion question;   // 封装表单参数(查询条件）
	public CbQuestion getQuestion(){
		return question;
	}
	
	public void setQuestion(CbQuestion question){
		this.question = question;
	}
	
	private Pager pager;
	public Pager getPager() {
		return this.pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	IAskProBiz askProBiz;	 
	public IAskProBiz getAskProBiz(){
		return this.askProBiz;
	}
	public void setAskProBiz(IAskProBiz askProBiz){
		this.askProBiz = askProBiz;
	}
	
	public String index() throws Exception {
		int iPageSize = 20;
		int iPageNo = 1;
		if (pager != null)
			iPageNo = pager.getCurPage();
		
		List InfoList = null;
		if (titleKey != null)
		{
		    question = new CbQuestion();
			question.setQuestionTitle(titleKey);
		}
		 
		InfoList = askProBiz.getQuestionList(question, iPageNo, iPageSize);	
		pager = askProBiz.getQuestionPagerByCondition(question, iPageSize);					
		pager.setCurPage(iPageNo);
		
		request.put("titleKey", titleKey);
		request.put("askProList", InfoList);
		
		return "suc";
	}	
	
	public String detail() {
		CbQuestion ques = askProBiz.getQuestionInfoByID(id);
		Set setAnswer = ques.getCbAnswers();
		request.put("questionInfo", ques);		
		request.put("anwserInfo", setAnswer);
		return "suc";
	}
	
	public String close() {
		CbQuestion ques = askProBiz.getQuestionInfoByID(id);
		Set setAnswer = ques.getCbAnswers();
		request.put("questionInfo", ques);		
		request.put("anwserInfo", setAnswer);
		return "suc";
	}
	
	
}
