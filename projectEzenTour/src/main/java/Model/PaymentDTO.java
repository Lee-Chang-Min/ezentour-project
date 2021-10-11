package Model;

import java.util.Date;

public class PaymentDTO {
	String paymentNo;
	String orderNo;
	Date paymentApprDate;
	String cpNo;
	String totalPrice;
	
	
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Date getPaymentApprDate() {
		return paymentApprDate;
	}
	public void setPaymentApprDate(Date paymentApprDate) {
		this.paymentApprDate = paymentApprDate;
	}
	public String getCpNo() {
		return cpNo;
	}
	public void setCpNo(String cpNo) {
		this.cpNo = cpNo;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
}
