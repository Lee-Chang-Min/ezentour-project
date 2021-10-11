package service.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.AuthInfoDTO;
import Model.WishDTO;
import repository.ProdRepository;

public class WishProdDeleteService {
	@Autowired
	ProdRepository prodRepository;
	public void wishProdDel(String prodNo, HttpSession session) {
		AuthInfoDTO authInfo = 
				(AuthInfoDTO)session.getAttribute("authInfo");
		String memId= authInfo.getUserId();
		WishDTO dto = new WishDTO();
		dto.setProdNo(prodNo);
		dto.setMemId(memId);
		prodRepository.wishProdDel(dto);
	}

}
