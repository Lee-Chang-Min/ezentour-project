package controller.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Model.NoticeDTO;
import Model.PageDTO;
import command.NoticeCommand;
import service.notice.NoticeDeleteService;
import service.notice.NoticeDetailService;
import service.notice.NoticeEmpService;
import service.notice.NoticeListService;
import service.notice.NoticeModifyService;
import service.notice.NoticeNoService;
import service.notice.NoticeWriteService;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	NoticeListService noticeListService;
	@Autowired
	NoticeNoService noticeNoService;
	@Autowired
	NoticeEmpService noticeEmpService;
	@Autowired
	NoticeWriteService noticeWriteService;
	@Autowired
	NoticeDetailService noticeDetailService;
	@Autowired
	NoticeModifyService noticeModifyService;
	@Autowired
	NoticeDeleteService noticeDeleteService;
	
	
	@RequestMapping("noticeList")
	public String noticeList(@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		List<NoticeDTO> dto =noticeListService.noticeList(page);
		model.addAttribute("noticeList", dto);
		PageDTO pageDTO = noticeListService.noticeCount(page);
		model.addAttribute("pageDTO", pageDTO);
		return "notice/noticeList";
	}
	
	@RequestMapping("noticeRegist")
	public String noticeRegist(Model model ,HttpSession session) {
		noticeNoService.noticeNo(model);
		noticeEmpService.emp(model, session);
		return "notice/noticeForm";
	}
	
	@RequestMapping(value="noticeWrite", method = RequestMethod.POST)
	public String U12in(NoticeCommand noticeCommand ) {
		noticeWriteService.noticeWrite(noticeCommand);
		return "redirect:noticeList";
	}
	
	@RequestMapping("noticeDetail")
	public String noticeDetail(@RequestParam(value="noticeNo")String noticeNo,Model model) {
		noticeDetailService.noticeDetail(noticeNo, model);
		return "notice/noticeView";
	}
	
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(@RequestParam(value="noticeNo")String noticeNo,Model model) {
		noticeDetailService.noticeDetail(noticeNo, model);
		return "notice/noticeModify";
	}
	
	@RequestMapping(value="noticeModify" , method =RequestMethod.POST)
	public String noticeModify(NoticeCommand noticeCommand) {
		noticeModifyService.noticeModify(noticeCommand);
		return "redirect:noticeList";
	}
	
	@RequestMapping("noticeDel")
	public String noticeDel(@RequestParam(value="noticeNo")String noticeNo) {
		noticeDeleteService.noticeDel(noticeNo);
		return "redirect:noticeList";
	}
	
}
