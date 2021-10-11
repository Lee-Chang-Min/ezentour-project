	package controller.employee;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.EmployeeCommand;
import service.employee.EmployeeDeleteService;
import service.employee.EmployeeInfoService;
import service.employee.EmployeeJoinService;
import service.employee.EmployeeListService;
import service.employee.EmployeeNumService;
import service.employee.EmployeeUpdateService;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	@Autowired
	EmployeeNumService employeeNumService;
	@Autowired
	EmployeeJoinService employeeJoinService;
	@Autowired
	EmployeeListService employeeListService;
	@Autowired
	EmployeeInfoService employeeInfoService;
	@Autowired
	EmployeeUpdateService employeeUpdateService;
	@Autowired
	EmployeeDeleteService employeeDeleteService;


	//직원리스트 List
	@RequestMapping(value="/empList", method = RequestMethod.GET)
	public String empList(Model model,@RequestParam(value="page" , defaultValue = "1")Integer page) {
		employeeListService.empList(model, page);
		return "employee/employeeList";	
	}
	
	//직원등록, empNo 페이지
	@RequestMapping(value = "empRegist", method = RequestMethod.GET)
	public String empRegist(Model model, EmployeeCommand employeeCommand) {
		employeeNumService.empNo(model, employeeCommand);
		return "employee/employeeForm";
	}
	
	//직원등록 ->직원리스트로이동
	@RequestMapping("empJoin")
	public String empJoin(Model model, EmployeeCommand employeeCommand) {
		employeeJoinService.empInsert(employeeCommand);
		return "redirect:empList";
	}
	
	//직원리스트 -> 직원 디테일 페이지로 이동
	@RequestMapping("empInfo")
	public String empInfo(@RequestParam(value = "empId") String empId,Model model) {
		employeeInfoService.empInfo(empId, model);
		return "employee/employeeInfo";
	}
	
	//직원 마이페이지 -> 직원 수정
	@RequestMapping("empModify")
	public String empModify( @RequestParam(value="empId") String empId,Model model) {
		employeeInfoService.empInfo(empId, model);
		return "employee/employeeModify";
	}
	
	//직원 업데이트
	@RequestMapping(value="empModifyOk" ,method = RequestMethod.POST)
	public String empModifyOk(EmployeeCommand employeeCommand) {
		employeeUpdateService.empUpdate(employeeCommand);
		return "redirect:empList";
	}
	
	//직원 삭제
	@RequestMapping("empDelete")
	public String empDelete( @RequestParam(value = "empId") String empId) {
		employeeDeleteService.empDelete(empId);
		return "redirect:empList";
	}
}
