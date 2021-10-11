package service.member;

import org.springframework.beans.factory.annotation.Autowired;

import Model.MemberDTO;
import repository.MemberRepository;

public class MemberService {
	@Autowired
	MemberRepository memberRepository;
	public String idChk(MemberDTO dto) {
		String result = memberRepository.idChk(dto);
		return result;
	}
}
