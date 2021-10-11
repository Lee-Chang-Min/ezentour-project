package command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class ReviewCommand {
	
   String reviewStar;
   String prodNo;
   String paymentNo;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   Date reviewDate;
   String reviewContent;
   String memId;

 
 

public String getReviewStar() {
	return reviewStar;
}
public void setReviewStar(String reviewStar) {
	this.reviewStar = reviewStar;
}
public String getProdNo() {
	return prodNo;
}
public void setProdNo(String prodNo) {
	this.prodNo = prodNo;
}
public String getPaymentNo() {
	return paymentNo;
}
public void setPaymentNo(String paymentNo) {
	this.paymentNo = paymentNo;
}

public Date getReviewDate() {
	return reviewDate;
}
public void setReviewDate(Date reviewDate) {
	this.reviewDate = reviewDate;
}

public String getReviewContent() {
	return reviewContent;
}
public void setReviewContent(String reviewContent) {
	this.reviewContent = reviewContent;
}
public String getMemId() {
	return memId;
}
public void setMemId(String memId) {
	this.memId = memId;
}


   
}