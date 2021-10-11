package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.OrderTravelRepository;
@Service
public class OrderNoService {
	@Autowired
	OrderTravelRepository orderTravelRepository;
	public void orderNo(Model model) {
		String orderNo = orderTravelRepository.orderNo();
		model.addAttribute("orderNo", orderNo);
	}
}
