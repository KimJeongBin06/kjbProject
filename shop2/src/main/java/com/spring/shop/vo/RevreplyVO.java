package com.spring.shop.vo;

import java.sql.Timestamp;

public class RevreplyVO {
	int revrnum;
    int revnum;
    String revrid;
    String revrcontext;
    String mname;
    Timestamp revrdate;
	public int getRevrnum() {
		return revrnum;
	}
	public void setRevrnum(int revrnum) {
		this.revrnum = revrnum;
	}
	public int getRevnum() {
		return revnum;
	}
	public void setRevnum(int revnum) {
		this.revnum = revnum;
	}
	public String getRevrid() {
		return revrid;
	}
	public void setRevrid(String revrid) {
		this.revrid = revrid;
	}
	public String getRevrcontext() {
		return revrcontext;
	}
	public void setRevrcontext(String revrcontext) {
		this.revrcontext = revrcontext;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Timestamp getRevrdate() {
		return revrdate;
	}
	public void setRevrdate(Timestamp revrdate) {
		this.revrdate = revrdate;
	}
	@Override
	public String toString() {
		return "RevreplyVO [revrnum=" + revrnum + ", revnum=" + revnum + ", revrid=" + revrid + ", revrcontext="
				+ revrcontext + ", mname=" + mname + ", revrdate=" + revrdate + "]";
	}
	
	
}
