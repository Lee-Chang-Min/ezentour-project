package Model;

public class CouponDTO {
	String cpNo;
	String cpDiscount;
	String prodNo;
	
	
	//cpMember
	String memId;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
	public String getCpNo() {
		return cpNo;
	}
	public void setCpNo(String cpNo) {
		this.cpNo = cpNo;
	}
	public String getCpDiscount() {
		return cpDiscount;
	}
	public void setCpDiscount(String cpDiscount) {
		this.cpDiscount = cpDiscount;
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	
}
