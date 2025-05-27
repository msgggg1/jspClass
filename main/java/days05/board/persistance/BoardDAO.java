package days05.board.persistance;

import java.sql.SQLException;
import java.util.List;

import days05.board.domain.BoardDTO;

public interface BoardDAO {
		
		// 1. 글 목록 조회 + 페이징 처리 X
		// public abstract 생략
//		BoardDTO [] select()
		List<BoardDTO> select() throws SQLException; // List가 확장성 더 좋은 코딩 / 관리자가 알아야함 -> 일시킨 사람에게 올림
		// 1 - 2. 글 목록 조회 + 페이징 처리 O
		List<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException;	

		// 2. 새글 쓰기
		int insert(BoardDTO dto) throws SQLException;
		
		// 3. 게시글 상세보기 (1)조회수  1증가 업데이트쿼리 (2) SELECT 쿼리 -> 두가지 트렌잭션으로 묶여야.
		// 3-1. 글 상세보기 - 조회수 증가
		int increaseReaded(long seq) throws SQLException; //활용하든안하든 rowCount return // 다른것도 있어야한다면 class생성
		// 3-2. 글 상세보기 
		BoardDTO view(long seq) throws SQLException;

		// 4. 글 삭제 
		/* int delete(long seq)throws SQLException; */
		int delete(long seq, String pwd) throws SQLException;
		
		// 5. 글 수정하기
		int update(BoardDTO dto) throws SQLException;
		
		// 6. 글 검색 + 페이징 처리 X
							//검색조건, 검색어
		List<BoardDTO> search(String condition, String keyword) throws SQLException;
		// 6-2. 글 검색 + 페이징 처리 O
		List<BoardDTO> search(String condition, String keyword, int currentPage, int numberPerPage) throws SQLException ;
		
		// 7. 총 레코드 수를 반환하는 메서드
		int getTotalRecords() throws SQLException;
		int getTotalRecords(String condition, String keyword) throws SQLException;
		
		// 8. 총 페이지수를 반환하는 메서드 
		int getTotalPages(int numberPerPage) throws SQLException;
		// 8 - 2. 
		int getTotalPages(int numberPerPage, String condition, String keyword) throws SQLException;
		
		// DB에서 비밀번호 가져오는 메서드
		String getPwd(long seq) throws SQLException;
		

		
		
		
		
}
