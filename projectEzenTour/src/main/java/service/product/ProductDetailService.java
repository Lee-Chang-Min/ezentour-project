package service.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.ProductDTO;
import repository.ProdRepository;

public class ProductDetailService {
	@Autowired
	ProdRepository prodRepository;
	public void prodDetail(String prodNo, Model model ) {
		prodRepository.prodReadUpdate(prodNo);
		ProductDTO dto  = prodRepository.prodDetail(prodNo);
		model.addAttribute("prodCommand",dto);
		
	}
	

}
