package kr.co.domain;

import java.io.Serializable;

public class LoginDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mid;
	private String mpw;
	private String email;
	
	public LoginDTO() {
		super();
	}

	public LoginDTO(String mid, String mpw, String email) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.email = email;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
