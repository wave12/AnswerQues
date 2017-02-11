package com.crab.biz;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.crab.dao.IUserInfoDAO;
import com.crab.entity.CbCart;
import com.crab.entity.CbCartDetail;
import com.crab.entity.CbUser;

public class UserInfoBiz implements IUserInfoBiz {

	IUserInfoDAO  userInfoDAO;
	public void setUserInfoDAO(IUserInfoDAO userInfoDAO){
		this.userInfoDAO = userInfoDAO;
	}
	
	@Override
	public int UserRegister(CbUser user) {
		// TODO Auto-generated method stub
		int iRet = userInfoDAO.UserRegister(user);
		return iRet;
	}
	
	@Override
	public String UserExist(String userName) {
		String id = userInfoDAO.UserExist(userName);
		return id;
	}
	
	@Override
	public String UserLogin(String userName, String pass) {
		String userInfo = userInfoDAO.UserLogin(userName, pass);
		return userInfo;
	}
	
    @Override
    public CbCart GetCartInfoById(String id) {
    	CbCart cart = userInfoDAO.GetCartInfoById(id);
    	return cart;
    }
    
    @Override
    public List<CbCartDetail> GetCartDetailInfoByCartId(String cartId) {
    	List<CbCartDetail> lst = userInfoDAO.GetCartDetailInfoByCartId(cartId);
    	return lst;
    }

    @Override
    public boolean UpdateCartStatus(CbCart cart) {
    	boolean bRet = userInfoDAO.UpdateCartStatus(cart);
    	return bRet;
    }
    
    @Override
    public float GetMonById(String id) {
    	float mon = userInfoDAO.GetMonById(id);
    	return mon;
    }
}
