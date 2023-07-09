package com.spring.shop.dao;

import java.util.List;

import com.spring.shop.vo.CartListVO;
import com.spring.shop.vo.CartVO;
import com.spring.shop.vo.OrderDetailVO;
import com.spring.shop.vo.OrderListVO;
import com.spring.shop.vo.OrderVO;
import com.spring.shop.vo.ProductVO;

public interface ProductDAO {
	public void productInsert(ProductVO vo);
	public List<ProductVO> productList();
	public void productDelete(int pdnu);
	public ProductVO productItem(int pdnu);
	public void productUpdate(ProductVO vo);
	public List<ProductVO> listAll(int start, int end, String searchOption, String keyword);
	public List<ProductVO> productCate(int catecode);
	public List<ProductVO> productNew();
	public List<ProductVO> productBest();
	public List<ProductVO> listCate(int start, int end, String searchOption, String keyword, int catecode, List<Integer> pdtypes, List<Integer> pdshapes);
	public int countCate(String searchOption, String keyword, int catecode, List<Integer> pdtypes, List<Integer> pdshapes);
	public int countArticle(String searchOption, String keyword);
	//카트 담기
	public void addCart(CartListVO vo);
	//카트 리스트
	public List<CartListVO> cartList(String mid) throws Exception;
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	// 주문 정보
		public void orderInfo(OrderVO order) throws Exception;
		
		// 주문 상세 정보
		public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

		// 카트 비우기
		public void cartAllDelete(String userId) throws Exception;
		
		// 주문 목록
		public List<OrderVO> orderList(OrderVO order) throws Exception;
		
		// 특정 주문 목록
		public List<OrderListVO> orderView(OrderVO order) throws Exception;
		
		public void deleteCartPd(int pdnu);
		public int countCart(int pdnu);
	public List<ProductVO> searchpd(String mid);
	public void soldCnt(List<OrderDetailVO> soldcnt);
	public List<OrderDetailVO> soldSearch(String orderId);
}
