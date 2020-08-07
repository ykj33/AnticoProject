package kr.co.domain;

import java.io.Serializable;

public class OrderListDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int order_no;
	private int delivery_no;
	private String order_date;
	private String order_pro_sttus_code;
	private int delivery_adbk_no;
	private String goods_no;
	private int order_amount;
	private int goods_untpc;
	private String goods_size;
	private String goods_color;
	private String goods_nm;
	private String delivery_date;
	private String goods_img;
	public OrderListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderListDTO(int order_no, int delivery_no, String order_date, String order_pro_sttus_code,
			int delivery_adbk_no, String goods_no, int order_amount, int goods_untpc, String goods_size,
			String goods_color, String goods_nm, String delivery_date, String goods_img) {
		super();
		this.order_no = order_no;
		this.delivery_no = delivery_no;
		this.order_date = order_date;
		this.order_pro_sttus_code = order_pro_sttus_code;
		this.delivery_adbk_no = delivery_adbk_no;
		this.goods_no = goods_no;
		this.order_amount = order_amount;
		this.goods_untpc = goods_untpc;
		this.goods_size = goods_size;
		this.goods_color = goods_color;
		this.goods_nm = goods_nm;
		this.delivery_date = delivery_date;
		this.goods_img = goods_img;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_pro_sttus_code() {
		return order_pro_sttus_code;
	}
	public void setOrder_pro_sttus_code(String order_pro_sttus_code) {
		this.order_pro_sttus_code = order_pro_sttus_code;
	}
	public int getDelivery_adbk_no() {
		return delivery_adbk_no;
	}
	public void setDelivery_adbk_no(int delivery_adbk_no) {
		this.delivery_adbk_no = delivery_adbk_no;
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
	public String getGoods_nm() {
		return goods_nm;
	}
	public void setGoods_nm(String goods_nm) {
		this.goods_nm = goods_nm;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getGoods_img() {
		return goods_img;
	}
	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
	
	
	
}
