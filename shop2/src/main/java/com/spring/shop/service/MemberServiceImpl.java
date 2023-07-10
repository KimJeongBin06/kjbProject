package com.spring.shop.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.MemberDAO;
import com.spring.shop.vo.CartVO;
import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.OrderVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public List<MemberVO> memberList() {
		return memberDao.memberList();
	}
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		memberDao.insertMember(vo);

	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return memberDao.login(vo);
	}
	
	// 로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
		
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		memberDao.memberUpdate(vo);
		
	}

	@Override
	public MemberVO memberList(String mid) {
		return memberDao.memberList(mid);
	}
	
	//회원삭제
	@Override
	public void memberDelete(String mid) {
		memberDao.memberDelete(mid);
	}
	
	//주문정보 확인
	@Override
	public int ordersCount(String mid) {
		return memberDao.ordersCount(mid);
	}
	@Override
	public void ordersDelete(String mid) {
		memberDao.ordersDelete(mid);
	}
	@Override
	public void detailDelete(List<OrderVO> orderlist) {
		memberDao.detailDelete(orderlist);
	}
	
	//아이디 중복체크
	@Override
	public int idChk(MemberVO vo) {
		return memberDao.idChk(vo);
	}
	
	
}
	
	
	
	
	
	


