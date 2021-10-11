package service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.ProductHotelDTO;
import command.ProductHotelCommand;
import repository.ProdRepository;

public class HotelRecommandDetailService {
	@Autowired
	ProdRepository prodRepository;
	

	  public void HRecommandDetail(ProductHotelCommand productHotelCommand, Model model) { 
		
		  ProductHotelDTO dto4 = new ProductHotelDTO();
		/*
		 * dto4.setHotelDTO(new HotelDTO()); dto4.setProductDTO(new ProductDTO());
		 * dto4.getHotelDTO().setHotelType(productHotelCommand.getHotelType());
		 * dto4.getProductDTO().setProdTheme(productHotelCommand.getProdTheme());
		 */
		  dto4.setHotelType(productHotelCommand.getHotelType());
		  dto4.setProdTheme(productHotelCommand.getProdTheme());
		  
	  
		  List<ProductHotelDTO> list = prodRepository.HRecommandDetail(dto4);
		  model.addAttribute("list",list); 
	 }
	 
}
