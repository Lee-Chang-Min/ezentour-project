package service.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.ReviewDTO;
import command.ReviewCommand;
import repository.ProdRepository;

public class ReviewWriteService {
	
	@Autowired
	ProdRepository prodRepository;
	
	public void reviewInsert(ReviewCommand reviewCommand, HttpSession session) {
		ReviewDTO dto = new ReviewDTO();
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		dto.setMemId(memId);
		dto.setProdNo(reviewCommand.getProdNo());
		dto.setPaymentNo(reviewCommand.getPaymentNo());
		dto.setReviewContent(reviewCommand.getReviewContent());
		dto.setReviewStar(reviewCommand.getReviewStar());
		prodRepository.reviewWrite(dto);
		
	}
	
	

}
