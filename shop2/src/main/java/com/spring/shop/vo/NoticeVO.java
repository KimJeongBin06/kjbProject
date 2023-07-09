package com.spring.shop.vo;

import java.util.Date;

public class NoticeVO {
	
    /* 게시판 번호 */
    private int nbno;
    
    /* 게시판 제목 */
    private String ntitle;
    
    /* 게시판 내용 */
    private String ncontent;
    
    /* 게시판 작가 */
    private String nwriter;
    
    /* 등록 날짜 */
    private Date ndate;
    
    /* 수정 날짜 */
    private Date nupdate;

	public int getNbno() {
		return nbno;
	}

	public void setNbno(int nbno) {
		this.nbno = nbno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public Date getNdate() {
		return ndate;
	}

	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}

	public Date getNupdate() {
		return nupdate;
	}

	public void setNupdate(Date nupdate) {
		this.nupdate = nupdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [nbno=" + nbno + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", nwriter=" + nwriter
				+ ", ndate=" + ndate + ", nupdate=" + nupdate + "]";
	}

	
    
}
