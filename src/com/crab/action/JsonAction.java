package com.crab.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.crab.biz.IAskProBiz;
import com.crab.entity.CbDoc;
import com.crab.entity.CbProduct;
import com.crab.entity.CbSubCate;
import com.crab.entity.CbUser;
import com.opensymphony.xwork2.ActionSupport;

public class JsonAction extends ActionSupport
   implements ServletRequestAware, SessionAware{
	private HttpServletRequest request;
	private String result;
	
	
	IAskProBiz askProBiz;	 	 
	public void setAskProBiz(IAskProBiz askProBiz){
		this.askProBiz = askProBiz;
	}
	
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	public String AnswerQestion() {
		String strRet = "";
		try { 
			String userID = request.getParameter("userID");
			String questionID = request.getParameter("questionID");
			String con = request.getParameter("con");
					 			
			Integer iRet = askProBiz.AnswerQuestion(userID, questionID, con);	
			strRet = iRet.toString();
		}
		catch (Exception e) {
			e.printStackTrace();
			strRet = "0";
		}
		result = strRet;
		return SUCCESS;
	}
	
	public String MakeOneQestion() {
		String strRet = "";
		try { 
			String userID = request.getParameter("userID");
			String queTitle = request.getParameter("queTitle");
			String strPrice = request.getParameter("price");
			String con = request.getParameter("con");
			float price = Float.parseFloat(strPrice);
					 			
			Integer iRet = askProBiz.MakeOneQestion(userID, queTitle, price, con);	
			strRet = iRet.toString();
		}
		catch (Exception e) {
			e.printStackTrace();
			strRet = "0";
		}
		result = strRet;
		return SUCCESS;
	}
	
	
}
