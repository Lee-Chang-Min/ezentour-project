package service.product;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Model.ProductDTO;
import command.ProdCommand;
import repository.ProdRepository;

public class ProductUpdateService {
	
	@Autowired
	ProdRepository prodRepository;
	
	public void prodUpdate(ProdCommand prodCommand, HttpSession session) {
		
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
		
		String [] fileNames = prodCommand.getFileDel1().split(",");
		
		ProductDTO dto1 = prodRepository.prodDetail(prodCommand.getProdNo().toString());
		
		dto.setProdImage(dto1.getProdImage());
		
		//파일 추가
		String realPath = session.getServletContext().getRealPath("WEB-INF/view/product/upload");
		
		String storeFile = ""; 
		if(prodCommand.getProdImage()[0].getOriginalFilename().trim() != "") {
			for(MultipartFile mf : prodCommand.getProdImage()) {
				String original = mf.getOriginalFilename();
				String fileNameExt = original.substring(original.lastIndexOf("."));
				
				String store = UUID.randomUUID().toString().replace("-", "")+fileNameExt;
				
				File file = new File(realPath + "/" + store);
				
				try {
					mf.transferTo(file);
				} 
				catch (Exception e) {
					e.printStackTrace();
					} 
				storeFile = storeFile + store + ","; 
			}
		}
		
		String prodFileName = dto1.getProdImage();
		
		if(!fileNames[0].equals("")) {		
			for(String s : fileNames) {
				
				String delfile = s+ ",";
				
				prodFileName = prodFileName.replace(delfile,"");
				File file = new File(realPath + "/" + s);
				if(file.exists()) {
					file.delete();
				}
			}
		
		}
		dto.setProdImage(prodFileName);
		
		if(dto.getProdImage() != null) {
			dto.setProdImage(storeFile + dto.getProdImage());
		}else {
			dto.setProdImage(storeFile);
		}
		prodRepository.prodUpdate(dto);
	}
}
