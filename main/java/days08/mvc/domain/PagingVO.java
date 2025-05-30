package days08.mvc.domain;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.DBConn;

import days05.board.persistance.BoardDAO;
import days05.board.persistance.BoardDAOImpl;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PagingVO {
	
	private int currentPage = 1;
	private int numberPerPage = 1;
	
	// 페이징 처리 시 시작값 저장할 변수
	private int start = 1;
	private int end = 10; // 끝값
	private boolean prev; // <
	private boolean next; // >

	// 목록 페이징 객체 생성자
	public PagingVO(int currentPage, int numberPerPage, int numberOfPageBlock) {
		
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		int totalPages;
		try {
			totalPages = dao.getTotalPages(numberPerPage);
			this.start = (currentPage-1)/numberOfPageBlock * numberOfPageBlock +1 ;
			this.end = start + numberOfPageBlock -1;
			if ( end > totalPages) end = totalPages;
			
			if (start  != 1) this.prev = true ;
			if (end  != totalPages) this.next = true ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	// 검색 페이징 객체 생성자
	public PagingVO(int currentPage, int numberPerPage, int numberOfPageBlock, String condition, String keyword) {
		
		this.currentPage = currentPage;
		this.numberPerPage = numberPerPage;
		
		Connection conn = DBConn.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		
		int totalPages;
		try {
			totalPages = dao.getTotalPages( numberPerPage , condition, keyword );
			this.start = (currentPage-1)/numberOfPageBlock * numberOfPageBlock +1 ;
			this.end = start + numberOfPageBlock -1;
			if ( end > totalPages) end = totalPages;
			
			if (start  != 1) this.prev = true ;
			if (end  != totalPages) this.next = true ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
} // class
