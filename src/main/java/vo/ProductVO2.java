package vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO2 {
	private int pd_idx, category_cd, pd_price, pd_cnt, pd_cost, pd_status;
	private String pd_nm, pd_ex, pd_size;
	
	private MultipartFile pd_img, pd_img1, pd_img2;

	public MultipartFile getPd_img() {
		return pd_img;
	}
	public MultipartFile getPd_img1() {
		return pd_img1;
	}
	public MultipartFile getPd_img2() {
		return pd_img2;
	}
	public void setPd_img(MultipartFile pd_img) {
		this.pd_img = pd_img;
	}
	public void setPd_img1(MultipartFile pd_img1) {
		this.pd_img1 = pd_img1;
	}
	public void setPd_img2(MultipartFile pd_img2) {
		this.pd_img2 = pd_img2;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public int getCategory_cd() {
		return category_cd;
	}
	public void setCategory_cd(int category_cd) {
		this.category_cd = category_cd;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getPd_cnt() {
		return pd_cnt;
	}
	public void setPd_cnt(int pd_cnt) {
		this.pd_cnt = pd_cnt;
	}
	public int getPd_cost() {
		return pd_cost;
	}
	public void setPd_cost(int pd_cost) {
		this.pd_cost = pd_cost;
	}
	public int getPd_status() {
		return pd_status;
	}
	public void setPd_status(int pd_status) {
		this.pd_status = pd_status;
	}
	public String getPd_nm() {
		return pd_nm;
	}
	public void setPd_nm(String pd_nm) {
		this.pd_nm = pd_nm;
	}
	public String getPd_ex() {
		return pd_ex;
	}
	public void setPd_ex(String pd_ex) {
		this.pd_ex = pd_ex;
	}
	public String getPd_size() {
		return pd_size;
	}
	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
	}
}

