package controller.event;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.PageDTO;
import service.notice.NoticeListService;

@Controller
@RequestMapping("event")
public class EventController {
	@Autowired
	NoticeListService noticeListService;
	

	@RequestMapping("eventHome")
	public String eventHome(@RequestParam(value = "page", defaultValue = "1")int page, Model model) {
		noticeListService.eventList(page,model);
		noticeListService.eventCount(page,model);
		return "event/eventHome";
	}
}
