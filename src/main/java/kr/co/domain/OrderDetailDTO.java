package kr.co.domain;

import java.io.Serializable;

public class OrderDetailDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int order_no;
	private String goods_no;
	private int order_amount;
	private int goods_untpc;
	private String goods_size;
	private String goods_color;

	public OrderDetailDTO() {
	}

	public OrderDetailDTO(int order_no, String goods_no, int order_amount, int goods_untpc, String goods_size,
			String goods_color) {
		super();
		this.order_no = order_no;
		this.goods_no = goods_no;
		this.order_amount = order_amount;
		this.goods_untpc = goods_untpc;

		this.goods_size = goods_size;
		this.goods_color = goods_color;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
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
	public String toString() {
		return "OrderDetailDTO [order_no=" + order_no + ", goods_no=" + goods_no + ", order_amount=" + order_amount
				+ ", goods_untpc=" + goods_untpc + ", application_dscnt_rate=, goods_size=" + goods_size
				+ ", goods_color=" + goods_color + "]";
	}

}
