package controller.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Model.ProductDTO;
import command.CouponCommand;
import service.coupon.CouponInService;
import service.coupon.CouponNoService;
import service.product.ProductListService;

@Controller
@RequestMapping("couponregist")
public class CouponRegistController {
	@Autowired
	CouponNoService couponNoService;
	@Autowired
	CouponInService couponInService;
	@Autowired
	ProductListService productListService;
	
	//쿠폰번호 넘겨서 쿠폰 등록페이지로
	@RequestMapping("cpregist")
	public String cpregist(@RequestParam(value = "page", defaultValue = "1") int page,Model model){
		List<ProductDTO> prodList = productListService.prodList(page);
		model.addAttribute("prodList", prodList);
		couponNoService.CpNo(model);
		return "coupon/couponregist";
	}
	//쿠폰번호 받아서 쿠폰 등록하기
	@RequestMapping(value="CouponWrite",method =RequestMethod.POST)
	public String CouponWrite(@RequestParam(value="cpNo")String CpNo,CouponCommand couponCommand) {
		couponInService.couPonIn(couponCommand);		
		return "redirect:../main";
	}
}
