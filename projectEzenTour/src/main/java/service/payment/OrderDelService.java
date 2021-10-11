package service.payment;

import org.springframework.beans.factory.annotation.Autowired;

import repository.OrderTravelRepository;

public class OrderDelService {
	@Autowired
	OrderTravelRepository orderTravelRepository;
	
	public void orderDel(String orderNo) {
		orderTravelRepository.orderDel(orderNo);
	}
}
