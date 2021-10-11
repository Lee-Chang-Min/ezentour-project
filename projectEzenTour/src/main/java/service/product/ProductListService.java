package service.product;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import Model.PageDTO;
import Model.ProductDTO;
import repository.ProdRepository;

public class ProductListService {
	
	int page_listcnt = 10;
	
	int page_paginationcnt = 10;
	
	@Autowired
	ProdRepository prodRepository;
	
	//페이징
	public List<ProductDTO> prodList(int page) {
		  int start = (page - 1) * page_listcnt; 
		  RowBounds rowBounds= new RowBounds(start, page_listcnt);
		  return prodRepository.prodList(rowBounds);
	}

	
	public PageDTO productCount(int currentPage) {
		int content_cnt = prodRepository.productCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageDTO;
	}
	
	public void productAllCount(Model model) {
		int productCount = prodRepository.productCount();
		model.addAttribute("productCount", productCount);
	}
	
	
	
	
	
}
