package service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.EmployeeDTO;
import command.EmployeeCommand;
import repository.EmployeeRepository;

@Service
public class EmployeeUpdateService {
	@Autowired
	EmployeeRepository employeeRepository;
	public void empUpdate(EmployeeCommand employeeCommand) {
		EmployeeDTO dto = new EmployeeDTO();
		dto.setEmpName(employeeCommand.getEmpName());
		dto.setEmpPh(employeeCommand.getEmpPh());
		dto.setEmpEmail(employeeCommand.getEmpEmail());
		dto.setEmpAddr(employeeCommand.getEmpAddr());
		dto.setEmpId(employeeCommand.getEmpId());
		employeeRepository.empUpdate(dto);
		
		System.out.println(dto.getEmpId());
		System.out.println("aaaaaaaaaaaaaaaaaaaaaa확인용");
	}
	

}
