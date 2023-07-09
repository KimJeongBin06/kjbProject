package com.spring.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.MemberVO;


@Repository
public class AdminDAOImpl implements AdminDAO {
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "member";

	@Override
	public List<MemberVO> memberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	


	
}
