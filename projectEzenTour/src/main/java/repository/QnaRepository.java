package repository;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import Model.QnaDTO;

@Repository
public class QnaRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace="mappers.noticeMapper";
	String statement;
	
	public int getQnaCount(int qnaNo) {
		statement = namespace+".getQnaCount";
		return sqlSession.selectOne(statement, qnaNo);
	}
	public void addQnaInfo(QnaDTO qnaDTO) {
		statement = namespace+".addQnaInfo";
		int i = sqlSession.insert(statement,qnaDTO);
		System.out.println(i + "개가 삽입되었습니다");
	}
	public QnaDTO getQnaInfo(int qnaNo) {
		statement = namespace+".getQnaInfo";
		return sqlSession.selectOne(statement, qnaNo);
	}
	public void modifyQnaInfo(QnaDTO qnaDTO) {
		statement = namespace+".modifyQnaInfo";
		int i = sqlSession.insert(statement, qnaDTO);
		System.out.println(i + "개가 삽입되었습니다");
	}
	public void deleteQnaInfo(int qnaNo) {
		statement = namespace+".deleteQnaInfo";
		int i = sqlSession.delete(statement, qnaNo);
		System.out.println(i + "개가 삭제되었습니다");
	}
	public List<QnaDTO> getQnaList(){
		statement = namespace+".getQnaList";
		return sqlSession.selectList(statement);
	}
}