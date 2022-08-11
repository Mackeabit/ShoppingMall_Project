package vo;

public class CpuViewVO {
	/* 장바구니 관련 중복체크, 조회를 위한 VIEW VO */
	
	private int user_idx, cart_idx, pd_idx, pd_price, cart_cnt, pd_cnt, cart_no;
	private String user_nm, pd_nm, pd_size, pd_img, pd_img1;
	
	public String getPd_img1() {
		return pd_img1;
	}
	public void setPd_img1(String pd_img1) {
		this.pd_img1 = pd_img1;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getPd_cnt() {
		return pd_cnt;
	}
	public void setPd_cnt(int pd_cnt) {
		this.pd_cnt = pd_cnt;
	}
	public String getPd_size() {
		return pd_size;
	}
	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
	}
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getPd_nm() {
		return pd_nm;
	}
	public void setPd_nm(String pd_nm) {
		this.pd_nm = pd_nm;
	}
}
