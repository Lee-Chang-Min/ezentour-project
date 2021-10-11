package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.CouponDTO;
import Model.OrderTravelDTO;

public class CouponRegistRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.couponRegistMapper";
	String statement;
	
	
	public String cpNo() {
		statement = namespace + ".cpNo";
		return sqlSession.selectOne(statement);
	}
	public void couponIn(CouponDTO dto) {
		statement=namespace+".couponIn";
		int i = sqlSession.insert(statement,dto);
		System.out.println(i + "개가 삽입되었습니다");//디버깅코드
	}
}
