package service.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.AuthInfoDTO;
import repository.ProdRepository;

public class ProductWishRemoveService {
	@Autowired
	ProdRepository prodRepository;
	public void wishRemove(String prodNos, HttpSession session) {
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String memId = authInfo.getUserId();
		String [] prodNoMap = prodNos.split(",");
		
		List<String> cs = new ArrayList<String>();
		for(String prodNo : prodNoMap) {
			cs.add(prodNo);
		}
		Map<String, Object> condition =	new HashMap<String, Object>();
		condition.put("prodNo", cs);
		condition.put("memId", memId);
		prodRepository.wishRemove(condition);
	}

}
