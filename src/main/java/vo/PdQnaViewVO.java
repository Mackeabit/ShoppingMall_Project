package vo;

public class PdQnaViewVO {
	private int qna_idx, user_idx, pd_idx, qna_status, qna_secret;
	private String qna_title, qna_content, qna_res, qna_date, pd_nm, pd_img,
					pd_img1,pd_img2, pd_size, user_nm;
	
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public int getQna_secret() {
		return qna_secret;
	}
	public void setQna_secret(int qna_secret) {
		this.qna_secret = qna_secret;
	}
	public String getPd_size() {
		return pd_size;
	}
	public void setPd_size(String pd_size) {
		this.pd_size = pd_size;
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
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public int getQna_status() {
		return qna_status;
	}
	public void setQna_status(int qna_status) {
		this.qna_status = qna_status;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_res() {
		return qna_res;
	}
	public void setQna_res(String qna_res) {
		this.qna_res = qna_res;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
}