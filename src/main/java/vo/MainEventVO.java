package vo;

public class MainEventVO {
	
	/* VIEW 사용을 위한 VO
	 * 
	 * - view EVENT_PRODUCT 
	 * - view md_PRODUCT
	 * 
	 * */
	
	private int category_cd, pd_price;
	private String pd_nm, pd_img;
	
	public String getPd_img() {
		return pd_img;
	}
	public void setPd_img(String pd_img) {
		this.pd_img = pd_img;
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
	public String getPd_nm() {
		return pd_nm;
	}
	public void setPd_nm(String pd_nm) {
		this.pd_nm = pd_nm;
	}
	
}
