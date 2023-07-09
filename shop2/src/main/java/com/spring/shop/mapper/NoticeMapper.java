package com.spring.shop.mapper;

import java.util.List;

import com.spring.shop.vo.noticeCriteria;
import com.spring.shop.vo.NoticeVO;

public interface NoticeMapper {
	
	/* 게시판 등록*/
    public void enroll(NoticeVO notice);
    
    /* 게시판 목록 */
    public List<NoticeVO> getList();
    
    /* 게시판 목록(페이징) */
    public List<NoticeVO> getListPaging(noticeCriteria cri);
    
    /* 게시판 조회 */
    public NoticeVO getPage(int nbno);
    
    /* 게시판 수정 */
    public int modify(NoticeVO notice);
    
    /*게시판 삭제*/
    public int delete(int nbno);
    
    /* 게시판 총 개수 */
    public int getTotal(noticeCriteria cri);
    
}
