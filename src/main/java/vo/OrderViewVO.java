package vo;

public class OrderViewVO {
	private int user_idx, od_idx, pd_idx, od_cnt, od_money, od_status, pd_price, od_review, rv_idx;
	private String od_date, od_destination, od_name, od_tel, pd_nm,
					pd_img, pd_img1, pd_img2, pd_size;
	
	//0628 rv_idx 뷰에 추가
	public int getRv_idx() {
		return rv_idx;
	}
	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
	}
	public int getOd_review() {
		return od_review;
	}
	public void setOd_review(int od_review) {
		this.od_review = od_review;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getOd_idx() {
		return od_idx;
	}
	public void setOd_idx(int od_idx) {
		this.od_idx = od_idx;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public int getOd_cnt() {
		return od_cnt;
	}
	public void setOd_cnt(int od_cnt) {
		this.od_cnt = od_cnt;
	}
	public int getOd_money() {
		return od_money;
	}
	public void setOd_money(int od_money) {
		this.od_money = od_money;
	}
	public int getOd_status() {
		return od_status;
	}
	public void setOd_status(int od_status) {
		this.od_status = od_status;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	public String getOd_destination() {
		return od_destination;
	}
	public void setOd_destination(String od_destination) {
		this.od_destination = od_destination;
	}
	public String getOd_name() {
		return od_name;
	}
	public void setOd_name(String od_name) {
		this.od_name = od_name;
	}
	public String getOd_tel() {
		return od_tel;
	}
	public void setOd_tel(String od_tel) {
		this.od_tel = od_tel;
	}
	public String getPd_nm() {
		return pd_nm;
	}
	public void setPd_nm(String pd_nm) {
		this.pd_nm = pd_nm;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public String getPd_img1() {
		return pd_img1;
	}
	public void setPd_img1(String pd_img1) {
		this.pd_img1 = pd_img1;
	}
	public String getPd_img2() {
		return pd_img2;
	}
	public void setPd_img2(String pd_img2) {
		this.pd_img2 = pd_img2;
	}
	public String getPd_size() {
		return pd_size;
	}
	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
	}
	
}
