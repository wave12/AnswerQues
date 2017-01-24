package com.crab.action;

import java.io.UnsupportedEncodingException;
import org.apache.commons.logging.Log;     
import org.apache.commons.logging.LogFactory; 

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
 
import com.crab.biz.IUserInfoBiz;
import com.crab.entity.CbCart;
import com.crab.entity.CbCartDetail;
import com.crab.entity.CbUser;
import com.crab.param.NorConst;
import com.crab.param.NorConst.CART_TYPE;
import com.opensymphony.xwork2.ActionSupport;
 

public class UserInfoAction    extends ActionSupport
	implements RequestAware, SessionAware {
	
	Log log = LogFactory.getLog("CrabLog");  
	 
	String userName;
	String pass;
	String id;
	public void setUserName(String userName) {
		this.userName = userName;
	} 
	public String getUserName(){
		return userName;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getPass(){
		return pass;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId(){
		return id;
	}
 	
	CbUser userInfo;   // ��װ������(��ѯ������
	public CbUser getUserInfo(){
		return userInfo;
	}
	
	public void setUserInfo(CbUser userInfo){
		this.userInfo = userInfo;
	}
	
	IUserInfoBiz userInfoBiz;	 
	public IUserInfoBiz getUserInfoBiz(){
		return this.userInfoBiz;
	}
	public void setUserInfoBiz(IUserInfoBiz userInfoBiz){
		this.userInfoBiz = userInfoBiz;
	}
	
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
	
	public String reg() {
		// �ж��û����Ƿ����
		String uid = userInfoBiz.UserExist(userName);
		if (uid != "")
		{
			request.put("userName", userName);
			request.put("pass", pass);
			request.put("err", "�û����Ѿ�����,�������<script>doKeydown('userName');</script>");
			return "err";
		}
		
		CbUser objUser = new CbUser();
		UUID uuid = UUID.randomUUID();  
	    String id = uuid.toString();   
	    id = id.replace("-", "");
		objUser.setId(id);
		Date date = new Date();   
		Timestamp nowdate = new Timestamp(date.getTime());
		objUser.setDt(nowdate);
		objUser.setUserName(userName);
		objUser.setPass(pass);
		objUser.setNickName("");
		objUser.setRealName("");
		objUser.setAnswer(""); 
		objUser.setOrgId("");
		objUser.setTel("");
		objUser.setMobile("");
		objUser.setEmail("");
		objUser.setOnlineTool("");
		objUser.setQuestion(0);
		objUser.setIsAdmin(0);
		objUser.setIsOnline(0);
		objUser.setTopicNums(0);
		objUser.setBbsheadIcon("");
		objUser.setAcCode("");
		objUser.setMyClass("");
		objUser.setStatus(0); 
		int iRet = userInfoBiz.UserRegister(objUser);
		
		session.put("admin", id + "|" + userName);
		
		return "suc";
	}
	
	public String index() {
		//request.put("userName", "�ֻ�������");
		//request.put("pass", "��½����");
		return "suc";
	}
	
	public String paycart() {
		CbCart cart = userInfoBiz.GetCartInfoById(id);
		if (cart.getCartType() == CART_TYPE.ONLINE_CLASS.getValue()
				|| cart.getCartType() == CART_TYPE.DOC.getValue() ) {
			List<CbCartDetail> lst = userInfoBiz.GetCartDetailInfoByCartId(id);
			if (lst != null) {
				CbCartDetail det = lst.get(0);
				request.put("cartDetail", det);
			}
		}
		request.put("cart", cart);
		return "suc";
	}
	
	public String login() {		 			
		// �õ��û���ID���û���
		String userInfo = userInfoBiz.UserLogin(userName, pass);
		if (userInfo != "")
		{
			log.info(userName + "��½�ɹ�!");
			session.put("admin", userInfo);
			return	"suc";			
		}
						 
		request.put("userName", userName);
		request.put("pass", pass);
		request.put("err", "<script>ShowLoginErr();</script>");
		return "err";
	}
	
	
}
