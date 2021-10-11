package service.payment;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.OrderTravelRepository;

@Service
public class PaymentNoService {
@Autowired
OrderTravelRepository orderTravelRepository;
public void paymentNo(Model model) {
	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	String paymentNo = df.format(new Date());
	model.addAttribute("paymentNo", paymentNo);
	
}
}
