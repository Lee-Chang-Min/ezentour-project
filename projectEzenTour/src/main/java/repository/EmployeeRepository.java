package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.EmployeeDTO;

public class EmployeeRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.employeeMapper";
	String statement;
	
	
	//직원 리스트페이지
	public List<EmployeeDTO> empList(EmployeeDTO dto){
		statement = namespace + ".empList";
		System.out.println("★★★★★★★");
		return sqlSession.selectList(statement, dto);
	}
	
	//카운트번호
	public int count() {
		statement = namespace + ".count";
		return sqlSession.selectOne(statement);
	}
	
	//직원등록
	public void empInsert(EmployeeDTO dto) {
		statement = namespace + ".empInsert";
		int i = sqlSession.insert(statement,dto);
		System.out.println(i + "개가 저장 되었습니다.");
	}
	
	
	//관리번호
	public String empNo() {
		statement = namespace + ".empNo";
		return sqlSession.selectOne(statement);
		
	}
	
	//직원 마이페이지
	public EmployeeDTO empInfo(String empId) {
		statement = namespace + ".empInfo";
		System.out.println("마이페이지 이동함");
		return sqlSession.selectOne(statement,empId); 
	}
	
	//직원 수정
	public void empUpdate(EmployeeDTO dto) {
		statement = namespace +".empUpdate";
		sqlSession.update(statement,dto);
		System.out.println(dto.getEmpId()+"를 수정하였습니다.");
	}
	
	//직원 삭제
	public void empDelete(String empId) {
		statement = namespace + ".empDelete";
		sqlSession.delete(statement, empId);
		System.out.println(empId + "을/를 삭제하였습니다.");	
	}
	//개별직원 마이페이지
	public EmployeeDTO empDetail(String empId) {
		statement = namespace + ".empDetail";
		return sqlSession.selectOne(statement,empId);
		
	}

	
	

}
