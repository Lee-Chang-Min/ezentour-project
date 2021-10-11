package Model;

import java.util.Date;

public class OrderTravelDTO {
	String memId;
	String prodNo;
	Date orderDate;
	String orderNo;
	String orderCount;
	String hotelMealPax;
	String hotelBed;
	String orderTotalPrice;
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}
	public String getHotelMealPax() {
		return hotelMealPax;
	}
	public void setHotelMealPax(String hotelMealPax) {
		this.hotelMealPax = hotelMealPax;
	}
	public String getHotelBed() {
		return hotelBed;
	}
	public void setHotelBed(String hotelBed) {
		this.hotelBed = hotelBed;
	}
	public String getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(String orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}
}
