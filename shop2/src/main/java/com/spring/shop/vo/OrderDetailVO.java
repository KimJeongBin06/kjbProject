package com.spring.shop.vo;

public class OrderDetailVO {
	private int orderDetailsNum;
	private String orderId;
	private int pdnu;
	private int ctcnt;
	
	
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	
	public int getPdnu() {
		return pdnu;
	}
	public void setPdnu(int pdnu) {
		this.pdnu = pdnu;
	}
	public int getCtcnt() {
		return ctcnt;
	}
	public void setCtcnt(int ctcnt) {
		this.ctcnt = ctcnt;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailsNum=" + orderDetailsNum + ", orderId=" + orderId + ", pdnu=" + pdnu
				+ ", ctcnt=" + ctcnt + "]";
	}
	
	

}
