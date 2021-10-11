package service.coupon;

import org.springframework.beans.factory.annotation.Autowired;

import Model.CouponDTO;
import command.CouponCommand;
import repository.CouponRegistRepository;

public class CouponInService {
@Autowired
CouponRegistRepository couponRegistRepository;
public void couPonIn(CouponCommand couponCommand) {
	CouponDTO dto= new CouponDTO();
	dto.setCpDiscount(couponCommand.getCpDiscount());
	dto.setCpNo(couponCommand.getCpNo());
	dto.setProdNo(couponCommand.getProdNo());
	couponRegistRepository.couponIn(dto);
	
}
}
