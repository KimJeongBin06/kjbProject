package com.spring.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.ReviewVO;
import com.spring.shop.vo.RevreplyVO;
@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int countArticle(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("review.countArticle", map);
	}

	@Override
	public List<ReviewVO> listAll(int start, int end, String searchOption, String keyword) {
		//2개의 변수를 batis에 전달하기 위해서 map 사용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList("review.listAll", map);
	}
	@Override
	public ReviewVO reviewView(int revnum) {
		return sqlSession.selectOne("review.reviewView", revnum);
	}
	@Override
	public void reviewInsert(ReviewVO vo) {
		sqlSession.insert("review.reviewInsert", vo);
	}
	@Override
	public void reviewDelete(int revnum) {
		sqlSession.delete("review.reviewDelete", revnum);
	}
	@Override
	public ReviewVO reviewUpdateForm(int revnum) {
		return sqlSession.selectOne("review.reviewUpdateForm", revnum);
	}
	@Override
	public void reviewUpdate(ReviewVO vo) {
		sqlSession.update("review.reviewUpdate", vo);
	}
	@Override
	public void revreplyInsert(RevreplyVO vo) {
		sqlSession.insert("review.revreplyInsert", vo);
	}
	@Override
	public List<RevreplyVO> revreplyList(int revnum){
		return sqlSession.selectList("review.revreplyList", revnum);
	}
	@Override
	public void ratingAvg(int pdnu) {
		sqlSession.update("review.ratingAvg", pdnu);
	}


}
