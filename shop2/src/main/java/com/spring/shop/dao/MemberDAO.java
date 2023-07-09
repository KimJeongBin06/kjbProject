package com.spring.shop.dao;

import java.util.List;

import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.OrderVO;

public interface MemberDAO {
	public List<MemberVO> memberList();
	
	//회원가입
	public void insertMember(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	
	public void memberUpdate(MemberVO vo)throws Exception;
	
	
	public MemberVO memberList(String mid);
	
	//멤버삭제
	public void memberDelete(String mid);
	
	//주문정보 확인
	public int ordersCount(String mid);
	
	public void ordersDelete(String mid);
	
	public void detailDelete(List<OrderVO> orderlist);
}
