package repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.HotelDTO;
import Model.ProductDTO;
import Model.ProductHotelDTO;
import Model.ProductWishDTO;
import Model.ReviewDTO;
import Model.WishDTO;

public class ProdRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.prodMapper";
	String statement;
	
	//상품 카운트 
	public void prodReadUpdate(String prodNo) {
		statement= namespace+".prodReadUpdate";
		int i = sqlSession.update(statement,prodNo);
		
	}
	//호텔 추천 디테일
	public List<ProductHotelDTO> HRecommandDetail(ProductHotelDTO dto4) { 
		 statement = namespace + ".HRecommandDetail"; 
		 return sqlSession.selectList(statement,dto4); 
	}
	public String prodNo() {
		statement = namespace + ".prodNo";
		return sqlSession.selectOne(statement);
	}
	public void prodInsert(ProductDTO dto) {
		statement = namespace + ".prodInsert";
		int i = sqlSession.insert(statement, dto);
		System.out.println(i + "개가 삽입되었습니다");
	}
	// 아래부터 product 제품 카운트 부분
	public int productCount() {
		statement = namespace + ".productCount";
		return sqlSession.selectOne(statement);
	}
	public int seoulCount() {
		statement = namespace + ".seoulcount";
		return sqlSession.selectOne(statement);
	}
	
	public int gyeCount() {
		statement = namespace + ".gyeCount";
		return sqlSession.selectOne(statement);
	}
	
	public int jejuCount() {
		statement = namespace + ".jejuCount";
		return sqlSession.selectOne(statement);
	}
	
	public int gsdCount() {
		statement = namespace + ".gsdCount";
		return sqlSession.selectOne(statement);
	}
	
	public int activeCount() {
		statement = namespace + ".activeCount";
		return sqlSession.selectOne(statement);
	}
	
	public int heelingCount() {
		statement = namespace + ".heelingCount";
		return sqlSession.selectOne(statement);
	}
	
	public int foodCount() {
		statement = namespace + ".foodCount";
		return sqlSession.selectOne(statement);
	}
	
	public int histroyCount() {
		statement = namespace + ".histroyCount";
		return sqlSession.selectOne(statement);
	}
	//프로드 조회수 리스트 부분
	public List<ProductDTO> hitsList(){
		statement = namespace + ".hitsList";
		return sqlSession.selectList(statement);
	}
	// 아래부터 product 제품 리스트 부분
	public List<ProductDTO> prodList(RowBounds rowBounds){
		statement = namespace + ".prodList";
		return sqlSession.selectList(statement, null, rowBounds);
	}
	public List<ProductDTO> productLocationList(String prodLocation, RowBounds rowBounds){
		statement = namespace + ".productLocationList";
		return sqlSession.selectList(statement, prodLocation, rowBounds);
	}
	//테마리스트
	public List<ProductDTO> productThemeList(String prodTheme, RowBounds rowBounds){
		statement = namespace + ".productThemeList";
		System.out.println("asdfasdf:" + prodTheme);
		return sqlSession.selectList(statement, prodTheme, rowBounds);
	}
	public ProductDTO prodDetail(String prodNo) {
		statement = namespace + ".prodDetail";
		return sqlSession.selectOne(statement, prodNo) ;
	}
	public void prodUpdate(ProductDTO dto) {
		statement = namespace +".prodUpdate";
		sqlSession.update(statement, dto);
	}
	public void prodDel(String prodNo) {
		statement = namespace +".prodDel";
		sqlSession.delete(statement, prodNo);
	}
	//////////////////////// 호텔 부분 ///////////////////////////
	public int hotelNo() {
		statement = namespace + ".hotelNo";
		return sqlSession.selectOne(statement);
	}
	public void hotelInsert(HotelDTO dto) {
		statement = namespace + ".hotelInsert";
		int i = sqlSession.insert(statement, dto);
		System.out.println(i + "개가 삽입되었습니다");
	}
	//호텔 리스트
	public List<HotelDTO> hotelList(RowBounds rowBounds){
		statement = namespace + ".hotelList";
		return sqlSession.selectList(statement, null, rowBounds);
	}
	//페이징 처리
	public int hotelCount() {
		statement = namespace + ".hotelCount";
		return sqlSession.selectOne(statement);
	}
	public HotelDTO hotelDetail(int hotelNo) {
		statement = namespace + ".hotelDetail";
		return sqlSession.selectOne(statement, hotelNo) ;
	}
	public HotelDTO hotelViewDetail(ProductDTO dto2) {
	statement = namespace + ".hotelViewDetail";
	return sqlSession.selectOne(statement, dto2);
	}
	public void hotelUpdate(HotelDTO dto) {
		statement = namespace +".hotelUpdate";
		int i = sqlSession.update(statement, dto);
		System.out.println(i + "개가 수정되었습니다");
	}
	public void hotelDel(int hotelNo) {
		statement = namespace +".hotelDel";
		int i = sqlSession.delete(statement, hotelNo);
		System.out.println(i + "개가 삭제 되었습니다");
	}
	//////// 위시리스트 ////////
	public int wishAdd(WishDTO dto) {
		statement = namespace + ".wishAdd";
		return sqlSession.insert(statement, dto);
	}
	public List<String> memProdNo(String memId){
		statement = namespace + "memProdNo";
		return sqlSession.selectList(statement, memId);
	}
	public ProductWishDTO wishList(WishDTO dto) {
		statement = namespace + ".wishList";
		return sqlSession.selectOne(statement, dto);
	}
	public void wishRemove(Map<String, Object> condition) {
		statement = namespace + ".wishRemove";
		int i = sqlSession.delete(statement, condition);
		System.out.println(i + "개가 삭제되었습니다");
	}
	public void wishProdDel(WishDTO dto) {
		statement = namespace + ".wishProdDel";
		int i = sqlSession.delete(statement,dto);	
		System.out.println(i + "개가 삭제되었습니다");
	}
	
	  //////////////// 리뷰 //////////////// 
	
	//리뷰리스트
	public List<ReviewDTO> reviewList(String prodNo) {
		statement = namespace + ".reviewList";
		return sqlSession.selectList(statement, prodNo);
	}
	//리뷰작성
	  public void reviewWrite(ReviewDTO dto) { 
		  statement = namespace + ".reviewWrite"; 
		  int i =  sqlSession.insert(statement, dto); 
		  System.out.println(i + "개가 삽입되었습니다.");
	  }
	  public ReviewDTO reviewInfo(ReviewDTO dto) {
		  statement = namespace +".reviewInfo"; 
		  return sqlSession.selectOne(statement, dto); 
	  }
	  //리뷰 수정
	  public void reviewUpdate(ReviewDTO dto) { 
		  statement = namespace +".reviewUpdate"; 
		  int i = sqlSession.update(statement, dto); 
		  System.out.println(i + "개가 수정되었습니다");
	  }
	  
	  //리뷰 평점
	  public Double reviewAvg(String prodNo) {	
	  statement = namespace + ".reviewAvg";
	  return sqlSession.selectOne(statement, prodNo);
	  }
}
