package service.member;

import org.springframework.beans.factory.annotation.Autowired;

import repository.MemberRepository;

public class MemberDropService {
	@Autowired
	MemberRepository memberRepository;
	
	public void memDrop(String memId) {
		memberRepository.memDrop(memId);
	}
}
