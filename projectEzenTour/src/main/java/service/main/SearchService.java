package service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.ProductDTO;
import repository.SearchRepository;


public class SearchService {
	@Autowired
	SearchRepository searchRepository;
	public void Search(String prodName ,Model model) {
		 List<ProductDTO> list = searchRepository.searchadd(prodName);
		 model.addAttribute("searchList", list);
	}	
}
