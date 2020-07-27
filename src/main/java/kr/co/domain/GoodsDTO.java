package kr.co.domain;

import java.io.Serializable;

public class GoodsDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String goods_no;
	private String goods_nm;
	private String makr;
	private String goods_category;
	private String goods_img;
	private String goods_info_img;
	private String goods_info_text;

	public GoodsDTO() {
		// TODO Auto-generated constructor stub
	}

	public GoodsDTO(String goods_no, String goods_nm, String makr, String goods_category, String goods_img,
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

	public String getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(String goods_no) {
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
		GoodsDTO other = (GoodsDTO) obj;
		if (goods_no == null) {
			if (other.goods_no != null)
				return false;
		} else if (!goods_no.equals(other.goods_no))
			return false;
		return true;
	}

}
