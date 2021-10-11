package service.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;


import Model.ProductDTO;
import repository.ProdRepository;

public class OrderService {
	@Autowired
	ProdRepository prodRepository;
	public void orderDetail(String prodNo,Model model ) {
		ProductDTO dto=prodRepository.prodDetail(prodNo);

		model.addAttribute("dto",dto);
	}
}
