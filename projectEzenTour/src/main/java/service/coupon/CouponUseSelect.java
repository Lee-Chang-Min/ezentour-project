package service.coupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.CouponDTO;
import repository.CouponRepository;

public class CouponUseSelect {
	@Autowired
	CouponRepository couponRepository;
	
	public void cpUseSelect(HttpSession session,Model model) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		List<CouponDTO> list = couponRepository.cpUseSelect(memId);
		model.addAttribute("cpUse",list);
	}
}
