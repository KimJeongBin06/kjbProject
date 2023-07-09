package com.spring.shop.vo;

import java.util.Date;

public class OrderListVO {
	private String orderId;
	private String mid;
	private String orderRec;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String orderPhon;
	private int amount;
	private Date orderDate;
	
	private int orderDetailsNum;
	private int pdnu;
	private int ctcnt;
	
	private String pdname;
	private String pdimg1;
	private int pdprice;
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
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
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getPdimg1() {
		return pdimg1;
	}
	public void setPdimg1(String pdimg1) {
		this.pdimg1 = pdimg1;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	@Override
	public String toString() {
		return "OrderListVO [orderId=" + orderId + ", mid=" + mid + ", orderRec=" + orderRec + ", userAddr1="
				+ userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3 + ", orderPhon=" + orderPhon
				+ ", amount=" + amount + ", orderDate=" + orderDate + ", orderDetailsNum=" + orderDetailsNum + ", pdnu="
				+ pdnu + ", ctcnt=" + ctcnt + ", pdname=" + pdname + ", pdimg1=" + pdimg1 + ", pdprice=" + pdprice
				+ "]";
	}
	
	
	
}
