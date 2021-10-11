package service.purchase;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.PurchaseListDTO;
import repository.PurchaseRepository;

public class PurchaseListService {
	@Autowired
	PurchaseRepository purchaseRepository;
	public void purchaseList(HttpSession session, Model model) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		
		List<PurchaseListDTO> list =purchaseRepository.purchaseList(memId);
		model.addAttribute("list",list);
	}
}
