package controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import service.member.MemberDetailService;
import service.member.MemberDropService;
import service.member.MemberModService;
import service.member.MemberPwConfirmService;
import service.member.MemberPwUpdateService;
import validator.MemberPasswordValidator;

@Controller
@RequestMapping("memMy")
public class MemberMyController {
	@Autowired
	MemberDetailService memberDetailService;
	@Autowired
	MemberModService memberModService;
	@Autowired
	MemberDropService memberDropService;
	@Autowired
	MemberPwConfirmService memberPwConfirmService;
	@Autowired
	MemberPwUpdateService memberPwUpdateService;
	
	
	//회원탈퇴
	@RequestMapping("memDrop")
	public String memDrop(String memId) {
		memberDropService.memDrop(memId);	
		return "main/main";
	}	
	
	//회원수정
	@RequestMapping("memModAction")
	public String memModAction(MemberCommand memberCommand) {
		memberModService.memMod(memberCommand);
		return "member/myHome";
	}
	
	@RequestMapping("memMyMod")
	public String memMyMod(Model model,HttpSession session) {
		memberDetailService.memDetail(model,session);
		return "member/myMod";
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		return "member/myHome";
	}
	
	//멤버 비밀번호 페이지 이동
	@RequestMapping("memPwChange")
	public String memPwChange() {
		return "member/pwChang";
	}
	
	//비밀번호 비교
	@RequestMapping("pwChangeOk")
	public String pwChangeOk(@RequestParam(value = "memPw") String memPw,HttpSession session,Model model,
		@ModelAttribute MemberCommand memberCommand) {
		String path = memberPwConfirmService.memPw(memPw,session,model);
		return path ;
	}
	
	//비밀번호 변경 
	@RequestMapping("changePw")
	public String changePw(MemberCommand memberCommand,Errors errors,HttpSession session) {
		new MemberPasswordValidator().validate(memberCommand, errors);
		if(errors.hasErrors()) {
			return "member/pwChangeOk";
		}
		memberPwUpdateService.memPwUpdate(memberCommand,errors,
				session);
		if(errors.hasErrors()) {
			return "member/pwChangeOk";
		}
		return "redirect:/";
	}
}
