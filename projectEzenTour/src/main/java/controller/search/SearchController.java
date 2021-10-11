package controller.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import command.MemberCommand;
import service.search.FindPasswordService;
import service.search.IdFindFinishService;

@Controller
@RequestMapping("search")

public class SearchController {
	@Autowired
 	IdFindFinishService idFindFinishService;
	@Autowired
	FindPasswordService findPasswordService;
	
	
	@RequestMapping("idFind")
	public String idFind() {
		return"main/idSearch";
	}
	@RequestMapping("idFindFinish")
	public String idFindFinish(MemberCommand memberCommand,Model model) {
		idFindFinishService.idFind(memberCommand, model);
		return "main/idFindFinish";
	}
	@RequestMapping("findPassword")
	public String findPassword() {
		return "main/findPassword";
	}
	@RequestMapping("findPasswordPro")
	public String findPasswordPro(MemberCommand memberCommand,Model model) {
		String path= findPasswordService.findPassword(memberCommand, model);
		return path;
	}
}