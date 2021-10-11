package service.product;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.PageDTO;
import Model.ProductDTO;
import repository.ProdRepository;

public class ProductLocationListService {
	
    int page_listcnt = 10;
	
	int page_paginationcnt = 10;
	
	
	
	@Autowired
	ProdRepository prodRepository;
	
	public List<ProductDTO> seoulList(int page, String prodLocation){
		
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		System.out.println(prodLocation);
	
		return prodRepository.productLocationList(prodLocation, rowBounds);
		
	}
	
	public List<ProductDTO> gyeList(int page, String prodLocation){
	
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		System.out.println(prodLocation);
	
		return prodRepository.productLocationList(prodLocation, rowBounds);
		
	}
	
	public List<ProductDTO> jejuList(int page, String prodLocation){
		
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		System.out.println(prodLocation);
	
		return prodRepository.productLocationList(prodLocation, rowBounds);
		
	}
	
	public List<ProductDTO> gsdList(int page, String prodLocation){
		
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		System.out.println(prodLocation);
	
		return prodRepository.productLocationList(prodLocation, rowBounds);
		
	}

	//서울 카운트
	public PageDTO seoulCount(int currentPage) {
		
		int content_cnt = prodRepository.seoulCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageDTO;
	}
	
	public void seoulCount1(Model model) {
		int seoulCount = prodRepository.seoulCount();
		model.addAttribute("seoulCount", seoulCount);
		
	}
	
	//경기도 카운트
	public PageDTO gyeCount(int currentPage) {
		
		int content_cnt = prodRepository.gyeCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageDTO;
	}
	
	public void gyeCount1(Model model) {
		int gyeCount = prodRepository.gyeCount();
		model.addAttribute("gyeCount", gyeCount);
		
	}
	
	//제주도 카운트
	public PageDTO jejuCount(int currentPage) {
		
		int content_cnt = prodRepository.jejuCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageDTO;
	}
	
	public void jejuCount1(Model model) {
		int jejuCount = prodRepository.jejuCount();
		model.addAttribute("jejuCount", jejuCount);
		
	}
	
	//경상도 카운트
	public PageDTO gsdCount(int currentPage) {
		
		int content_cnt = prodRepository.gsdCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);

		return pageDTO;
	}
	
	public void gsdCount1(Model model) {
		int gsdCount = prodRepository.gsdCount();
		model.addAttribute("gsdCount", gsdCount);
		
	}
	

	
	
	
	
	

}