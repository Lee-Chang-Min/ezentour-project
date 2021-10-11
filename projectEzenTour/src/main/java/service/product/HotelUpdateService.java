
package service.product;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import Model.HotelDTO;
import command.HotelCommand;
import repository.ProdRepository;

public class HotelUpdateService {
	@Autowired
	ProdRepository prodRepository;

	public void hotelUpdate(HotelCommand hotelCommand, HttpSession session) {

		HotelDTO dto = new HotelDTO();
		
		// 컨텐츠 수정
	
		dto.setHotelNo(hotelCommand.getHotelNo());
		dto.setHotelName(hotelCommand.getHotelName());
		dto.setHotelPh(hotelCommand.getHotelPh());
		dto.setHotelAddr(hotelCommand.getHotelAddr());
		dto.setHotelBedPrice(hotelCommand.getHotelBedPrice());
		dto.setHotelMealPrice(hotelCommand.getHotelMealPrice());
		dto.setHotelPrice(hotelCommand.getHotelPrice());
		dto.setHotelRoomType(hotelCommand.getHotelRoomType());
		dto.setHotelContent(hotelCommand.getHotelContent());

		// 파일 수정
		String[] fileNames = hotelCommand.getFileDel1().split(",");
		
		// 디비에 저장되어있는 파일명을 가져오기 위함
		HotelDTO dto1 = prodRepository.hotelDetail(hotelCommand.getHotelNo());
		
		// 파일 추가
		String realPath = session.getServletContext().getRealPath("WEB-INF/view/hotel/upload");

		// 새로운 파일 추가하기위해 변수 생성
		String storeFile = "";
		if (hotelCommand.getHotelImage()[0].getOriginalFilename().trim() != "") {// 이미지가 ""(빈공간)이 아니라면
			for (MultipartFile mf : hotelCommand.getHotelImage()) {
				String original = mf.getOriginalFilename();
				String fileNameExt = original.substring(original.lastIndexOf("."));

				String store = // 랜덤으로 문자열을 받아옴
						UUID.randomUUID().toString().replace("-", "") + fileNameExt;

				File file = new File(realPath + "/" + store);
				try {
					mf.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				storeFile = storeFile + store + ",";
			}
		}

		String hotelFileName = dto1.getHotelImage();

		if (!fileNames[0].equals("")) {// 이미지 파일이 있다면
			// 파일삭제
			for (String s : fileNames) {
				// db에있는 이미지 파일명을 제거(replace)
				String delfile = s + ",";
		
				hotelFileName = hotelFileName.replace(delfile, "");// 파일명변경
				File file = new File(realPath + "/" + s);
				if (file.exists()) {
					file.delete();
				}
			}
			// 이미지 파일이 변경된 경우, 수정된 내용으로 다시 저장
		}
		
		dto.setHotelImage(hotelFileName);
		if (dto1.getHotelImage() == null) {
			if(storeFile.equals(""))
				dto.setHotelImage(null);
			else
				dto.setHotelImage(storeFile);
		} else {
			dto.setHotelImage(storeFile + dto.getHotelImage());
		} // 추가된 파일에, 기존에 생성된 파일
	
		prodRepository.hotelUpdate(dto);

	}

}