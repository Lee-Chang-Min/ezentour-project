package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.ProductDTO;

public class SearchRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace="mappers.prodMapper";
	String statement;
	
	public List<ProductDTO> searchadd(String prodName) {
		statement = namespace + ".searchadd";
		return sqlSession.selectList(statement,prodName);
	}
}
