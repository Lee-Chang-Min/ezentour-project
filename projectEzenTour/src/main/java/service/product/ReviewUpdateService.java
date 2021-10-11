package service.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.ReviewDTO;
import command.ReviewCommand;
import repository.ProdRepository;

public class ReviewUpdateService {
	
	@Autowired
	ProdRepository prodRepository;
	
	public void reviewUpdate(ReviewCommand reviewCommand) {
		ReviewDTO dto = new ReviewDTO();
		dto.setProdNo(reviewCommand.getProdNo());
		dto.setPaymentNo(reviewCommand.getPaymentNo());
		dto.setReviewContent(reviewCommand.getReviewContent());
		dto.setReviewStar(reviewCommand.getReviewStar());
		prodRepository.reviewUpdate(dto);
	}
	
	public void reviewInfo(String paymentNo, String prodNo, Model model, HttpSession session) {
		ReviewDTO dto = new ReviewDTO();
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		dto.setMemId(memId);
		dto.setProdNo(prodNo);
		dto.setPaymentNo(paymentNo);
		dto = prodRepository.reviewInfo(dto);
		model.addAttribute("dto", dto);
	}
	

}
