package service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import repository.ProdRepository;

public class HotelNumberService {
	@Autowired
	ProdRepository prodRepository;
	public void hotelNo(Model model) {
		int hotelNo = prodRepository.hotelNo();
		model.addAttribute("hotelNo", hotelNo);
	}

}
