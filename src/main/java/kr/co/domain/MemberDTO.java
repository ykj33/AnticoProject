package kr.co.domain;

import java.io.Serializable;

public class MemberDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private String mpw;
	private String subscribe_date;
	
	public MemberDTO() {
	}

	public MemberDTO(String email, String mpw, String subscribe_date) {
		super();
		this.email = email;
		this.mpw = mpw;
		this.subscribe_date = subscribe_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getSubscribe_date() {
		return subscribe_date;
	}

	public void setSubscribe_date(String subscribe_date) {
		this.subscribe_date = subscribe_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MemberDTO [email=" + email + ", subscribe_date=" + subscribe_date + "]";
	}
	
}
