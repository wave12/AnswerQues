package com.crab.biz;

import java.util.List;

import com.crab.entity.CbQuestion;
import com.crab.entity.Pager;

public interface IAskProBiz {
	public List<CbQuestion> getQuestionList(CbQuestion condition, int iPageNo, int iPageSize);
	public Pager getQuestionPagerByCondition(CbQuestion condition, int iPageSize);
	public CbQuestion getQuestionInfoByID(String id);
	public int AnswerQuestion(String userID, String questionID, String con);
	public int MakeOneQestion(String userID, String questionTitle, float price, String con);
	//����
	public boolean PayQuestionMon(String id, float price); 
	public int PayQuestion(String userID, String cardID, String questionTitle, float price);
}
