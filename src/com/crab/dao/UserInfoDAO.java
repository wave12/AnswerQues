package com.crab.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.crab.entity.CbCart;
import com.crab.entity.CbCartDetail;
import com.crab.entity.CbDoc;
import com.crab.entity.CbUser;

public class UserInfoDAO implements IUserInfoDAO {

	SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory){
	    this.sessionFactory = sessionFactory;
    }
	 
	@Override
	public int UserRegister(CbUser user) {
		// TODO Auto-generated method stub
		Session se = sessionFactory.getCurrentSession();
		try {
			se.save(user);
			//se.saveOrUpdate(user);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override 
	public String UserExist(String userName) {
		String id = "";
		Session se = sessionFactory.getCurrentSession();	
		Criteria c = se.createCriteria(CbUser.class);
		c.add(Restrictions.eq("userName", userName));
		int iSize = c.list().size();
		if (iSize > 0)
			id = ((CbUser)c.list().get(0)).getId(); 
	    return id; 
	}
	
	@Override
	public String UserLogin(String userName, String pass) {
		String userInfo = "";
		Session se = sessionFactory.getCurrentSession();	
		Criteria c = se.createCriteria(CbUser.class);
		c.add(Restrictions.eq("userName", userName));
		c.add(Restrictions.eq("pass", pass));
		int iSize = c.list().size();
		if (iSize > 0)
		{
			String id = ((CbUser)c.list().get(0)).getId(); 
			String uName = ((CbUser)c.list().get(0)).getUserName();
			userInfo = id + "|" + uName;
		}
	    return userInfo; 
	}
	
	@Override
	public CbCart GetCartInfoById(String id) {
		Session se = sessionFactory.getCurrentSession();	
		Criteria c = se.createCriteria(CbCart.class);
		c.add(Restrictions.eq("id", id));
		 
		CbCart cart = (CbCart)(c.list().get(0));		 
	    return cart; 
	}
	
	@Override
	public List<CbCartDetail> GetCartDetailInfoByCartId(String cartId) {
		Session se = sessionFactory.getCurrentSession();	
		Criteria c = se.createCriteria(CbCartDetail.class);
		c.add(Restrictions.eq("cartId", cartId));
		 
		List<CbCartDetail> lst = (List<CbCartDetail>)c.list();		 
	    return lst; 
	}
	
	@Override 
	public boolean UpdateCartStatus(CbCart cart) {
		boolean bRet = false;
		Session se = sessionFactory.getCurrentSession();
		String sql = "update cbCart set Status =" + cart.getStatus();
		String alipayNo = cart.getAlipayNo();
		if (alipayNo != null && alipayNo != "") {
			sql += ", AlipayNo='" + alipayNo + "'";
		}
		
		Timestamp dtPay = cart.getDtPay();		
		if (dtPay != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss"); 
			String strDtPay = sdf.format(dtPay); 
			sql += ", DtPay='" + strDtPay + "'";
		}
		sql += " where ID ='" + cart.getId() + "'";
		
		try {
			int result = 0;
			SQLQuery query = se.createSQLQuery(sql);
			result = query.executeUpdate();  
			bRet = true;
		}
		catch (Exception e) {
			bRet = false;
		}
		
		return bRet;
	}

}
