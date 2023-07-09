package com.spring.shop.vo;

import java.util.Date;

public class CartListVO {
	private int cartnum;
	private String mid;
	private int pdnu;
	private int ctcnt;
	private Date addDate;
	
	private int num;
	private String pdname;
	private int pdprice;
	private String pdimg1;
	private int money;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public String getPdimg1() {
		return pdimg1;
	}
	public void setPdimg1(String pdimg1) {
		this.pdimg1 = pdimg1;
	}
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
		return "CartListVO [cartnum=" + cartnum + ", mid=" + mid + ", pdnu=" + pdnu + ", ctcnt=" + ctcnt + ", addDate="
				+ addDate + ", num=" + num + ", pdname=" + pdname + ", pdprice=" + pdprice + ", pdimg1=" + pdimg1 + "]";
	}
	
	
	
	

}
