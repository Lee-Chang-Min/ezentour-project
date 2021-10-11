package service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Model.EmployeeDTO;
import command.EmployeeCommand;
import repository.EmployeeRepository;

public class EmployeeJoinService {
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	public void empInsert(EmployeeCommand employeeCommand) {
		EmployeeDTO dto = new EmployeeDTO();
		dto.setEmpNo(employeeCommand.getEmpNo());
		dto.setEmpId(employeeCommand.getEmpId());
		dto.setEmpPw(bcryptPasswordEncoder.encode(employeeCommand.getEmpPw()));
		dto.setEmpName(employeeCommand.getEmpName());
		dto.setHireDate(employeeCommand.getHireDate());
		dto.setEmpType(employeeCommand.getEmpType());
		dto.setEmpPh(employeeCommand.getEmpPh());
		dto.setEmpEmail(employeeCommand.getEmpEmail());
		dto.setEmpAddr(employeeCommand.getEmpAddr());

		//리포시토리생성
		employeeRepository.empInsert(dto);
	}

}
