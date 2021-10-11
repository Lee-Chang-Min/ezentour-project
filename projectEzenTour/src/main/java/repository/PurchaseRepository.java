package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.PurchaseListDTO;


public class PurchaseRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.purchaseMapper";
	String statement;
		
	
	public void listInsert(String orderNo) {
		statement= namespace + ".listInsert";
		int i = sqlSession.insert(statement,orderNo);
		System.out.println(i + "구매리스트가 삽입되었습니다");
	}
	public List<PurchaseListDTO> purchaseList(String memId) {
		statement= namespace + ".purchaseList";
		return sqlSession.selectList(statement,memId);
	}
}
