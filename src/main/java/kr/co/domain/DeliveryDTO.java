package kr.co.domain;

import java.io.Serializable;

public class DeliveryDTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int delivery_no;
	private String delivery_bizrno;
	private int delivery_cost;
	private String delivery_date;
	
	public DeliveryDTO() {
		// TODO Auto-generated constructor stub
	}

	public DeliveryDTO(int delivery_no, String delivery_bizrno, int delivery_cost, String delivery_date) {
		super();
		this.delivery_no = delivery_no;
		this.delivery_bizrno = delivery_bizrno;
		this.delivery_cost = delivery_cost;
		this.delivery_date = delivery_date;
	}

	public int getDelivery_no() {
		return delivery_no;
	}

	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}

	public String getDelivery_bizrno() {
		return delivery_bizrno;
	}

	public void setDelivery_bizrno(String delivery_bizrno) {
		this.delivery_bizrno = delivery_bizrno;
	}

	public int getDelivery_cost() {
		return delivery_cost;
	}

	public void setDelivery_cost(int delivery_cost) {
		this.delivery_cost = delivery_cost;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + delivery_no;
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
		DeliveryDTO other = (DeliveryDTO) obj;
		if (delivery_no != other.delivery_no) {
			return false;
		}
		return true;
	}
	
}
