package service.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.ReviewDTO;
import repository.ProdRepository;

public class ReviewListService {
	
	@Autowired
	ProdRepository prodRepository;
	
	public void reviewList(String prodNo, Model model) {

		System.out.println("asdfasdfasdf:" + prodNo);
				
		List<ReviewDTO> reviewList = prodRepository.reviewList(prodNo);
		model.addAttribute("reviewList", reviewList);
		
	}
	
	public void reviewAvg(String prodNo, Model model) {
		Double reviewAvg = prodRepository.reviewAvg(prodNo);
		model.addAttribute("reviewAvg", reviewAvg);
		
	}

}
