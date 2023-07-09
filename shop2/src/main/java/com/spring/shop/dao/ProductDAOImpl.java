package com.spring.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.shop.vo.CartListVO;
import com.spring.shop.vo.CartVO;
import com.spring.shop.vo.OrderDetailVO;
import com.spring.shop.vo.OrderListVO;
import com.spring.shop.vo.OrderVO;
import com.spring.shop.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public void productInsert(ProductVO vo) {
		sqlSession.insert("product.productInsert", vo);

	}
	@Override
	public List<ProductVO> productList() {
		return sqlSession.selectList("product.productList");
	}
	@Override
	public void productDelete(int pdnu) {
		sqlSession.delete("product.productDelete", pdnu);
	}
	@Override
	public ProductVO productItem(int pdnu) {
		return sqlSession.selectOne("product.productItem", pdnu);
	}
	@Override
	public void productUpdate(ProductVO vo) {
		sqlSession.update("product.productUpdate", vo);
	}
	@Override
	public List<ProductVO> listAll(int start, int end, String searchOption, String keyword) {
		//2개의 변수를 batis에 전달하기 위해서 map 사용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList("product.listAll", map);
	}
	@Override
	public int countArticle(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("product.countArticle", map);
	}
	@Override
	public int countCate(String searchOption, String keyword, int catecode, List<Integer> pdtypes, List<Integer> pdshapes) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("catecode", catecode);
		map.put("pdtypes", pdtypes);
		map.put("pdshapes", pdshapes);
		return sqlSession.selectOne("product.countCate", map);
	}
	@Override
	public List<ProductVO> productCate(int catecode) {
		return sqlSession.selectList("product.list", catecode);
	}
	@Override
	public List<ProductVO> productNew() {
		return sqlSession.selectList("product.new");
	}
	@Override
	public List<ProductVO> productBest() {
		return sqlSession.selectList("product.best");
	}
	public List<ProductVO> listCate(int start, int end, String searchOption, String keyword, int catecode, List<Integer> pdtypes, List<Integer> pdshapes) {
		//2개의 변수를 batis에 전달하기 위해서 map 사용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("catecode", catecode);

		map.put("pdtypes", pdtypes);
		map.put("pdshapes", pdshapes);

		return sqlSession.selectList("product.listCate", map);
	}

	
	//카트 담기
	@Override
	public void addCart(CartListVO vo) {
		sqlSession.insert("product.insertCart", vo);
		
	}
	//카트 리스트
	@Override
	public List<CartListVO> cartList(String mid) throws Exception {
		
		return sqlSession.selectList("product.cartList", mid);
	}
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sqlSession.delete("product.deleteCart", cart);
		
	}
	// 카트 비우기
	@Override
	public void cartAllDelete(String mid) throws Exception {
		sqlSession.delete("product.cartAllDelete", mid);
		
	}
	// 주문 정보
		@Override
		public void orderInfo(OrderVO order) throws Exception {
			sqlSession.insert("product.orderInfo", order);
		}
		
		// 주문 상세 정보
		@Override
		public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
			sqlSession.insert("product.orderInfo_Details", orderDetail);
		}
		
		// 주문 목록
		@Override
		public List<OrderVO> orderList(OrderVO order) throws Exception {
			return sqlSession.selectList("product.orderList", order);
		}

		// 특정 주문 목록
		@Override
		public List<OrderListVO> orderView(OrderVO order) throws Exception {
			return sqlSession.selectList("product.orderView", order);
		}
		@Override
		public void deleteCartPd(int pdnu) {
			sqlSession.delete("product.deletecartpd", pdnu);
		}
		@Override
		public int countCart(int pdnu) {
			return sqlSession.selectOne("product.countCart", pdnu);
		}
	@Override
	public List<ProductVO> searchpd(String mid) {
		return sqlSession.selectList("product.searchpd", mid);
	}
	@Override
	public void soldCnt(List<OrderDetailVO> soldcnt) {
		for (OrderDetailVO sold : soldcnt) {
	        sqlSession.update("product.soldcnt", sold);
	    }
	}
	
	@Override
	public List<OrderDetailVO> soldSearch(String orderId) {
		return sqlSession.selectList("product.soldsearch", orderId);
	}
	
}
