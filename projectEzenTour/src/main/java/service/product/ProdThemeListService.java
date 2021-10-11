package service.product;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.PageDTO;
import Model.ProductDTO;
import repository.ProdRepository;

public class ProdThemeListService {

    int page_listcnt = 10;
	
	int page_paginationcnt = 10;
	
	@Autowired
	ProdRepository prodRepository;
	
	//리스트
	public List<ProductDTO> activityList(int page, String prodTheme){
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		return prodRepository.productThemeList(prodTheme, rowBounds);
	}
	
	public List<ProductDTO> heelingList(int page, String prodTheme){
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		return prodRepository.productThemeList(prodTheme, rowBounds);
	}
	
	public List<ProductDTO> foodList(int page, String prodTheme){
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		return prodRepository.productThemeList(prodTheme, rowBounds);
	}
	
	public List<ProductDTO> histroyList(int page, String prodTheme){
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		return prodRepository.productThemeList(prodTheme, rowBounds);
	}
	
	
	//액티비티 카운트,페이징
	public PageDTO activeCount(int currentPage) {
		int content_cnt = prodRepository.activeCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageDTO;
	}
	
	public void activeCount1(Model model) {
		int activeCount = prodRepository.activeCount();
		model.addAttribute("activeCount", activeCount);
	}
	
	//힐링 카운트,페이징
		public PageDTO heelingCount(int currentPage) {
			int content_cnt = prodRepository.heelingCount();
			PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
			return pageDTO;
		}
		
		public void heelingCount1(Model model) {
			int heelingCount = prodRepository.heelingCount();
			model.addAttribute("heelingCount", heelingCount);
		}
		
		//푸드 카운트,페이징
		public PageDTO foodCount(int currentPage) {
			int content_cnt = prodRepository.foodCount();
			PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
			return pageDTO;
		}
		
		public void foodCount1(Model model) {
			int foodCount = prodRepository.foodCount();
			model.addAttribute("foodCount", foodCount);
		}
		
		//히스토리 카운트,페이징
		public PageDTO histroyCount(int currentPage) {
			int content_cnt = prodRepository.histroyCount();
			PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
			return pageDTO;
		}
		
		public void histroyCount1(Model model) {
			int histroyCount = prodRepository.histroyCount();
			model.addAttribute("histroyCount", histroyCount);
		}

}
