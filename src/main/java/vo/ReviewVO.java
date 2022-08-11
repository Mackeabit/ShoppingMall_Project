package vo;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int rv_idx, user_idx, pd_idx, rv_score;
	private String rv_img, rv_title, rv_content, rv_date;
	private MultipartFile photo;
	
	
	public int getRv_idx() {
		return rv_idx;
	}
	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
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
	public int getRv_score() {
		return rv_score;
	}
	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}
	public String getRv_img() {
		return rv_img;
	}
	public void setRv_img(String rv_img) {
		this.rv_img = rv_img;
	}
	public String getRv_title() {
		return rv_title;
	}
	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
}
