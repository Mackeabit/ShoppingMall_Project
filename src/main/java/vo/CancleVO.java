package vo;

public class CancleVO {
	private int cl_idx, od_idx, cl_status, user_idx;
	private String cancle_date;

	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getCl_idx() {
		return cl_idx;
	}
	public void setCl_idx(int cl_idx) {
		this.cl_idx = cl_idx;
	}
	public int getOd_idx() {
		return od_idx;
	}
	public void setOd_idx(int od_idx) {
		this.od_idx = od_idx;
	}
	public int getCl_status() {
		return cl_status;
	}
	public void setCl_status(int cl_status) {
		this.cl_status = cl_status;
	}
	public String getCancle_date() {
		return cancle_date;
	}
	public void setCancle_date(String cancle_date) {
		this.cancle_date = cancle_date;
	}
	
}
