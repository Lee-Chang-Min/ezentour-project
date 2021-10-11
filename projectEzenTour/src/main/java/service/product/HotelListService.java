package service.product;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.HotelDTO;
import Model.PageDTO;
import repository.ProdRepository;


public class HotelListService {
	
	int page_listcnt = 10;
	
	int page_paginationcnt = 10;
	
	@Autowired
	ProdRepository prodRepository;
	
	public void hotelList(int page,Model model) {
		  int start = (page - 1) * page_listcnt; 
		  RowBounds rowBounds= new RowBounds(start, page_listcnt);
		  List<HotelDTO> hotelList = prodRepository.hotelList(rowBounds);
		  model.addAttribute("hotelList", hotelList);
	}

	public void hotelCount(int currentPage,Model model) {
		int content_cnt = prodRepository.hotelCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		model.addAttribute("pageDTO", pageDTO);
	}

}
