package kr.co.domain;

import java.io.Serializable;

public class GoodsOptionDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String goods_no;
	private int goods_amount;
	private int goods_untpc;
	private String goods_size;
	private String goods_color;

	public GoodsOptionDTO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsOptionDTO(String goods_no, int goods_amount, int goods_untpc, String goods_size, String goods_color) {
		super();
		this.goods_no = goods_no;
		this.goods_amount = goods_amount;
		this.goods_untpc = goods_untpc;
		this.goods_size = goods_size;
		this.goods_color = goods_color;
	}

	public String getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}

	public int getGoods_amount() {
		return goods_amount;
	}

	public void setGoods_amount(int goods_amount) {
		this.goods_amount = goods_amount;
	}

	public int getGoods_untpc() {
		return goods_untpc;
	}

	public void setGoods_untpc(int goods_untpc) {
		this.goods_untpc = goods_untpc;
	}

	public String getGoods_size() {
		return goods_size;
	}

	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}

	public String getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((goods_no == null) ? 0 : goods_no.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GoodsOptionDTO other = (GoodsOptionDTO) obj;
		if (goods_no == null) {
			if (other.goods_no != null)
				return false;
		} else if (!goods_no.equals(other.goods_no))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GoodsOptionDTO [goods_no=" + goods_no + ", goods_amount=" + goods_amount + ", goods_untpc="
				+ goods_untpc + ", goods_size=" + goods_size + ", goods_color=" + goods_color + "]";
	}

}
