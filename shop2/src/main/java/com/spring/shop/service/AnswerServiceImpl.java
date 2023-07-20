package com.spring.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.mapper.AnswerMapper;
import com.spring.shop.vo.AnswerVO;
import com.spring.shop.vo.QuestionVO;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerMapper mapper;
	
	@Override
	public void answerWrite(AnswerVO answer) {
		// TODO Auto-generated method stub
		mapper.answerWrite(answer);
	}
	
	@Override
    public AnswerVO getPage(int abno) {
         
        return mapper.getPage(abno);        
        
    }   
	
	/* 수정 */
    @Override
    public int modify(AnswerVO answer) {
        
        return mapper.modify(answer);
    }
    
    /*게시판 삭제*/
    @Override
    public int delete(int abno) {
        	
    	 return mapper.delete(abno);
    }

}
