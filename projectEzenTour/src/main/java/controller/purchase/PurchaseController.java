package controller.purchase;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.purchase.PurchaseListService;

@Controller
@RequestMapping("pl")
public class PurchaseController {
@Autowired
PurchaseListService purchaseListService;
	
	
	@RequestMapping("OrderProcessList")
	public String purchaseList(HttpSession session, Model model) {
		purchaseListService.purchaseList(session,model);
		return "purchase/purchaseList";
	}
}
