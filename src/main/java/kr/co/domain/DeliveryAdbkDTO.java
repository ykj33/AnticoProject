package kr.co.domain;

import java.io.Serializable;

public class DeliveryAdbkDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email; // 이메일
	private int delivery_adbk_no; // 주소록 번호
	private String delivery_adbk_ncm; // 주소록 별칭
	private String delivery_place_tlnum; // 배송지 전화번호
	private String delivery_place_adres; // 배송지 주소
	private String delivery_place_adres_detail; // 배송지 상세주소

	public DeliveryAdbkDTO() {
		// TODO Auto-generated constructor stub
	}

	public DeliveryAdbkDTO(String email, int delivery_adbk_no, String delivery_adbk_ncm, String delivery_place_tlnum,
			String delivery_place_adres, String delivery_place_adres_detail) {
		super();
		this.email = email;
		this.delivery_adbk_no = delivery_adbk_no;
		this.delivery_adbk_ncm = delivery_adbk_ncm;
		this.delivery_place_tlnum = delivery_place_tlnum;
		this.delivery_place_adres = delivery_place_adres;
		this.delivery_place_adres_detail = delivery_place_adres_detail;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getDelivery_adbk_no() {
		return delivery_adbk_no;
	}

	public void setDelivery_adbk_no(int delivery_adbk_no) {
		this.delivery_adbk_no = delivery_adbk_no;
	}

	public String getDelivery_adbk_ncm() {
		return delivery_adbk_ncm;
	}

	public void setDelivery_adbk_ncm(String delivery_adbk_ncm) {
		this.delivery_adbk_ncm = delivery_adbk_ncm;
	}

	public String getDelivery_place_tlnum() {
		return delivery_place_tlnum;
	}

	public void setDelivery_place_tlnum(String delivery_place_tlnum) {
		this.delivery_place_tlnum = delivery_place_tlnum;
	}

	public String getDelivery_place_adres() {
		return delivery_place_adres;
	}

	public void setDelivery_place_adres(String delivery_place_adres) {
		this.delivery_place_adres = delivery_place_adres;
	}

	public String getDelivery_place_adres_detail() {
		return delivery_place_adres_detail;
	}

	public void setDelivery_place_adres_detail(String delivery_place_adres_detail) {
		this.delivery_place_adres_detail = delivery_place_adres_detail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		DeliveryAdbkDTO other = (DeliveryAdbkDTO) obj;
		if (email == null) {
			if (other.email != null) {
				return false;
			}
		} else if (!email.equals(other.email)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "DeliveryAdbkDTO [email=" + email + ", delivery_adbk_no=" + delivery_adbk_no + ", delivery_adbk_ncm="
				+ delivery_adbk_ncm + ", delivery_place_tlnum=" + delivery_place_tlnum + ", delivery_place_adres="
				+ delivery_place_adres + ", delivery_place_adres_detail=" + delivery_place_adres_detail + "]";
	}

}
