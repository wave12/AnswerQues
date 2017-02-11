package com.crab.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.crab.entity.CbAnswer;
import com.crab.entity.CbCartDetail;
import com.crab.entity.CbDoc;
import com.crab.entity.CbQuestion;
import com.crab.entity.CbUser;

public class AskProDAO implements IAskProDAO {
	SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory){
	    this.sessionFactory = sessionFactory;
	}

	@Override
	public List<CbQuestion> getQuestionList(CbQuestion condition, int iPageNo, int iPageSize) {
	    // TODO Auto-generated method stub
	    Session se = sessionFactory.getCurrentSession();
	    Criteria c = se.createCriteria(CbQuestion.class);
	    if (condition != null) {
		    String title = condition.getQuestionTitle();
		    if (title != null ) {
		 	   c.add(Restrictions.like("questionTitle", title, MatchMode.ANYWHERE));
	    }	
	   
	    CbUser user = condition.getCbUser();
	    if (user != null) {
		    String uid = user.getId();
		    if (uid != null)
		 	   c.add(Restrictions.eq("cbUser.id", uid));
	    }
	   
	    Short isOver = condition.getIsOver();
	    if (isOver != null)
		   c.add(Restrictions.eq("isOver", isOver));
	    }
	   		   
		   
	    c.setFirstResult(iPageSize * (iPageNo - 1));
	    c.setMaxResults(iPageSize);
	    c.addOrder(Order.desc("dt"));
	    return c.list(); 
	 }

	 @Override
	 public Integer getQuestionCountByCondition(CbQuestion condition) {
	 	// TODO Auto-generated method stub
	    Session se = sessionFactory.getCurrentSession();
	    Criteria c = se.createCriteria(CbQuestion.class);
	    if (condition != null) {
		    String title = condition.getQuestionTitle();
		    if (title != null ) {
		 	   c.add(Restrictions.like("questionTitle", title));
	    }	
	   
	    CbUser user = condition.getCbUser();
	    if (user != null) {
		    String uid = user.getId();
		    if (uid != null)
		 	   c.add(Restrictions.eq("cbUser.id", uid));
	    }
	   
	    Short isOver = condition.getIsOver();
	    if (isOver != null)
		   c.add(Restrictions.eq("isOver", isOver));
	    }
	    
	    int iSize = c.list().size();	   
	    return iSize;
	 }
	 
	 @Override
	 public CbQuestion getQuestionInfoByID(String id) {
		 Session se = sessionFactory.getCurrentSession();	
		 CbQuestion questionInfo = (CbQuestion)se.get(CbQuestion.class, id);
			 
		 return questionInfo; 
	 }
	 
	 @Override
	 public Integer AnswerQuestion(CbAnswer answer) {
		Session se = sessionFactory.getCurrentSession();	
		int iRet = 1;
		try {
		    se.saveOrUpdate(answer);
		}
		catch (Exception e) {
			e.printStackTrace();
			iRet = 0;
		}
		return iRet;
	 }
	 
	 @Override
	 public Integer MakeOneQestion(CbQuestion ques) {
		Session se = sessionFactory.getCurrentSession();	
		int iRet = 1;
		try {
		    se.saveOrUpdate(ques);
		}
		catch (Exception e) {
			e.printStackTrace();
			iRet = 0;
		}
		return iRet;
	 }

	@Override
	public Integer PayQuestionMon(String id, float price) {
		Session se = sessionFactory.getCurrentSession();
		String sql = "update CbUser set mon='" + price + "' where id='" + id + "'" ;
		int iRet = 1;
		try {
			SQLQuery query = se.createSQLQuery(sql);
			iRet = query.executeUpdate();
		} catch (Exception e) {
			iRet = 0;
			e.printStackTrace();
		}
		return iRet;
	} 
	@Override
	public Integer PayQuestion(CbCartDetail cartDetail) {
		Session se = sessionFactory.getCurrentSession();
		int iRet = 1;
		try {
			se.saveOrUpdate(cartDetail);
		}catch(Exception e) {
			e.printStackTrace();
			iRet = 0;
		}
		return iRet;
	}
}
