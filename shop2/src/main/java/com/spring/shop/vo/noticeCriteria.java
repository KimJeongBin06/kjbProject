package com.spring.shop.vo;

import java.util.Arrays;

public class noticeCriteria {
	
	   /* 현재 페이지 */
    private int pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;
    
    private int skip;
    
    private String keyword;
    
    private String type;
    
    private String[] typeArr;
    
    public noticeCriteria() {
        this(1,10);
        this.skip = 0;
    }
    
 
    public noticeCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		
		this.pageNum = pageNum;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		
		this.skip = (this.pageNum-1)*amount;
		
		this.amount = amount;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
	
	public String[] getTypeArr() {
		return typeArr;
	}
	
	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	public int getSkip() {
		return skip;
	}


	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	@Override
	public String toString() {
		return "noticeCriteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword
				+ ", type=" + type + ", typeArr=" + Arrays.toString(typeArr) + "]";
	}


	
	
	}



