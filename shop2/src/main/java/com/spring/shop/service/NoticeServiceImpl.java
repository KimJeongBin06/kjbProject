package com.spring.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.mapper.NoticeMapper;
import com.spring.shop.vo.NoticeVO;
import com.spring.shop.vo.noticeCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {

		@Autowired
		private NoticeMapper mapper;
		
		/*게시판 등록*/
		@Override
		public void enroll(NoticeVO notice) {
			
			mapper.enroll(notice);
		}
		
		/* 게시판 목록*/
		@Override
	    public List<NoticeVO> getList() {
	        
	        return mapper.getList();
	    }
		
		/* 게시판 목록(페이징) */
	    @Override
	    public List<NoticeVO> getListPaging(noticeCriteria cri) {
	        
	        return mapper.getListPaging(cri);
	    }    
		
		/* 게시판 조회 */
	    @Override
	    public NoticeVO getPage(int nbno) {
	         
	        return mapper.getPage(nbno);        
	        
	    }    
	    
	    /* 게시판 수정 */
	    @Override
	    public int modify(NoticeVO notice) {
	        
	        return mapper.modify(notice);
	    }  
	    
	    /*게시판 삭제*/
	    @Override
	    public int delete(int nbno) {
	        	
	    	 return mapper.delete(nbno);
	    }
	       
	     /* 게시물 총 개수 */
	     @Override
	     public int getTotal(noticeCriteria cri) {
	           
	         return mapper.getTotal(cri);
	    }    
	    
}

