package controller.member;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemberCommand;
import service.member.MemberDropService;
import service.member.MemberListService;
import service.member.MemberUpdateService;

@Controller
@RequestMapping("member")
public class MemberInfoController {
	@Autowired
	MemberListService memberListService;
	@Autowired
	MemberUpdateService memberUpdateService;
	@Autowired
	MemberDropService memberDropService;
	
	
	@RequestMapping("memInfo/{memId}")
	public String memInfo(@PathVariable(value = "memId") String memId,Model model) {
		memberListService.memList(model,memId,null);
		return "member/memberInfo";
	}
	
	@RequestMapping("memMod/{memId}")
	public String memMod(@PathVariable(value = "memId") String memId,Model model) {
		memberListService.memList(model,memId,null);
		return "member/memberModify";
	}
	
	@RequestMapping(value="memModifyOk", method = RequestMethod.POST)
	public String memUpdate(MemberCommand memberCommand) {
		memberUpdateService.memUpdate(memberCommand);
		String encodedParam = "";
		try {
			encodedParam = URLEncoder.encode(memberCommand.getMemId(), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:memInfo/"+encodedParam;
	}
	
	@RequestMapping("memDel")
	public String memDel(@RequestParam(value = "memId") String memId) {
		memberDropService.memDrop(memId);
		return "redirect:/";
	}
}
