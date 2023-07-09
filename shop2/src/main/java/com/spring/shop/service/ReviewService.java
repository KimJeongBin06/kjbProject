package com.spring.shop.service;

import java.util.List;


import com.spring.shop.vo.ReviewVO;
import com.spring.shop.vo.RevreplyVO;


public interface ReviewService {
	public int countArticle(String searchOption, String keyword);
	public List<ReviewVO> listAll(int start, int end, String searchOption, String keyword);
	public ReviewVO reviewView(int revnum);
	public void reviewInsert(ReviewVO vo);
	public void reviewDelete(int revnum);
	public ReviewVO reviewUpdateForm(int revnum);
	public void reviewUpdate(ReviewVO vo);
	public void revreplyInsert(RevreplyVO vo);
	public List<RevreplyVO> revreplyList(int revnum);
	public void ratingAvg(int pdnu);

}
