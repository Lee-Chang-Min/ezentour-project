package service.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.ProductWishDTO;
import Model.WishDTO;
import repository.ProdRepository;

public class ProductBuyService {
	@Autowired
	ProdRepository prodRepository;
	public void prodBuy(String [] prodNos, HttpSession session,Model model) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		List<ProductWishDTO> list = new ArrayList<ProductWishDTO>();
		for(String prodNo : prodNos) {
			WishDTO dto = new WishDTO();
			dto.setMemId(memId);
			dto.setProdNo(prodNo);
			ProductWishDTO productWishDTO =	prodRepository.wishList(dto);
			list.add(productWishDTO);
		}
		model.addAttribute("lists", list);
	}

}
