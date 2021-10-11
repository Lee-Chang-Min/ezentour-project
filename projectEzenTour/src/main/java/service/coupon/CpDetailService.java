package service.coupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.CouponDTO;
import command.OrderTravelCommand;
import repository.CouponRepository;

public class CpDetailService {
	@Autowired
	CouponRepository couponRepository;
	public void cpDetail(OrderTravelCommand orderTravelCommand,HttpSession session,Model model) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		
		CouponDTO dto = new CouponDTO();
		dto.setProdNo(orderTravelCommand.getProdNo());
		dto.setMemId(memId);
		CouponDTO dto2 = couponRepository.cpDetail(dto);
		model.addAttribute("cpMem",dto2);
	}
}
