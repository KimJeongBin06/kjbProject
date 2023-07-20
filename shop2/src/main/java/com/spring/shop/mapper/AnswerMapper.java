package com.spring.shop.mapper;

import com.spring.shop.vo.AnswerVO;


public interface AnswerMapper {
	

	public void answerWrite(AnswerVO answer);
	
	public AnswerVO getPage(int abno);
	
	/* 게시판 수정 */
    public int modify(AnswerVO answer);
    
    public int delete(int abno);
}
