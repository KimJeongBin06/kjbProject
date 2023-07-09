package com.spring.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.shop.dao.ProductDAO;
import com.spring.shop.vo.CartListVO;
import com.spring.shop.vo.CartVO;
import com.spring.shop.vo.OrderDetailVO;
import com.spring.shop.vo.OrderListVO;
import com.spring.shop.vo.OrderVO;
import com.spring.shop.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO productDao;
	
	@Override
	public void productInsert(ProductVO vo) {

		
		productDao.productInsert(vo);

	}
	@Override
	public List<ProductVO> productList() {
		return productDao.productList();
	}
	@Override
	public void productDelete(int pdnu) {
		productDao.productDelete(pdnu);
	}
	@Override
	public ProductVO productItem(int pdnu) {
		return productDao.productItem(pdnu);
	}
	@Override
	public void productUpdate(ProductVO vo) {
		productDao.productUpdate(vo);
	}
	@Override
	public List<ProductVO> listAll(int start, int end, String searchOption, String keyword) {
		return productDao.listAll(start, end, searchOption, keyword);
	}
	@Override
	public List<ProductVO> productCate(int catecode) {
		return productDao.productCate(catecode);
	}
	@Override
	public List<ProductVO> productNew(){
		return productDao.productNew();
	}
	@Override
	public List<ProductVO> productBest(){
		return productDao.productBest();
	}
	@Override
	public int countArticle(String searchOption, String keyword) {
		return productDao.countArticle(searchOption, keyword);
	}
	@Override
	public List<ProductVO> listCate(int start, int end, String searchOption, String keyword, int catecode, List<Integer> pdtypes, List<Integer> pdshapes){
		return productDao.listCate(start, end, searchOption, keyword, catecode, pdtypes, pdshapes);
	}
	@Override
	public int countCate(String searchOption, String keyword, int catecode, List<Integer> pdtypes, List<Integer> pdshapes) {
		return productDao.countCate(searchOption, keyword, catecode, pdtypes, pdshapes);
	}
	@Override
	public void addCart(CartListVO vo) throws Exception {
		productDao.addCart(vo);

	}
	@Override
	public List<CartListVO> cartList(String mid) throws Exception {
		return productDao.cartList(mid);
	}
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		productDao.deleteCart(cart);
		
	}
	// 카트 비우기 
		@Override
		public void cartAllDelete(String userId) throws Exception {
			productDao.cartAllDelete(userId);
		}

		// 주문 목록
		@Override
		public List<OrderVO> orderList(OrderVO order) throws Exception {
			return productDao.orderList(order);
		}

		// 특정 주문
		@Override
		public List<OrderListVO> orderView(OrderVO order) throws Exception {
			return productDao.orderView(order);
		}
		
		// 주문 정보
		@Override
		public void orderInfo(OrderVO order) throws Exception {
			productDao.orderInfo(order);
		}

		// 주문 상세 정보
		@Override
		public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
			productDao.orderInfo_Details(orderDetail);
		}
		@Override
		public void deleteCartPd(int pdnu) {
			productDao.deleteCartPd(pdnu);
		}
		@Override
		public int countCart(int pdnu) {
			return productDao.countCart(pdnu);
		}
	@Override
	public List<ProductVO> searchpd(String mid) {
		return productDao.searchpd(mid);
	}
	@Override
	public void soldCnt(List<OrderDetailVO> soldcnt) {
		productDao.soldCnt(soldcnt);
	}
	@Override
	public List<OrderDetailVO> soldSearch(String orderId) {
		return productDao.soldSearch(orderId);
	}
	
	}  
	

