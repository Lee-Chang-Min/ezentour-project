package service.notice;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.NoticeDTO;
import Model.PageDTO;
import repository.NoticeRepository;
@Service
public class NoticeListService {
	int page_listcnt = 10;
	
	int page_paginationcnt = 10;	
	@Autowired
	NoticeRepository noticeRepository;
	
	
	//notice
	public List<NoticeDTO> noticeList(int page) {
		  int start = (page - 1) * page_listcnt; 
		  RowBounds rowBounds= new RowBounds(start, page_listcnt);
		  return noticeRepository.noticeList(rowBounds);
	}
	public PageDTO noticeCount(int currentPage) {	
		int content_cnt = noticeRepository.noticeCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageDTO;
	}
	
	
	//event 
	public void eventList(int page,Model model) {
		int start = (page - 1) * page_listcnt; 
		RowBounds rowBounds= new RowBounds(start, page_listcnt);
		List<NoticeDTO> dto =noticeRepository.eventList(rowBounds);
		model.addAttribute("eventList", dto);
	}
	public void eventCount(int currentPage,Model model) {	
		int content_cnt = noticeRepository.eventCount();
		PageDTO pageDTO = new PageDTO(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		model.addAttribute("pageDTO", pageDTO);
	}
}
