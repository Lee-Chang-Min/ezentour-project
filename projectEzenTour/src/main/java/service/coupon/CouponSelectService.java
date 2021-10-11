package service.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.CouponDTO;
import repository.CouponRepository;

public class CouponSelectService {
	@Autowired
	CouponRepository couponRepository;
	public void cpSelect(String prodNo,Model model) {
		CouponDTO dto = couponRepository.cpSelect(prodNo);
		model.addAttribute("cp",dto);
	}
}
