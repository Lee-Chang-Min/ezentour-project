package controller.main;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.LogInCommand;
import service.main.LoginService;
import validator.LogInCommandValidator;

@Controller
@RequestMapping("login")
public class LogInController {
	
	@Autowired
	LoginService loginService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String main() {
		return "redirect:/";
	}

	@RequestMapping("login")
	public String loginpage() {
		return "main/login";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(LogInCommand logInCommand, Errors errors, HttpSession session, HttpServletResponse response) {
		new LogInCommandValidator().validate(logInCommand, errors);	
		if(errors.hasErrors()) {
			return "main/login";
		}
		loginService.logIn1(logInCommand, errors, session, response); 
		if(errors.hasErrors()) {
			return "main/login";
		}
		return "redirect:/";
	}
	
	@RequestMapping("logOut")
	public String logOut(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		return "redirect:/";
	}
}
