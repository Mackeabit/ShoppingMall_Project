package vo;

public class PayVO {
	private int pay_idx, user_idx, pay_money, pay_status;
	private String pay_cd, od_mi;

	public int getPay_status() {
		return pay_status;
	}
	public void setPay_status(int pay_status) {
		this.pay_status = pay_status;
	}
	public String getOd_mi() {
		return od_mi;
	}
	public void setOd_mi(String od_mi) {
		this.od_mi = od_mi;
	}
	public int getPay_idx() {
		return pay_idx;
	}
	public void setPay_idx(int pay_idx) {
		this.pay_idx = pay_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getPay_money() {
		return pay_money;
	}
	public void setPay_money(int pay_money) {
		this.pay_money = pay_money;
	}
	public String getPay_cd() {
		return pay_cd;
	}
	public void setPay_cd(String pay_cd) {
		this.pay_cd = pay_cd;
	}
	
}
