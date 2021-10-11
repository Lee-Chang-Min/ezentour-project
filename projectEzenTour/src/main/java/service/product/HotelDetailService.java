package service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.HotelDTO;
import Model.ProductDTO;
import repository.ProdRepository;

public class HotelDetailService {
	@Autowired
	ProdRepository prodRepository;

	public void hotelViewDetail(String hotelNo, String prodNo, Model model) {
	ProductDTO dto2 = new ProductDTO();
	
	dto2.setProdNo(prodNo);
	HotelDTO dto = prodRepository.hotelViewDetail(dto2);
	model.addAttribute("hotelViewCommand", dto);
	}

	
	public void hotelDetail(int hotelNo, String prodNo, Model model) {
	HotelDTO dto = prodRepository.hotelDetail(hotelNo);
	model.addAttribute("hotelCommand", dto);
	}
	 

}
