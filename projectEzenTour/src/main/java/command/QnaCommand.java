package command;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QnaCommand {
   String qnaNo;
   String memId;
   String prodNo;
   String qnaTitle;
   String qnaContent;
   String qnaCtgr;
   @DateTimeFormat (pattern = "yyyy-MM-dd")
   Date qnaDate;
   String replyNo;
   String empId;
   String replyTitle;
   String replyContent;

   public String getQnaNo() {
      return qnaNo;
   }
   public void setQnaNo(String qnaNo) {
      this.qnaNo = qnaNo;
   }
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
   public String getQnaTitle() {
      return qnaTitle;
   }
   public void setQnaTitle(String qnaTitle) {
      this.qnaTitle = qnaTitle;
   }
   public String getQnaContent() {
      return qnaContent;
   }
   public void setQnaContent(String qnaContent) {
      this.qnaContent = qnaContent;
   }
   public String getQnaCtgr() {
      return qnaCtgr;
   }
   public void setQnaCtgr(String qnaCtgr) {
      this.qnaCtgr = qnaCtgr;
   }
   public Date getQnaDate() {
      return qnaDate;
   }
   public void setQnaDate(Date qnaDate) {
      this.qnaDate = qnaDate;
   }
   public String getReplyNo() {
      return replyNo;
   }
   public void setReplyNo(String replyNo) {
      this.replyNo = replyNo;
   }
   public String getEmpId() {
      return empId;
   }
   public void setEmpId(String empId) {
      this.empId = empId;
   }
   public String getReplyTitle() {
      return replyTitle;
   }
   public void setReplyTitle(String replyTitle) {
      this.replyTitle = replyTitle;
   }
   public String getReplyContent() {
      return replyContent;
   }
   public void setReplyContent(String replyContent) {
      this.replyContent = replyContent;
   }   
   
}