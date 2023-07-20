package com.spring.shop.vo;

public class naverVO {
	private String email;
    private String name;
    private String mobile;
    private String access_token;
    private String mid;
    private String id;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "naverVO [email=" + email + ", name=" + name + ", mobile=" + mobile + ", access_token=" + access_token
				+ ", mid=" + mid + ", id=" + id + "]";
	}
	
    
    
}
