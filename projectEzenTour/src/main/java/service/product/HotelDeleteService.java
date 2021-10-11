package service.product;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import Model.HotelDTO;
import repository.ProdRepository;

public class HotelDeleteService {
	@Autowired
	ProdRepository prodRepository;
	public void hotelDel(int hotelNo, HttpSession session) {
		HotelDTO dto = prodRepository.hotelDetail(hotelNo);
		if(dto.getHotelImage() != null) {
			String [] fileNames = dto.getHotelImage().split(",");
			String realPath = 
					session.getServletContext().getRealPath("WEB-INF/view/hotel/upload");
			if(fileNames != null  && !fileNames[0].equals("")) {
				for(String fileName : fileNames) {
					File file = new File(realPath + "/" + fileName);
					if(file.exists()) {
						file.delete();
					}
				}
			}
		}
		prodRepository.hotelDel(hotelNo);
	}

}
