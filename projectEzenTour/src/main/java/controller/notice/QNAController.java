package controller.notice;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.AuthInfoDTO;
import Model.QnaDTO;
import command.QnaReplyCommand;
import service.notice.QnaService;

@Controller
@RequestMapping("/qna")
public class QNAController {
	@Autowired
	QnaService qnaService;

	
	@RequestMapping("/main")
	public String qnaMain(Model model, HttpSession session) {
		qnaService.getQnaList(model);
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		model.addAttribute("authInfo", authInfo);
		return "qna/main";
	}
	
	@RequestMapping("/reply")
	public String reply(@RequestParam("qnaNo") int qnaNo,@ModelAttribute("replyQnaContentBean") QnaDTO replyQnaContentBean,HttpSession session, Model model) {	
		 QnaDTO dto = qnaService.getQnaInfo(qnaNo);
		 
		 QnaDTO replyDto = new QnaDTO();
		 replyDto.setQnaContent(dto.getQnaContent());
		 replyDto.setQnaDate(dto.getQnaDate());
		 replyDto.setQnaNo(dto.getQnaNo());
		 replyDto.setQnaTitle(dto.getQnaTitle());
		 replyDto.setUserId(dto.getUserId());
		 replyDto.setQnaReply(dto.getQnaReply());
		 
		 model.addAttribute("replyQnaContentBean", replyDto);
		return "qna/reply";
	}
	
	@RequestMapping("/reply_pro")
	public String reply_pro(@ModelAttribute("replyQnaContentBean") QnaDTO replyQnaContentBean,Model model,BindingResult result) {
		if(result.hasErrors()) {
			return "qna/main";
		}
		
		qnaService.modifyQnaInfo(replyQnaContentBean);
		return "qna/reply_success";
	}

	@RequestMapping("/read")
	public String read(@RequestParam("qnaNo") int qnaNo,HttpSession session, Model model) {
		QnaDTO readQnaBean = qnaService.getQnaInfo(qnaNo);
		model.addAttribute("readQnaBean", readQnaBean);
		model.addAttribute("qnaNo", qnaNo);
		
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		model.addAttribute("authInfo", authInfo);
		return "qna/read";
	}

	@RequestMapping("/write")
	public String write(@ModelAttribute("writeQnaContentBean") QnaDTO writeQnaContentBean) {
		return "qna/write";
	}

	@PostMapping("/write_pro")
	public String write_pro(@ModelAttribute("writeQnaContentBean") QnaDTO writeQnaContentBean,HttpSession session,BindingResult result) {
		if (result.hasErrors()) {
			return "qna/write";
		}
		AuthInfoDTO authInfo = (AuthInfoDTO)session.getAttribute("authInfo");
		String userId = authInfo.getUserId();
		writeQnaContentBean.setUserId(userId);
		
		qnaService.addQnaInfo(writeQnaContentBean);
		
		return "qna/write_success";
	}

	@RequestMapping("/modify")
	public String modify(@RequestParam("qnaNo") int qnaNo, @ModelAttribute("modifyQnaBean") QnaDTO modifyQnaBean,Model model) {
		model.addAttribute("qnaNo", qnaNo);
		QnaDTO tempQnaBean = qnaService.getQnaInfo(qnaNo);

		modifyQnaBean.setQnaContent(tempQnaBean.getQnaContent());
		modifyQnaBean.setQnaDate(tempQnaBean.getQnaDate());
		modifyQnaBean.setQnaTitle(tempQnaBean.getQnaTitle());
		modifyQnaBean.setQnaNo(qnaNo);

		return "qna/modify";
	}
	
	@RequestMapping("/modify_pro")
	public String modifyPro(@ModelAttribute("modifyQnaBean") QnaDTO modifyQnaBean,Model model,BindingResult result) {
		if(result.hasErrors()) {
			return "qna/modify";
		}
		qnaService.modifyQnaInfo(modifyQnaBean);
		return "qna/modify_success";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("qnaNo") int qnaNo, Model model) {
		qnaService.deleteQnaInfo(qnaNo);
		return "qna/delete";
	}
}
