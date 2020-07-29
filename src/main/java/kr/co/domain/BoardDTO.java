package kr.co.domain;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

public class BoardDTO implements Serializable {

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
	private int goods_amount;
	private int goods_untpc;	
	private List<String> goods_size;
	private List<String> goods_color;
	
	public BoardDTO() {
	}

	public BoardDTO(String goods_no, String goods_nm, String makr, String goods_category, String goods_img,
			String goods_info_img, String goods_info_text, int goods_amount, int goods_untpc, List<String> goods_size,
			List<String> goods_color) {
		super();
		this.goods_no = goods_no;
		this.goods_nm = goods_nm;
		this.makr = makr;
		this.goods_category = goods_category;
		this.goods_img = goods_img;
		this.goods_info_img = goods_info_img;
		this.goods_info_text = goods_info_text;
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

	public List<String> getGoods_size() {
		return goods_size;
	}

	public void setGoods_size(List<String> goods_size) {
		this.goods_size = goods_size;
	}

	public List<String> getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(List<String> goods_color) {
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
		BoardDTO other = (BoardDTO) obj;
		if (goods_no == null) {
			if (other.goods_no != null)
				return false;
		} else if (!goods_no.equals(other.goods_no))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardDTO [goods_no=" + goods_no + ", goods_nm=" + goods_nm + ", makr=" + makr + ", goods_category="
				+ goods_category + ", goods_img=" + goods_img + ", goods_info_img=" + goods_info_img
				+ ", goods_info_text=" + goods_info_text + ", goods_amount=" + goods_amount + ", goods_untpc="
				+ goods_untpc + ", goods_size=" + goods_size + ", goods_color=" + goods_color + "]";
	}

	
}
