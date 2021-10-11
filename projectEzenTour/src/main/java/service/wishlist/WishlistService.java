package service.wishlist;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.ProductDTO;
import Model.WishDTO;
import repository.WishlistRepository;

@Service
public class WishlistService { //Wishlist추가를 위한 서비스클래스
	@Autowired
	WishlistRepository wishlistRepository;
	
	public void goodsWishAdd(String prodNum, HttpSession session, Model model) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		WishDTO dto = new WishDTO();
		
		dto.setMemId(memId);
		dto.setProdNo(prodNum);
		
		int i = wishlistRepository.wishAdd(dto);
		model.addAttribute("num", i);
	}
	
	public void getWishList(HttpSession session, Model model) {
		
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		System.out.println("WishlistService idCheck: "+memId);
		
		List<ProductDTO> list = wishlistRepository.getWishList(memId);
		model.addAttribute("wishlist", list);

	}
	
	public void getWishCount(HttpSession session, Model model,String prodNo) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		WishDTO dto = new WishDTO();
		dto.setMemId(memId);
		dto.setProdNo(prodNo);
		
		int wishResult = wishlistRepository.getWishCount(dto);
		model.addAttribute("wishResult", wishResult);
		
	}
	
	public void deleteWish(String prodNo, HttpSession session) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		WishDTO dto = new WishDTO();
		dto.setMemId(memId);
		dto.setProdNo(prodNo);
		
		wishlistRepository.deleteWish(dto);
	}
}


