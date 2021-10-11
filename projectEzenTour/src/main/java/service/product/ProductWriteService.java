package service.product;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Model.AuthInfoDTO;
import Model.ProductDTO;
import command.ProdCommand;
import repository.ProdRepository;

public class ProductWriteService {
	@Autowired
	ProdRepository prodRepository;
	public void prodInsert(ProdCommand prodCommand,HttpSession session) {
		
		ProductDTO dto = new ProductDTO();
		
		dto.setProdNo(prodCommand.getProdNo());
		dto.setProdName(prodCommand.getProdName());
		dto.setProdPrice(prodCommand.getProdPrice());
		dto.setProdDetail(prodCommand.getProdDetail());
		dto.setMaxPer(prodCommand.getMaxPer());
		dto.setProdLocation(prodCommand.getProdLocation());
		dto.setProdTheme(prodCommand.getProdTheme());
		dto.setProdSDate(prodCommand.getProdSDate());
		dto.setProdEDate(prodCommand.getProdEDate());
		dto.setHotelNo(prodCommand.getHotelNo());		

		
		
		String prodImage= "";
		if(!prodCommand.getProdImage()[0].getOriginalFilename().equals("")) {
			for(MultipartFile mf : prodCommand.getProdImage()) {
				
				String original = mf.getOriginalFilename();
				
				String originalExt = original.substring(original.lastIndexOf("."));
				
				String store = UUID.randomUUID().toString().replace("-","") + originalExt;
				
				prodImage += store + ",";
				
				String realPath = session.getServletContext().getRealPath("WEB-INF/view/product/upload");
				File file = new File(realPath + "/" + store);
				try {
					mf.transferTo(file);
				} 
				catch (Exception e) {
					e.printStackTrace();
				} 
			}
			dto.setProdImage(prodImage);
		}
		///////////////////////
		
		prodRepository.prodInsert(dto);	
	}

}
