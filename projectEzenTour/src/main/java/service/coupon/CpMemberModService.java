package service.coupon;

import org.springframework.beans.factory.annotation.Autowired;

import repository.CouponRepository;

public class CpMemberModService {
	@Autowired 
	CouponRepository couponRepository;
	public void cpMemMod(String cpNo) {
		couponRepository.cpMemMod(cpNo);
	}
}
