package kr.co.domain;

import java.io.Serializable;

public class MemberDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mid;
	private String email;
	private String mpw;
	private String mname;
	private String telephone;
	private String subscribe_date;
	
	public MemberDTO() {
	}

	public MemberDTO(String mid, String email, String mpw, String mname, String telephone, String subscribe_date) {
		super();
		this.mid = mid;
		this.email = email;
		this.mpw = mpw;
		this.mname = mname;
		this.telephone = telephone;
		this.subscribe_date = subscribe_date;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
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
		return "MemberDTO [mid=" + mid + ", email=" + email + ", mname=" + mname + ", telephone=" + telephone
				+ ", subscribe_date=" + subscribe_date + "]";
	}

	
}
