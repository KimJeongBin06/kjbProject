package com.spring.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.MemberVO;
import com.spring.shop.vo.OrderVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "member";
	
	
	@Override
	public List<MemberVO> memberList() {
		// TODO Auto-generated method stub
		return sql.selectList("member.memberList");
	}
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		sql.insert(namespace + ".insertMember", vo);

	}
	
	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".loginMember", vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update(namespace + ".memberUpdate", vo);
		
	}

	@Override
	public MemberVO memberList(String mid) {
		return sql.selectOne(namespace + ".memberView", mid);
	}
	
	//멤버삭제
	@Override
	public void memberDelete(String mid) {
		sql.delete(namespace + ".memberDelete", mid);
	}
	
	//주문정보 확인
	@Override
	public int ordersCount(String mid) {
		return sql.selectOne("product.orderscount", mid);
	}
	
	@Override
	public void ordersDelete(String mid) {
		sql.delete("product.ordersdelete", mid);
	}
	@Override
	public void detailDelete(List<OrderVO> orderlist) {
		for (OrderVO vo : orderlist) {
			sql.delete("product.detaildelete", vo);
		}
		
	}

	
	
	
	
		


	
	

}
