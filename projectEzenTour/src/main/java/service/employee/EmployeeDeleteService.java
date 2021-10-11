package service.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repository.EmployeeRepository;


@Service
public class EmployeeDeleteService {
	@Autowired
	EmployeeRepository employeeRepository;
	
	public void empDelete(String empId) {
		employeeRepository.empDelete(empId);
	}

}
