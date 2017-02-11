package com.crab.dao;

import java.util.List;

import com.crab.entity.CbCart;
import com.crab.entity.CbCartDetail;
import com.crab.entity.CbUser;

public interface IUserInfoDAO {
    public int UserRegister(CbUser user);
    public String UserExist(String userName);
    public String UserLogin(String userName, String pass);
    public CbCart GetCartInfoById(String id);
    public List<CbCartDetail> GetCartDetailInfoByCartId(String cartId);
    public boolean UpdateCartStatus(CbCart cart);
    public float GetMonById(String id);
}
