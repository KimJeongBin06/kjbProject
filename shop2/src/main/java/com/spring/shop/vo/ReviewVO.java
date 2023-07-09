package com.spring.shop.vo;

import java.sql.Timestamp;

public class ReviewVO {
	int revnum;
	int pdnu;
	String revtitle;
	String revcontent;
	String mid;
	Timestamp revdate;
	String revimg;
	String pdname;
	String mname;
	int rating;
	public int getRevnum() {
		return revnum;
	}
	public void setRevnum(int revnum) {
		this.revnum = revnum;
	}
	public int getPdnu() {
		return pdnu;
	}
	public void setPdnu(int pdnu) {
		this.pdnu = pdnu;
	}
	public String getRevtitle() {
		return revtitle;
	}
	public void setRevtitle(String revtitle) {
		this.revtitle = revtitle;
	}
	public String getRevcontent() {
		return revcontent;
	}
	public void setRevcontent(String revcontent) {
		this.revcontent = revcontent;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Timestamp getRevdate() {
		return revdate;
	}
	public void setRevdate(Timestamp revdate) {
		this.revdate = revdate;
	}
	public String getRevimg() {
		return revimg;
	}
	public void setRevimg(String revimg) {
		this.revimg = revimg;
	}
	public String getPdname() {
		return pdname;
	}
	public void setPdname(String pdname) {
		this.pdname = pdname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "ReviewVO [revnum=" + revnum + ", pdnu=" + pdnu + ", revtitle=" + revtitle + ", revcontent=" + revcontent
				+ ", mid=" + mid + ", revdate=" + revdate + ", revimg=" + revimg + ", pdname=" + pdname + ", mname="
				+ mname + ", rating=" + rating + "]";
	}
	
	
	
}
