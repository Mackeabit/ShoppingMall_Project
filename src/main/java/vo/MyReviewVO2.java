package vo;

public class MyReviewVO2 {
	private int pd_idx, rv_count, rv_score_avg;
	public int getRv_count() {
		return rv_count;
	}
	public void setRv_count(int rv_count) {
		this.rv_count = rv_count;
	}
	public int getRv_score_avg() {
		return rv_score_avg;
	}
	public void setRv_score_avg(int rv_score_avg) {
		this.rv_score_avg = rv_score_avg;
	}
	private String pd_nm, pd_img, pd_size;
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
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
	public String getPd_size() {
		return pd_size;
	}
	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
	}
	
}
