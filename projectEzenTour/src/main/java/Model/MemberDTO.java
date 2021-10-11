package Model;

import java.util.Date;

public class MemberDTO {
	String memId;
	String memPw;
	String memName;
	Date memBirth;
	String memGender;
	String memPh;
	String memEmail;
	String memEmailAd;
	String memAddr;
	String memAddrDetail;
	String memAddrPost;
	String cpNo;
	

	StartEndPageDTO startEndPageDTO;
	public StartEndPageDTO getStartEndPageDTO() {
		return startEndPageDTO;
	}
	public void setStartEndPageDTO(StartEndPageDTO startEndPageDTO){
		this.startEndPageDTO = startEndPageDTO;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public Date getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemPh() {
		return memPh;
	}
	public void setMemPh(String memPh) {
		this.memPh = memPh;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemEmailAd() {
		return memEmailAd;
	}
	public void setMemEmailAd(String memEmailAd) {
		this.memEmailAd = memEmailAd;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemAddrDetail() {
		return memAddrDetail;
	}
	public void setMemAddrDetail(String memAddrDetail) {
		this.memAddrDetail = memAddrDetail;
	}
	public String getMemAddrPost() {
		return memAddrPost;
	}
	public void setMemAddrPost(String memAddrPost) {
		this.memAddrPost = memAddrPost;
	}
	public String getCpNo() {
		return cpNo;
	}
	public void setCpNo(String cpNo) {
		this.cpNo = cpNo;
	}
	
	
	
}
