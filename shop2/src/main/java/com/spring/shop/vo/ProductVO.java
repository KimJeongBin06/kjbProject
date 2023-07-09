package com.spring.shop.vo;

import java.sql.Timestamp;

public class ProductVO {
	int pdnu;
	int catecode;
	String pdname;
	String pdcontent;
	int pdprice;
	int pdcnt;
	int soldcnt;
	String pdimg1;
	String pdimg2;
	String pdimg3;
	String pddtimg;
	Timestamp pddate;
	int pdtype;
	int pdshape;
	int ratingavg;
	public int getPdnu() {
		return pdnu;
	}
	public void setPdnu(int pdnu) {
		this.pdnu = pdnu;
	}
	public int getCatecode() {
		return catecode;
	}
	public void setCatecode(int catecode) {
		this.catecode = catecode;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getPdcontent() {
		return pdcontent;
	}
	public void setPdcontent(String pdcontent) {
		this.pdcontent = pdcontent;
	}
	public int getPdprice() {
		return pdprice;
	}
	public void setPdprice(int pdprice) {
		this.pdprice = pdprice;
	}
	public int getPdcnt() {
		return pdcnt;
	}
	public void setPdcnt(int pdcnt) {
		this.pdcnt = pdcnt;
	}
	public int getSoldcnt() {
		return soldcnt;
	}
	public void setSoldcnt(int soldcnt) {
		this.soldcnt = soldcnt;
	}
	public String getPdimg1() {
		return pdimg1;
	}
	public void setPdimg1(String pdimg1) {
		this.pdimg1 = pdimg1;
	}
	public String getPdimg2() {
		return pdimg2;
	}
	public void setPdimg2(String pdimg2) {
		this.pdimg2 = pdimg2;
	}
	public String getPdimg3() {
		return pdimg3;
	}
	public void setPdimg3(String pdimg3) {
		this.pdimg3 = pdimg3;
	}
	public String getPddtimg() {
		return pddtimg;
	}
	public void setPddtimg(String pddtimg) {
		this.pddtimg = pddtimg;
	}
	public Timestamp getPddate() {
		return pddate;
	}
	public void setPddate(Timestamp pddate) {
		this.pddate = pddate;
	}
	public int getPdtype() {
		return pdtype;
	}
	public void setPdtype(int pdtype) {
		this.pdtype = pdtype;
	}
	public int getPdshape() {
		return pdshape;
	}
	public void setPdshape(int pdshape) {
		this.pdshape = pdshape;
	}
	public int getRatingavg() {
		return ratingavg;
	}
	public void setRatingavg(int ratingavg) {
		this.ratingavg = ratingavg;
	}
	@Override
	public String toString() {
		return "ProductVO [pdnu=" + pdnu + ", catecode=" + catecode + ", pdname=" + pdname + ", pdcontent=" + pdcontent
				+ ", pdprice=" + pdprice + ", pdcnt=" + pdcnt + ", soldcnt=" + soldcnt + ", pdimg1=" + pdimg1
				+ ", pdimg2=" + pdimg2 + ", pdimg3=" + pdimg3 + ", pddtimg=" + pddtimg + ", pddate=" + pddate
				+ ", pdtype=" + pdtype + ", pdshape=" + pdshape + ", ratingavg=" + ratingavg + "]";
	}
	
	
	
	
	
}
