package controller.wishlist;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Model.ProductDTO;
import service.product.ProductListService;
import service.wishlist.WishlistService;


//위시리스트 컨트롤러
//로그인필요없음
//결제하기 클릭시 결제창 넘어가기, 비로그인회원인 경우 로그인요청
//위시리스트는 쿠키에 저장 (쿠키 보관기간 1일)

@Controller
@RequestMapping("wish")
public class WishlistController {

	@Autowired
	WishlistService wishlistService;
	@Autowired
	ProductListService productListService;

	@RequestMapping("wishlist")
	public String wishlist(HttpSession session, Model model) {
		wishlistService.getWishList(session, model);
		return "wishlist/wishlist";
	}
}
