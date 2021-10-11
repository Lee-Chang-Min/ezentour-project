package service.purchase;

import org.springframework.beans.factory.annotation.Autowired;

import Model.PurchaseListDTO;
import command.PaymentCommand;
import repository.PurchaseRepository;

public class PurchaseListInsertService {
	@Autowired
	PurchaseRepository purchaseRepository;
	public void listInsert(PaymentCommand paymentCommand) { 	
		String orderNo = paymentCommand.getOrderNo();
		System.out.println(orderNo);
		purchaseRepository.listInsert(orderNo);
	}
}
