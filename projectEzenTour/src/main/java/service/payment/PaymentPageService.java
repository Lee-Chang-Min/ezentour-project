package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.OrderTravelDTO;
import command.OrderTravelCommand;
import repository.OrderTravelRepository;

@Service
public class PaymentPageService {
	@Autowired
	OrderTravelRepository orderTravelRepository;
	public void paymentPage(String orderNo,Model model) {
		OrderTravelDTO dto  =orderTravelRepository.orderDetail(orderNo);
		model.addAttribute("orderD", dto);
		
	}
}
