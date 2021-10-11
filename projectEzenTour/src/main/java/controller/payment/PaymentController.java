package controller.payment;

	
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.OrderTravelCommand;
import command.PaymentCommand;
import service.coupon.CpDetailService;
import service.coupon.CpMemberModService;
import service.member.MemberDetailService;
import service.payment.HotelNoService;
import service.payment.OrderDelService;
import service.payment.OrderInService;
import service.payment.OrderNoService;
import service.payment.OrderService;
import service.payment.PaymentNoService;
import service.payment.PaymentOkService;
import service.payment.PaymentPageService;
import service.purchase.PurchaseListInsertService;
import service.purchase.PurchaseListService;



@Controller
@RequestMapping("pay")
public class PaymentController {
	@Autowired
	OrderService orderService;
	@Autowired
	HotelNoService hotelNoService;
	@Autowired
	OrderNoService orderNoService;
	@Autowired
	OrderInService orderInService;
	@Autowired
	PaymentPageService paymentPageService;
	@Autowired
	PaymentNoService paymentNoService;
	@Autowired
	PaymentOkService paymentOkService;
	@Autowired
	PurchaseListInsertService purchaseListInsertService;
	@Autowired
	OrderDelService orderDelService;
	@Autowired
	PurchaseListService purchaseListService;
	@Autowired
	CpDetailService cpDetailService;
	@Autowired
	MemberDetailService memberDetailService;
	@Autowired
	CpMemberModService cpMemberModService;
	
	
	
	@RequestMapping("payment")
	public String payment(@RequestParam(value = "prodNo")String prodNo,Model model,HttpSession session ){
		orderService.orderDetail(prodNo, model);
		hotelNoService.hotelNo(prodNo, model);
		orderNoService.orderNo(model);
		return "payment/order";
	}

	//오더 실행
	@RequestMapping(value="orderIn" ,method =RequestMethod.POST) 
	public String orderIn(@RequestParam(value = "orderNo")String orderNo,HttpSession session,OrderTravelCommand orderTravelCommand,Model model) {
		orderInService.orderIn(session, orderTravelCommand);
		paymentPageService.paymentPage(orderNo, model);
		paymentNoService.paymentNo(model);
		cpDetailService.cpDetail(orderTravelCommand,session,model);
		memberDetailService.memDetail(model, session);
		return "payment/paymentPage";
	}
	
	@RequestMapping("paymentFail")
	public String paymentFail() {
		return "purchase/paymentFail";
	}
	
	//결제 실행
	@RequestMapping(value = "paymentOk", method =RequestMethod.POST )
	public String paymentOk(PaymentCommand paymentCommand,@RequestParam(value="cpNo")String cpNo,HttpSession session, Model model,HttpServletRequest request) {
		if(paymentCommand.getOrderNo() == null) {
			return "redirect:paymentFail";
		}
		//다른페이지에서 돌아올때 결제 막기
		System.out.println(request.getHeader("referer")); // 이전페이지 보기
		paymentOkService.paymentIn(paymentCommand);
		purchaseListInsertService.listInsert(paymentCommand);
		purchaseListService.purchaseList(session,model);
		cpMemberModService.cpMemMod(cpNo);
		return "purchase/purchaseList";
	}
	
	//결제취소 되었을때 삭제
	@RequestMapping("orderDel")
	public String orderDel(@RequestParam(value="orderNo")String orderNo) {
		orderDelService.orderDel(orderNo);
		//쿠폰사용여부도 초기화하는 서비스 
		return "redirect:../main";
	}
	
}
