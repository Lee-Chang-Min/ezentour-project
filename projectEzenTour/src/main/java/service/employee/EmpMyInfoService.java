package service.employee;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;
import Model.EmployeeDTO;
import repository.EmployeeRepository;
@Service
public class EmpMyInfoService {
	@Autowired
	EmployeeRepository employeeRepository;
	public void empMyInfoService(HttpSession session, Model model) {
		AuthInfoDTO authInfo=(AuthInfoDTO)session.getAttribute("authInfo");
		String empId=authInfo.getGrade();
		System.out.println("12312321dd"+empId);
		EmployeeDTO dto=employeeRepository.empInfo(empId);
		model.addAttribute("employeeCommand", dto);
	}
}
