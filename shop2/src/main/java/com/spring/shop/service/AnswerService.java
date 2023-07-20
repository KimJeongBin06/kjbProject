package com.spring.shop.service;

import com.spring.shop.vo.AnswerVO;

public interface AnswerService {
	public void answerWrite(AnswerVO answer);
	
	public AnswerVO getPage(int abno);
	
	public int modify(AnswerVO answer);
	
	public int delete(int abno);
}
