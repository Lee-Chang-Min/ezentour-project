package service.product;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Model.AuthInfoDTO;
import Model.HotelDTO;
import command.HotelCommand;
import repository.ProdRepository;

public class HotelWriteService {
	@Autowired
	ProdRepository prodRepository;

	public void hotelInsert(HotelCommand hotelCommand, HttpSession session) {

		HotelDTO dto = new HotelDTO();

		dto.setHotelNo(hotelCommand.getHotelNo());
		dto.setHotelName(hotelCommand.getHotelName());
		dto.setHotelAddr(hotelCommand.getHotelAddr());
		dto.setHotelPh(hotelCommand.getHotelPh());
		dto.setHotelRoomType(hotelCommand.getHotelRoomType());
		dto.setHotelPrice(hotelCommand.getHotelPrice());
		dto.setHotelMealPrice(hotelCommand.getHotelMealPrice());
		dto.setHotelBedPrice(hotelCommand.getHotelBedPrice());
		dto.setHotelContent(hotelCommand.getHotelContent());
		dto.setHotelType(hotelCommand.getHotelType());
		
		String hotelImage = "";
		if (!hotelCommand.getHotelImage()[0].getOriginalFilename().equals("")) {
			for (MultipartFile mf : hotelCommand.getHotelImage()) {

				String original = mf.getOriginalFilename();
				
				String originalExt = original.substring(original.lastIndexOf("."));
				
				String store = UUID.randomUUID().toString().replace("-", "") + originalExt;
				
				hotelImage += store + ",";
				
				String realPath = session.getServletContext().getRealPath("WEB-INF/view/hotel/upload");
				
				File file = new File(realPath + "/" + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dto.setHotelImage(hotelImage);
		}
		 

		prodRepository.hotelInsert(dto);
	}

}
