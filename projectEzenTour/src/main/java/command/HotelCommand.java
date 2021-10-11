package command;

import org.springframework.web.multipart.MultipartFile;

public class HotelCommand {
	int hotelNo;
	String hotelName;
	String hotelAddr;
	String hotelPh;
	String hotelRoomType;
	Long hotelPrice;
	Long hotelMealPrice;
	Long hotelBedPrice;
	String hotelContent;
	MultipartFile [ ] hotelImage;
	String fileDel1;
	String hotelType;
	
	
	
	public String getHotelType() {
		return hotelType;
	}
	public void setHotelType(String hotelType) {
		this.hotelType = hotelType;
	}
	public int getHotelNo() {
		return hotelNo;
	}
	public void setHotelNo(int hotelNo) {
		this.hotelNo = hotelNo;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getHotelAddr() {
		return hotelAddr;
	}
	public void setHotelAddr(String hotelAddr) {
		this.hotelAddr = hotelAddr;
	}
	public String getHotelPh() {
		return hotelPh;
	}
	public void setHotelPh(String hotelPh) {
		this.hotelPh = hotelPh;
	}
	public String getHotelRoomType() {
		return hotelRoomType;
	}
	public void setHotelRoomType(String hotelRoomType) {
		this.hotelRoomType = hotelRoomType;
	}
	public Long getHotelPrice() {
		return hotelPrice;
	}
	public void setHotelPrice(Long hotelPrice) {
		this.hotelPrice = hotelPrice;
	}
	public Long getHotelMealPrice() {
		return hotelMealPrice;
	}
	public void setHotelMealPrice(Long hotelMealPrice) {
		this.hotelMealPrice = hotelMealPrice;
	}
	public Long getHotelBedPrice() {
		return hotelBedPrice;
	}
	public void setHotelBedPrice(Long hotelBedPrice) {
		this.hotelBedPrice = hotelBedPrice;
	}
	public String getHotelContent() {
		return hotelContent;
	}
	public void setHotelContent(String hotelContent) {
		this.hotelContent = hotelContent;
	}
	public MultipartFile[] getHotelImage() {
		return hotelImage;
	}
	public void setHotelImage(MultipartFile[] hotelImage) {
		this.hotelImage = hotelImage;
	}
	public String getFileDel1() {
		return fileDel1;
	}
	public void setFileDel1(String fileDel1) {
		this.fileDel1 = fileDel1;
	}
	
}
