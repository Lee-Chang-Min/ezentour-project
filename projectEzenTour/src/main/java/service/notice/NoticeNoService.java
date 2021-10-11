package service.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import repository.NoticeRepository;

@Service
public class NoticeNoService {
	@Autowired
	NoticeRepository noticeRepository;
	public void noticeNo(Model model) {
		String ntNo=noticeRepository.noticeNo();
		model.addAttribute("ntNo", ntNo);
	}
}
