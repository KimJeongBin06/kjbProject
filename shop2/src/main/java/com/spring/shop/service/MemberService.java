package com.spring.shop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.shop.vo.CartVO;
import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.OrderVO;

public interface MemberService {
	
	// 회원 목록 
	public List<MemberVO> memberList();
	
	// 회원가입
	public void insertMember(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 로그아웃
	public void logout(HttpSession session) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public MemberVO memberList(String mid);
	
	//회원삭제
	public void memberDelete(String mid);
	
	//주문정보 확인
	public int ordersCount(String mid);
	
	public void ordersDelete(String mid);
	
	public void detailDelete(List<OrderVO> orderlist);
	
	//아이디 중복체크
	public int idChk(MemberVO vo);
}
