package com.spring.shop.vo;

import java.util.Date;

public class CartVO {
	private int cartnum;
	private String mid;
	private int pdnu;
	private int ctcnt;
	private Date addDate;
	
	public int getCartnum() {
		return cartnum;
	}
	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	@Override
	public String toString() {
		return "CartVO [cartnum=" + cartnum + ", mid=" + mid + ", pdnu=" + pdnu + ", ctcnt=" + ctcnt + ", addDate="
				+ addDate + "]";
	}
	
	
	
	

}
