package service.member;

import org.springframework.beans.factory.annotation.Autowired;

import Model.MemberDTO;
import command.MemberCommand;
import repository.MemberRepository;

public class MemberModService {
	@Autowired
	MemberRepository memberRepository;
	public void memMod(MemberCommand memberCommand) {
		
		MemberDTO dto = new MemberDTO();
		dto.setMemAddr(memberCommand.getMemAddr());
		dto.setMemAddrDetail(memberCommand.getMemAddrDetail());
		dto.setMemAddrPost(memberCommand.getMemAddrPost());
		dto.setMemEmail(memberCommand.getMemEmail());
		dto.setMemEmailAd(memberCommand.getMemEmailAd());
		dto.setMemPh(memberCommand.getMemPh());
		dto.setMemId(memberCommand.getMemId());
		memberRepository.memMod(dto);
		
		
		
		
		
	}
}
