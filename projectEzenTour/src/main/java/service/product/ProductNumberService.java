package service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import repository.ProdRepository;

public class ProductNumberService {
	@Autowired
	ProdRepository prodRepository;
	public void prodNo(Model model) {
		String prodNo = prodRepository.prodNo();
		model.addAttribute("prodNo", prodNo);
	}
}
