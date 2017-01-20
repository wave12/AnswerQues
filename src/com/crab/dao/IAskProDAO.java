package com.crab.dao;

 
import java.util.List;

import com.crab.entity.CbAnswer;
import com.crab.entity.CbQuestion;

public interface IAskProDAO {
	public List<CbQuestion> getQuestionList(CbQuestion condition, int iPageNo, int iPageSize);
	public Integer getQuestionCountByCondition(CbQuestion condition);
	public CbQuestion getQuestionInfoByID(String id);
	public Integer AnswerQuestion(CbAnswer answer);
	public Integer MakeOneQestion(CbQuestion ques);
}
