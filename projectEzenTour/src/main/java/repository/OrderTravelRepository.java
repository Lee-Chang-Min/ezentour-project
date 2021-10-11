package repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.OrderTravelDTO;
import Model.PaymentDTO;
import Model.ProductHotelDTO;
import command.OrderTravelCommand;

public class OrderTravelRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace="mappers.orderMapper";
	String statement;
	
	
	public void orderDel(String orderNo) {
		statement = namespace+".orderDel";
		int i = sqlSession.delete(statement,orderNo);
		System.out.println(i+"개가 삭제되었습니다");	
	}
	public void orderadd(OrderTravelDTO dto) {
		statement=namespace+".orderadd";
		int i = sqlSession.insert(statement,dto);
		System.out.println(i + "개가 삽입되었습니다");
	}
	public ProductHotelDTO hotelNo(String prodNo) {
		statement = namespace + ".hotelNo";
		return sqlSession.selectOne(statement, prodNo) ;
	}
	public String orderNo() {
		statement = namespace + ".orderNo";
		return sqlSession.selectOne(statement);
	}
	public OrderTravelDTO orderDetail(String orderNo) {
		statement = namespace + ".orderDetail";
		return sqlSession.selectOne(statement, orderNo) ;
	}
	public String paymentNo() {
		statement = namespace + ".paymentNo";
		return sqlSession.selectOne(statement);
	}
	public void paymentadd(PaymentDTO dto) {
		statement=namespace+".paymentadd";
		int i = sqlSession.insert(statement,dto);
		System.out.println(i + "결제가 삽입되었다");
	}
}
