package com.spring.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.spring.shop.vo.MemberVO;

public interface AdminDAO {
	public List<MemberVO> memberList() throws Exception;
	
	
	
	
	
}
