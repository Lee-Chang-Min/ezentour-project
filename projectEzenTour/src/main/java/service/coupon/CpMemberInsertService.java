package service.coupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.AuthInfoDTO;
import Model.CouponDTO;
import repository.CouponRepository;

public class CpMemberInsertService {
	@Autowired
	CouponRepository couponRepository;
	public void cpMemInsert(String cpNo,HttpSession session) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		CouponDTO dto = new CouponDTO();
		dto.setCpNo(cpNo);
		dto.setMemId(memId);
		
		
		couponRepository.cpMemberInsert(dto);
	}
}
