package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.MemberDTO;

public class MemberRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.memberMapper";
	String statement;
	
	
	//아이디 중복체크
	public String idChk(MemberDTO dto)  {
		statement = namespace + ".idChk";
		String result = sqlSession.selectOne(statement, dto);
		System.out.println(result+"개의 아디가있음");
		return result;
	}
	//회원탈퇴 
	public void memDrop(String memId) {
		statement = namespace + ".memDrop";
		int i = sqlSession.delete(statement,memId);
		System.out.println(i + "개가 삭제되었습니다");
	}
	//회원수정
	public void memMod(MemberDTO dto) {
		statement = namespace + ".memMod";
		int i = sqlSession.update(statement,dto);
		System.out.println(i + "개가 수정되었습니다");
	}
	//회원정보
	public MemberDTO memInfo(String memId) {
		statement = namespace + ".memInfo";
		return sqlSession.selectOne(statement, memId);
	}
	
	//회원등록
	public void memJoin(MemberDTO dto) {
		statement = namespace + ".memJoin";
		int i = sqlSession.insert(statement,dto);
		System.out.println(i+"개 추가 완료");
	}
	
	//회원 리스트
	public List<MemberDTO> memList(MemberDTO dto) {
		statement = namespace + ".memList";
		return sqlSession.selectList(statement, dto);
	}

	//회원 카운트
	public Integer getMemberCount() {
		statement = namespace +".getMemberCount";
		return sqlSession.selectOne(statement);
	}
	//회원 정보 불러오기

	//맴버수정
	public void memUpdate(MemberDTO dto) {
		statement = namespace + ".memUpdate";
		int i = sqlSession.update(statement, dto);
		System.out.println(i + "개가 수정되었습니다");
	}
	//아이디 찾기 
	public String idFind(MemberDTO dto) {
		statement = namespace + ".idFind";
		return sqlSession.selectOne(statement, dto);
	}
	//비밀번호 찾기 
	public void memPwUpdate(MemberDTO dto) {
		statement = namespace +".memPwUpdate";
		int i = sqlSession.update(statement, dto);
		System.out.println(i + "개가 삽입되었습니다");
	}
	
}
