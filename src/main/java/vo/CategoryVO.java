package vo;

import java.io.Serializable;

public class CategoryVO implements Serializable{
	
	private int category_cd;
	private String category_1, category_nm;
	
	public int getCategory_cd() {
		return category_cd;
	}
	public void setCategory_cd(int category_cd) {
		this.category_cd = category_cd;
	}
	public String getCategory_1() {
		return category_1;
	}
	public void setCategory_1(String category_1) {
		this.category_1 = category_1;
	}
	public String getCategory_nm() {
		return category_nm;
	}
	public void setCategory_nm(String category_nm) {
		this.category_nm = category_nm;
	}
	
}
