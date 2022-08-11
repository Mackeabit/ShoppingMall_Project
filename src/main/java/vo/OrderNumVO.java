package vo;

public class OrderNumVO {
	private int total, order_pay_complete, order_cancel, order_complete;
	public int getOrder_pay_complete() {
		return order_pay_complete;
	}
	public void setOrder_pay_complete(int order_pay_complete) {
		this.order_pay_complete = order_pay_complete;
	}
	public int getOrder_complete() {
		return order_complete;
	}
	public void setOrder_complete(int order_complete) {
		this.order_complete = order_complete;
	}
	public int getOrder_cancel() {
		return order_cancel;
	}
	public void setOrder_cancel(int order_cancel) {
		this.order_cancel = order_cancel;
	}
	private String od_date;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getOd_date() {
		return od_date;
	}
	public void setOd_date(String od_date) {
		this.od_date = od_date;
	}
	
}
