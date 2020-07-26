package kr.co.domain;

import java.io.Serializable;

public class GoodsDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int goods_no ;
	private String goods_nm;
	private String makr;
	private String goods_category;
	private String goods_img;
	private String goods_info_img;
	private String goods_info_text;

	public GoodsDTO() {
		super();
	}

	public GoodsDTO(int goods_no, String goods_nm, String makr, String goods_category, String goods_img,
			String goods_info_img, String goods_info_text) {
		super();
		this.goods_no = goods_no;
		this.goods_nm = goods_nm;
		this.makr = makr;
		this.goods_category = goods_category;
		this.goods_img = goods_img;
		this.goods_info_img = goods_info_img;
		this.goods_info_text = goods_info_text;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getGoods_nm() {
		return goods_nm;
	}

	public void setGoods_nm(String goods_nm) {
		this.goods_nm = goods_nm;
	}

	public String getMakr() {
		return makr;
	}

	public void setMakr(String makr) {
		this.makr = makr;
	}

	public String getGoods_category() {
		return goods_category;
	}

	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}

	public String getGoods_img() {
		return goods_img;
	}

	public void setGoods_img(String goods_img) {
		this.goods_img = goods_img;
	}

	public String getGoods_info_img() {
		return goods_info_img;
	}

	public void setGoods_info_img(String goods_info_img) {
		this.goods_info_img = goods_info_img;
	}

	public String getGoods_info_text() {
		return goods_info_text;
	}

	public void setGoods_info_text(String goods_info_text) {
		this.goods_info_text = goods_info_text;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GoodsDTO [goods_no=" + goods_no + ", goods_nm=" + goods_nm + ", makr=" + makr + ", goods_category="
				+ goods_category + ", goods_img=" + goods_img + ", goods_info_img=" + goods_info_img
				+ ", goods_info_text=" + goods_info_text + "]";
	}
	
	
	
}
