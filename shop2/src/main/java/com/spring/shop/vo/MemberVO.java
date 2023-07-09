package com.spring.shop.vo;

import java.util.Date;

public class MemberVO {
	
	private String mid; // 회원 id
	private int verify; // 일반회원 = 1 , 관리자 = 2
	private String mpwd;
	private String mname;
	private int mgender;
	private String mtel;
	private String memail;
	private String mzip;
	private String maddr1;
	private String maddr2;
	private Date mddate;
	private Date mrdate;
	
	
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMgender() {
		return mgender;
	}
	public void setMgender(int mgender) {
		this.mgender = mgender;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMzip() {
		return mzip;
	}
	public void setMzip(String mzip) {
		this.mzip = mzip;
	}
	public String getMaddr1() {
		return maddr1;
	}
	public void setMaddr1(String maddr1) {
		this.maddr1 = maddr1;
	}
	public String getMaddr2() {
		return maddr2;
	}
	public void setMaddr2(String maddr2) {
		this.maddr2 = maddr2;
	}
	public Date getMddate() {
		return mddate;
	}
	public void setMddate(Date mddate) {
		this.mddate = mddate;
	}
	public Date getMrdate() {
		return mrdate;
	}
	public void setMrdate(Date mrdate) {
		this.mrdate = mrdate;
	}
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", verify=" + verify + ", mpwd=" + mpwd + ", mname=" + mname + ", mgender="
				+ mgender + ", mtel=" + mtel + ", memail=" + memail + ", mzip=" + mzip + ", maddr1=" + maddr1
				+ ", maddr2=" + maddr2 + ", mddate=" + mddate + ", mrdate=" + mrdate + "]";
	}

	
	
	
	

}
