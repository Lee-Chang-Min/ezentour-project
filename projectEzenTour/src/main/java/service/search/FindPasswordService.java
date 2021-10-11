package service.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import Model.MemberDTO;
import command.MemberCommand;
import controller.RamdomPassword;
import repository.MemberRepository;

public class FindPasswordService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	public String findPassword(MemberCommand memberCommand,Model model) {

		MemberDTO dto=memberRepository.memInfo(memberCommand.getMemId());
		if(dto != null) {
			if(memberCommand.getMemEmail().equals(dto.getMemEmail())) {
				String pass=RamdomPassword.getRamdomPassword(10);
				String encodePass =bcryptPasswordEncoder.encode(pass);
				dto.setMemPw(encodePass);
				memberRepository.memPwUpdate(dto);
			
			System.out.println(pass);	
			model.addAttribute("pass", pass);
				return "main/passView";
			}else {
				model.addAttribute("errEmail", "잘못된 이메일 정보입니다.");
				return "main/findPassword";
			}
		}else {
			model.addAttribute("errMemId", "없거나 잘못된 아이디 정보입니다.");
			return "main/findPassword";
		}
		
	}
}
