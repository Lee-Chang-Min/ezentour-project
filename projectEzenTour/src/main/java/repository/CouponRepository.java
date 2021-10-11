package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.CouponDTO;



public class CouponRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.couponMapper";
	String statement;
	
	
	public List<CouponDTO> cpUseSelect(String memId) {
		statement = namespace + ".cpUseSelect";
		return sqlSession.selectList(statement,memId);
	}
	
	public CouponDTO cpMemSelect(CouponDTO dto) {
		statement = namespace + ".cpMemSelect";
		return sqlSession.selectOne(statement,dto);
	}
	
	public void cpMemMod(String cpNo) {
		statement = namespace + ".cpMemMod";
		int i = sqlSession.update(statement,cpNo);
		System.out.println(i + "개의 쿠폰멤버가 수정되었습니다.");
	}
	
	public CouponDTO cpDetail(CouponDTO dto) {
		statement = namespace + ".cpDetail";
		return sqlSession.selectOne(statement,dto);
	}
	
	public void cpMemberInsert(CouponDTO dto) {
		statement = namespace + ".cpMemberInsert";
		int i = sqlSession.insert(statement,dto);
		System.out.println(i + "개의 쿠폰멤버가 삽입되었습니다");
	}
	
	public CouponDTO cpSelect(String prodNo) {
		statement = namespace + ".cpSelect";
		return sqlSession.selectOne(statement,prodNo);
	}
	
}
