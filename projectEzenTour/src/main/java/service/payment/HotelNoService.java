package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.HotelDTO;
import Model.ProductHotelDTO;
import repository.OrderTravelRepository;

public class HotelNoService {
	@Autowired
	OrderTravelRepository orderTravelRepository;
	public void hotelNo(String prodNo,Model model) {
		
		ProductHotelDTO dto1 =orderTravelRepository.hotelNo(prodNo);
		
		model.addAttribute("hotelNo",dto1);
	
	}
}
