package service.payment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.OrderTravelDTO;
import command.OrderTravelCommand;
import repository.OrderTravelRepository;

@Service
public class OrderInService {
	@Autowired
	OrderTravelRepository orderTravelRepository;
	public void orderIn(HttpSession session,OrderTravelCommand orderTravelCommand) {
	 AuthInfoDTO authInfo=(AuthInfoDTO)session.getAttribute("authInfo");
	 String memId=authInfo.getUserId();
	 OrderTravelDTO dto =new  OrderTravelDTO();
	 dto.setMemId(memId);
	 dto.setHotelBed(orderTravelCommand.getHotelBed());
	 dto.setHotelMealPax(orderTravelCommand.getHotelMealPax());
	 dto.setOrderCount(orderTravelCommand.getOrderCount());
	 dto.setOrderNo(orderTravelCommand.getOrderNo());
	 dto.setOrderTotalPrice(orderTravelCommand.getOrderTotalPrice());
	 dto.setProdNo(orderTravelCommand.getProdNo());
	 
	 System.out.println(dto.getProdNo());
	 System.out.println(dto.getOrderTotalPrice());
	 System.out.println(dto.getOrderCount());
	 System.out.println(dto.getHotelBed());
	 System.out.println(dto.getHotelMealPax());
	 System.out.println(dto.getMemId());
	 System.out.println(dto.getOrderNo());
	
	 orderTravelRepository.orderadd(dto);
	}
}
