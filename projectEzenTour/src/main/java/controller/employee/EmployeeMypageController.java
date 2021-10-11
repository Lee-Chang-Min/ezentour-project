package controller.employee;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.employee.EmpMyInfoService;


@Controller
@RequestMapping("empmy")
public class EmployeeMypageController {
	@Autowired
	EmpMyInfoService empMyInfoService;
	
	//자신의emp 정보 
	@RequestMapping("myInfo")
	public String empMypage(HttpSession session, Model model) {
		empMyInfoService.empMyInfoService(session, model);
		return "employee/employeeDetail";
	}
}
