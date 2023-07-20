package com.spring.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.mapper.QuestionMapper;
import com.spring.shop.vo.QandAVO;
import com.spring.shop.vo.QuestionVO;
import com.spring.shop.vo.questionCriteria;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionMapper mapper;
	
	/*게시글 등록*/
	@Override
	public void enroll(QuestionVO question) {
		
		mapper.enroll(question);
	}
	/*목록*/
	@Override
	public List<QuestionVO> getList() {
		
		return mapper.getList();
	}
	
	/*목록 페이지*/
	@Override
	public List<QandAVO> getListPaging(questionCriteria cri) {
        return mapper.getListPaging(cri);
	}
	
	/*조회*/
	@Override
    public QuestionVO getPage(int qbno) {
         
        return mapper.getPage(qbno);        
        
    }    
	
	/* 수정 */
    @Override
    public int modify(QuestionVO question) {
        
        return mapper.modify(question);
    }

    /*게시판 삭제*/
    @Override
    public int delete(int qbno) {
        	
    	 return mapper.delete(qbno);
    }
       
     /* 게시물 총 개수 */
     @Override
     public int getTotal(questionCriteria cri) {
           
         return mapper.getTotal(cri);
    }    

}
