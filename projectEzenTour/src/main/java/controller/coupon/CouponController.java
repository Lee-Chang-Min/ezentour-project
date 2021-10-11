package controller.coupon;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.coupon.CouponUseSelect;
import service.coupon.CpMemberInsertService;



@Controller
@RequestMapping("cp")
public class CouponController {
	@Autowired
	CpMemberInsertService cpMemberInsertService;
	@Autowired
	CouponUseSelect couponUseSelect;
	
	@RequestMapping("cpMemInsert")
	public String cpMemInsert(@RequestParam(value="cpNo")String cpNo,HttpSession session) {
		cpMemberInsertService.cpMemInsert(cpNo,session);
		return "redirect:../main"; 	
	}
	
	@RequestMapping("coupon")
	public String couponHome(HttpSession session,Model model) {
		couponUseSelect.cpUseSelect(session,model);
		return "coupon/couponHome";
	}
}
