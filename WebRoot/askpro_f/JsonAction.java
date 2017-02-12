package com.crab.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.crab.biz.IAskProBiz;
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
	
	public String PayQuestion() {
		String strRet = "";
		try {
			String Info = request.getParameter("payInfos");
			String[] payInfo = Info.split("\\||;");
			String userID    = payInfo[0];
			String questionTitle = payInfo[1];
			float payMon = Float.parseFloat(payInfo[2]);
			//提问者余额足以支付
			if(askProBiz.PayQuestionMon(userID, -payMon)) {
				for (int i=3; i<payInfo.length; i+=2) {
					//payInfo[i]为ID，payInfo[i+1]为报酬
					//生成订单明细表
					askProBiz.PayQuestion(userID, payInfo[i], questionTitle, Float.parseFloat(payInfo[i+1]));
					//回答者余额增加
					askProBiz.PayQuestionMon(payInfo[i], Float.parseFloat(payInfo[i+1]));
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			strRet = "0";
		}
		result = strRet;
		return SUCCESS;
	}
	
}
