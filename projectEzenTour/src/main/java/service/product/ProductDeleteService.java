package service.product;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.ProductDTO;
import repository.ProdRepository;

public class ProductDeleteService {
	@Autowired
	ProdRepository prodRepository; 
	
	public void prodDel(String prodNo, HttpSession session) {
		ProductDTO dto = prodRepository.prodDetail(prodNo);
		if(dto.getProdImage() != null) {
			String [] fileNames = dto.getProdImage().split(",");
			String realPath = 
					session.getServletContext().getRealPath("WEB-INF/view/product/upload");
			if(fileNames != null  && !fileNames[0].equals("")) {
				for(String fileName : fileNames) {
					File file = new File(realPath + "/" + fileName);
					if(file.exists()) {
						file.delete();
					}
				}
			}
		}
		prodRepository.prodDel(prodNo);
	}
}
