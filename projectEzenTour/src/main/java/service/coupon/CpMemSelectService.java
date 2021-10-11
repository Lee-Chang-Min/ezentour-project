package service.coupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.CouponDTO;
import repository.CouponRepository;

public class CpMemSelectService {
	@Autowired
	CouponRepository couponRepository;
	public void cpMemSelect(String prodNo,  HttpSession session,Model model) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		CouponDTO dto = new CouponDTO();
		dto.setMemId(memId);
		dto.setProdNo(prodNo);
		
		CouponDTO dto2 = couponRepository.cpMemSelect(dto);
		model.addAttribute("cpMemCk",dto2);
	}
}
