package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import Model.ProductDTO;
import Model.WishDTO;

@Repository
public class WishlistRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.wishlistMapper";
	String statement;

	

	public int wishAdd(WishDTO dto) {
		statement = namespace + ".wishAdd";
		sqlSession.insert(statement, dto);
		statement = namespace + ".getWishCount";
		return sqlSession.selectOne(statement, dto);
	}
	
	public void deleteWish(WishDTO dto) {
		statement = namespace + ".deleteWish";
		sqlSession.delete(statement,dto);
	}
	public List<ProductDTO> getWishList(String memId){
		statement = namespace + ".getWishList";
		return sqlSession.selectList(statement,memId);
	}	
	public int getWishListPaging(String memId) {
		statement = namespace + ".getWishListPaging";
		return sqlSession.selectOne(statement, memId);
	}
	
	public int getWishCount(WishDTO dto) {
		statement = namespace + ".getWishCount";
		return sqlSession.selectOne(statement, dto);
	}
	
}
