package service.member;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import Model.MemberDTO;
import command.MemberCommand;
import repository.MemberRepository;

public class MemberJoinService {
	@Autowired
	MemberRepository memberRepository;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public void memJoin(MemberCommand memberCommand) {
		MemberDTO dto = new MemberDTO();
		
		dto.setMemId(memberCommand.getMemId());
		dto.setMemName(memberCommand.getMemName());
		dto.setMemPw(bcryptPasswordEncoder.encode(memberCommand.getMemPw()));
		dto.setMemPh(memberCommand.getMemPh());
		dto.setMemBirth(memberCommand.getMemBirth());
		dto.setMemGender(memberCommand.getMemGender());
		dto.setMemAddr(memberCommand.getMemAddr());
		dto.setMemAddrDetail(memberCommand.getMemAddrDetail());
		dto.setMemAddrPost(memberCommand.getMemAddrPost());
		dto.setMemEmail(memberCommand.getMemEmail());
		dto.setMemEmailAd(memberCommand.getMemEmailAd());
		
		SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMddHHmmss");
		
		memberRepository.memJoin(dto);
		
	}
	

}
