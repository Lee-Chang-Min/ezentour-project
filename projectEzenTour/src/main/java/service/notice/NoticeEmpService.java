package service.notice;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import Model.AuthInfoDTO;

@Service
public class NoticeEmpService {
	public void emp(Model model,HttpSession session) {
		AuthInfoDTO authInfo=(AuthInfoDTO)session.getAttribute("authInfo");
		String empId=authInfo.getGrade();
		model.addAttribute("empId", empId);
	}
}
