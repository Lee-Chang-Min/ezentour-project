package service.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.PaymentDTO;
import command.PaymentCommand;
import repository.OrderTravelRepository;

@Service
public class PaymentOkService {
	@Autowired
	OrderTravelRepository orderTravelRepository;
	public void paymentIn(PaymentCommand paymentCommand) {
		PaymentDTO dto =new PaymentDTO(); 	
		dto.setCpNo(paymentCommand.getCpNo());
		dto.setOrderNo(paymentCommand.getOrderNo());
		dto.setPaymentNo(paymentCommand.getPaymentNo());
		dto.setTotalPrice(paymentCommand.getTotalPrice());
		orderTravelRepository.paymentadd(dto);
	
	}
}
