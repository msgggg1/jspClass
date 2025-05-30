package days08.mvc.domain;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class BoardDTO { // BoardVO 상관없음
	
	// DDL문 안에 있는 코딩 그대로 복사해오기 
	// 칼럼명 100% 똑같이 주기
	private long seq;	
	private String writer;
	private String pwd;
	private String email;
	private String title;
	private Date writedate;
	private int readed;
	private int tag;
	private String content;
	
	
} // class
