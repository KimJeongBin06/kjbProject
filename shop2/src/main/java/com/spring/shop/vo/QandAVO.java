package com.spring.shop.vo;

import java.sql.Timestamp;
import java.util.Date;

public class QandAVO {
	private int qbno;
    
    /* 게시판 제목 */
    private String qtitle;
    
    /* 게시판 내용 */
    private String qcontent;
    
    /* 게시판 작가 */
    private String qwriter;
    
    /* 등록 날짜 */
    private Date qdate;
    
    /* 수정 날짜 */
    private Date qupdate;
    
    int abno;
    
	String atitle;
	
	String acontent;
	
	String awriter;
	
	Timestamp adate;
	
	Timestamp aupdate;
	
	int bindex;

	public int getQbno() {
		return qbno;
	}

	public void setQbno(int qbno) {
		this.qbno = qbno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public Date getQupdate() {
		return qupdate;
	}

	public void setQupdate(Date qupdate) {
		this.qupdate = qupdate;
	}

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

	public int getBindex() {
		return bindex;
	}

	public void setBindex(int bindex) {
		this.bindex = bindex;
	}

	@Override
	public String toString() {
		return "QandAVO [qbno=" + qbno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter=" + qwriter
				+ ", qdate=" + qdate + ", qupdate=" + qupdate + ", abno=" + abno + ", atitle=" + atitle + ", acontent="
				+ acontent + ", awriter=" + awriter + ", adate=" + adate + ", aupdate=" + aupdate + ", bindex=" + bindex
				+ "]";
	}

	

	

}
