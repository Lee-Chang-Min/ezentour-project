package command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class ProdCommand {
	
	String prodNo;
	String prodName;
	Long prodPrice;
	String prodDetail;
	String maxPer;
	String prodLocation;
	String prodTheme;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date prodSDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date prodEDate;
	String hotelNo;
	MultipartFile [] prodImage; 
	String fileDel1;
	
	
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
	public MultipartFile[] getProdImage() {
		return prodImage;
	}
	public void setProdImage(MultipartFile[] prodImage) {
		this.prodImage = prodImage;
	}
	public String getFileDel1() {
		return fileDel1;
	}
	public void setFileDel1(String fileDel1) {
		this.fileDel1 = fileDel1;
	}
	


	

}
