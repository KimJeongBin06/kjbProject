package com.spring.shop.service;

import java.util.List;

import com.spring.shop.vo.QuestionVO;
import com.spring.shop.vo.questionCriteria;

public interface QuestionService {
	
	/* 게시판 등록*/
    public void enroll(QuestionVO question);
    
    /* 게시판 목록 */
    public List<QuestionVO> getList();
    
    /* 게시판 목록(페이징) */
    public List<QuestionVO> getListPaging(questionCriteria qcri);
    
    /* 게시판 조회 */
    public QuestionVO getPage(int qbno);
    
    /* 게시판 수정 */
    public int modify(QuestionVO question);
    
    /*게시판 삭제*/
    public int delete(int qbno);
    
    /* 게시판 총 개수 */
    public int getTotal(questionCriteria cri);
    

}
