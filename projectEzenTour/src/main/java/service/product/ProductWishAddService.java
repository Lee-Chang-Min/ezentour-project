package service.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.WishDTO;
import repository.ProdRepository;

public class ProductWishAddService {
	@Autowired
	ProdRepository prodRepository;
	public void wishAdd(String prodNo, HttpSession session, Model model ) {
		AuthInfoDTO authInfo =  (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		System.out.println("Current WishList : " + memId);
		WishDTO dto = new WishDTO();
		dto.setMemId(authInfo.getUserId());
		dto.setProdNo(prodNo);
		int i = prodRepository.wishAdd(dto);
		model.addAttribute("no", i);
	}

}
