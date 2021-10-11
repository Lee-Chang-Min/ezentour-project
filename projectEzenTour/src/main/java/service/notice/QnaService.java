package service.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.QnaDTO;
import repository.QnaRepository;

@Service
public class QnaService {

	@Autowired
	QnaRepository qnaRepository;
	
	public void addQnaInfo(QnaDTO qnaDTO) {
		qnaRepository.addQnaInfo(qnaDTO);
	}
	public void modifyQnaInfo(QnaDTO qnaDTO) {
		qnaRepository.modifyQnaInfo(qnaDTO);
	}
	public QnaDTO getQnaInfo(int qnaNo) {

		return qnaRepository.getQnaInfo(qnaNo);
	}
	public void deleteQnaInfo(int qnaNo) {
		qnaRepository.deleteQnaInfo(qnaNo);
	}
	public void getQnaList(Model model){
		List<QnaDTO> qnaList = qnaRepository.getQnaList();
		model.addAttribute("qnaList", qnaList);
	}
	
}
