package kr.co.domain;

import java.io.Serializable;

public class CartDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cart_id;
	private String email;
	private String goods_no;
	private String goods_img;
	private String goods_nm;
	private String goods_color;
	private String goods_size;
	private int goods_qtys;
	private int goods_untpc;
	
	public CartDTO() {
	}

	public CartDTO(int cart_id, String email, String goods_no, String goods_img, String goods_nm, String goods_color,
			String goods_size, int goods_qtys, int goods_untpc) {
		super();
		this.cart_id = cart_id;
		this.email = email;
		this.goods_no = goods_no;
		this.goods_img = goods_img;
		this.goods_nm = goods_nm;
		this.goods_color = goods_color;
		this.goods_size = goods_size;
		this.goods_qtys = goods_qtys;
		this.goods_untpc = goods_untpc;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(String goods_no) {
		this.goods_no = goods_no;
	}

	public String getGoods_img() {
		return goods_img;
	}

	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}

	public String getGoods_nm() {
		return goods_nm;
	}

	public void setGoods_nm(String goods_nm) {
		this.goods_nm = goods_nm;
	}

	public String getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}

	public String getGoods_size() {
		return goods_size;
	}

	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}

	public int getGoods_qtys() {
		return goods_qtys;
	}

	public void setGoods_qtys(int goods_qtys) {
		this.goods_qtys = goods_qtys;
	}

	public int getGoods_untpc() {
		return goods_untpc;
	}

	public void setGoods_untpc(int goods_untpc) {
		this.goods_untpc = goods_untpc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", email=" + email + ", goods_no=" + goods_no + ", goods_img="
				+ goods_img + ", goods_nm=" + goods_nm + ", goods_color=" + goods_color + ", goods_size=" + goods_size
				+ ", goods_qtys=" + goods_qtys + ", goods_untpc=" + goods_untpc + "]";
	}
	
	
}
