package controller.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.product.ProductBuyService;
import service.product.ProductWishAddService;
import service.product.ProductWishListService;
import service.product.ProductWishRemoveService;
import service.product.WishProdDeleteService;
@Controller
@RequestMapping("wish")
public class ProductWishController {
	@Autowired
	ProductWishAddService productWishAddService;
	@Autowired
	ProductWishListService productWishListService;
	@Autowired
	ProductBuyService productBuyService;
	@Autowired
	ProductWishRemoveService productWishRemoveService;
	@Autowired
	WishProdDeleteService wishProdDeleteService;
		
	
	@RequestMapping(value = "productWishAdd", method = RequestMethod.POST)
	public String prodWishAdd(@RequestParam(value="prodNo") String prodNo,Model model, HttpSession session) {
		productWishAddService.wishAdd(prodNo, session, model);
		return "product/wishAdd";
	}
	@RequestMapping("productWishList")
	public String prodWishList(HttpSession session, Model model) {
		productWishListService.wishList(session, model);
		return "product/prodWish";
	}
	@RequestMapping(value = "productBuy" , method = RequestMethod.POST)
	public String prodBuy(@RequestParam(value="prodCk") String [] prodNoms,HttpSession session, Model model) {
		productBuyService.prodBuy(prodNoms, session, model);
		return "product/order";
	}
	@RequestMapping("productWishRemove")
	public String prodWishRemove(@RequestParam(value = "prodNo") String prodNos,HttpSession session) {
		productWishRemoveService.wishRemove(prodNos, session);
		return "redirect:prodWishList";
	}
	@RequestMapping("wishProdDel")
	public String wishProdDel(@RequestParam(value="prodNo") String prodNo,HttpSession session) {
		wishProdDeleteService.wishProdDel(prodNo,session);
		return "redirect:prodWishList";
	}
}
