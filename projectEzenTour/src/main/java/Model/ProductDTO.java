package Model;

import java.util.Date;


public class ProductDTO {
	String prodNo;
	String prodName;
	Long prodPrice;
	String prodDetail;
	String maxPer;
	String prodLocation;
	String prodTheme;
	Date prodSDate;
	Date prodEDate;
	String hotelNo;
	String prodImage;
	String prodCount;

	
	
	public String getProdCount() {
		return prodCount;
	}
	public void setProdCount(String prodCount) {
		this.prodCount = prodCount;
	}
	StartEndPageDTO startEndPageDTO;
	public StartEndPageDTO getStartEndPageDTO() {
		return startEndPageDTO;
	}
	public void setStartEndPageDTO(StartEndPageDTO startEndPageDTO) {
		this.startEndPageDTO = startEndPageDTO;
	}	
	
	
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Long getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(Long prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getMaxPer() {
		return maxPer;
	}
	public void setMaxPer(String maxPer) {
		this.maxPer = maxPer;
	}
	public String getProdLocation() {
		return prodLocation;
	}
	public void setProdLocation(String prodLocation) {
		this.prodLocation = prodLocation;
	}
	public String getProdTheme() {
		return prodTheme;
	}
	public void setProdTheme(String prodTheme) {
		this.prodTheme = prodTheme;
	}
	public Date getProdSDate() {
		return prodSDate;
	}
	public void setProdSDate(Date prodSDate) {
		this.prodSDate = prodSDate;
	}
	public Date getProdEDate() {
		return prodEDate;
	}
	public void setProdEDate(Date prodEDate) {
		this.prodEDate = prodEDate;
	}
	public String getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(String hotelNo) {
		this.hotelNo = hotelNo;
	}
	
	public String getProdImage() {
		return prodImage;
	}
	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}
}
