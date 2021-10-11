package service.member;

import org.springframework.beans.factory.annotation.Autowired;

import Model.MemberDTO;
import command.MemberCommand;
import repository.MemberRepository;

public class MemberUpdateService {
@Autowired
MemberRepository memberRepository;
public void memUpdate(MemberCommand memberCommand) {
	MemberDTO dto =new MemberDTO();
	dto.setMemAddrPost(memberCommand.getMemAddrPost());
	dto.setMemAddr(memberCommand.getMemAddr());
	dto.setMemAddrDetail(memberCommand.getMemAddrDetail());
	dto.setMemPh(memberCommand.getMemPh());
	dto.setMemEmail(memberCommand.getMemEmail());
	dto.setMemEmailAd(memberCommand.getMemEmailAd());
	dto.setMemId(memberCommand.getMemId());
	memberRepository.memUpdate(dto);
}
	
}
