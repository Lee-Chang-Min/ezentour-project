package service.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.CouponRegistRepository;
@Service
public class CouponNoService {
	@Autowired
	CouponRegistRepository couponRegistRepository;
	public void CpNo(Model model) {
		String cpNo = couponRegistRepository.cpNo();
		model.addAttribute("cpNo", cpNo);
	}
}
