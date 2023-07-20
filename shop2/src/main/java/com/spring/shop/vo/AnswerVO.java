package com.spring.shop.vo;

import java.sql.Timestamp;

public class AnswerVO {
	int abno;
	String atitle;
	String acontent;
	String awriter;
	int qbno;
	Timestamp adate;
	Timestamp aupdate;
	public int getAbno() {
		return abno;
	}
	public void setAbno(int abno) {
		this.abno = abno;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public String getAwriter() {
		return awriter;
	}
	public void setAwriter(String awriter) {
		this.awriter = awriter;
	}
	public int getQbno() {
		return qbno;
	}
	public void setQbno(int qbno) {
		this.qbno = qbno;
	}
	public Timestamp getAdate() {
		return adate;
	}
	public void setAdate(Timestamp adate) {
		this.adate = adate;
	}
	public Timestamp getAupdate() {
		return aupdate;
	}
	public void setAupdate(Timestamp aupdate) {
		this.aupdate = aupdate;
	}
	@Override
	public String toString() {
		return "AnswerVO [abno=" + abno + ", atitle=" + atitle + ", acontent=" + acontent + ", awriter=" + awriter
				+ ", qbno=" + qbno + ", adate=" + adate + ", aupdate=" + aupdate + "]";
	}
	
	
}
