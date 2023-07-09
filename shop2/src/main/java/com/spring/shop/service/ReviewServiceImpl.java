package com.spring.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.ReviewDAO;
import com.spring.shop.vo.ReviewVO;
import com.spring.shop.vo.RevreplyVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO reviewDao;
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return reviewDao.countArticle(searchOption, keyword);
	}

	@Override
	public List<ReviewVO> listAll(int start, int end, String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return reviewDao.listAll(start, end, searchOption, keyword);
	}
	@Override
	public ReviewVO reviewView(int revnum) {
		return reviewDao.reviewView(revnum);
	}
	@Override
	public void reviewInsert(ReviewVO vo) {
		reviewDao.reviewInsert(vo);
	}
	@Override
	public void reviewDelete(int revnum) {
		reviewDao.reviewDelete(revnum);
	}
	@Override
	public ReviewVO reviewUpdateForm(int revnum) {
		return reviewDao.reviewUpdateForm(revnum);
	}
	@Override
	public void reviewUpdate(ReviewVO vo) {
		reviewDao.reviewUpdate(vo);
	}
	@Override
	public void revreplyInsert(RevreplyVO vo) {
		reviewDao.revreplyInsert(vo);
	}
	@Override
	public List<RevreplyVO> revreplyList(int revnum){
		return reviewDao.revreplyList(revnum);
	}
	@Override
	public void ratingAvg(int pdnu) {
		reviewDao.ratingAvg(pdnu);
	}


}
