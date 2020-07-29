package kr.co.domain;

import java.io.Serializable;

public class OrderDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int order_no;
	private String email;
	private String delivery_no;
	private String order_date;
	private int order_totamt;
	private String order_pro_sttus_code;
	private String frwll_reason_code;
	private String setle_mth;
	private int delivery_adbk_no;
	
	public OrderDTO() {
	}

	public OrderDTO(int order_no, String email, String delivery_no, String order_date, int order_totamt,
			String order_pro_sttus_code, String frwll_reason_code, String setle_mth, int delivery_adbk_no) {
		super();
		this.order_no = order_no;
		this.email = email;
		this.delivery_no = delivery_no;
		this.order_date = order_date;
		this.order_totamt = order_totamt;
		this.order_pro_sttus_code = order_pro_sttus_code;
		this.frwll_reason_code = frwll_reason_code;
		this.setle_mth = setle_mth;
		this.delivery_adbk_no = delivery_adbk_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDelivery_no() {
		return delivery_no;
	}

	public void setDelivery_no(String delivery_no) {
		this.delivery_no = delivery_no;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public int getOrder_totamt() {
		return order_totamt;
	}

	public void setOrder_totamt(int order_totamt) {
		this.order_totamt = order_totamt;
	}

	public String getOrder_pro_sttus_code() {
		return order_pro_sttus_code;
	}

	public void setOrder_pro_sttus_code(String order_pro_sttus_code) {
		this.order_pro_sttus_code = order_pro_sttus_code;
	}

	public String getFrwll_reason_code() {
		return frwll_reason_code;
	}

	public void setFrwll_reason_code(String frwll_reason_code) {
		this.frwll_reason_code = frwll_reason_code;
	}

	public String getSetle_mth() {
		return setle_mth;
	}

	public void setSetle_mth(String setle_mth) {
		this.setle_mth = setle_mth;
	}

	public int getDelivery_adbk_no() {
		return delivery_adbk_no;
	}

	public void setDelivery_adbk_no(int delivery_adbk_no) {
		this.delivery_adbk_no = delivery_adbk_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OrderDTO [order_no=" + order_no + ", email=" + email + ", delivery_no=" + delivery_no + ", order_date="
				+ order_date + ", order_totamt=" + order_totamt + ", order_pro_sttus_code=" + order_pro_sttus_code
				+ ", frwll_reason_code=" + frwll_reason_code + ", setle_mth=" + setle_mth + ", delivery_adbk_no="
				+ delivery_adbk_no + "]";
	}
	
	
}
