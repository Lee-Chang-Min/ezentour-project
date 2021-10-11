package service.notice;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import Model.NoticeDTO;
import command.NoticeCommand;
import repository.NoticeRepository;

@Service
public class NoticeWriteService {
	@Autowired
	NoticeRepository noticeRepository;
	public void noticeWrite(NoticeCommand noticeCommand) {	
		NoticeDTO dto=new NoticeDTO();
		dto.setEmpId(noticeCommand.getEmpId());
		dto.setNoticeCon(noticeCommand.getNoticeCon());
		dto.setNoticeKind(noticeCommand.getNoticeKind());
		dto.setNoticeNo(noticeCommand.getNoticeNo());
		dto.setNoticeSub(noticeCommand.getNoticeSub());
		noticeRepository.noticeWrite(dto);
	}
}
