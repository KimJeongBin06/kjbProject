package com.spring.shop.vo;

import java.util.Date;

public class QuestionVO {
	
	/* 게시판 번호 */
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

	@Override
	public String toString() {
		return "QuestionVO [qbno=" + qbno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter="
				+ qwriter + ", qdate=" + qdate + ", qupdate=" + qupdate + "]";
	}
	
	
    
}
