package repository;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import Model.NoticeDTO;


public class NoticeRepository {
	@Autowired
	SqlSession sqlSession;
	String namespace = "mappers.lsoMapper";
	String statement;
	
	
		//event 리스트불러오깅
		public List<NoticeDTO> eventList(RowBounds rowBounds){
			statement=namespace+".eventList";
			return sqlSession.selectList(statement,null,rowBounds);
		}
		//notice 	리스트불러오깅
		public List<NoticeDTO> noticeList(RowBounds rowBounds){
			statement=namespace+".noticeList";
			return sqlSession.selectList(statement,null,rowBounds);
		}
		//페이징 처리노티스
		public int noticeCount() {
			statement = namespace + ".noticeCount";
			return sqlSession.selectOne(statement);
		}
		//페이징 처리 event
		public int eventCount() {
			statement = namespace + ".eventCount";
			return sqlSession.selectOne(statement);
		}
		//노티스 번호주기
		public String noticeNo() {
			statement=namespace+".noticeNo";
			return sqlSession.selectOne(statement);
		}
		//노티스 작성하기
		public void noticeWrite(NoticeDTO dto) {
			statement= namespace+".noticeWrite";
			int i = sqlSession.insert(statement,dto);
			System.out.println(i + "개가 삽입되었습니다");
		}
		//노티스 카운트 하기
		 public void noticeReadUpdate(String noticeNo) {
			statement= namespace+".noticeReadUpdate";
			int i = sqlSession.update(statement,noticeNo);
			System.out.println(i + "개가 수정되었습니다");
		}	 
		//노티스 디테일
		 public NoticeDTO noticeDetail(String noticeNo) {
			statement = namespace + ".noticeDetail";
			return sqlSession.selectOne(statement, noticeNo);
		} 
		//공지 수정
		public void noticeModify(NoticeDTO dto) {
			statement= namespace+".noticeModify";
			int i = sqlSession.update(statement,dto);
			System.out.println(i + "개가 삭제되었습니다");
		}
		//삭제
		public void noticeDel(String noticeNo) {
			statement = namespace +".noticeDel";
			int i = sqlSession.delete(statement, noticeNo);
			System.out.println(i + "개가 삭제되었습니다");
		}
}
