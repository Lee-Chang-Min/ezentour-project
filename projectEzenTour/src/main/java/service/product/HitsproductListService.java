package service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.ProductDTO;
import repository.ProdRepository;

public class HitsproductListService {
	@Autowired
	ProdRepository prodRepository;
	public void hitsList(Model model){
	List<ProductDTO>hitsList=prodRepository.hitsList();
	model.addAttribute("hitsList", hitsList);
		
	}
}
