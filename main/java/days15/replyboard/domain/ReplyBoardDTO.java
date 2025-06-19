package days15.replyboard.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyBoardDTO {
	
	// 입력필드, 칼럼명
   
   private int num;		         // 글번호
   private String writer; 	     // 작성자
   private String email;    	 // 이메일
   private String subject;       // 제목
   private String pass;      	 // 비밀번호
   private int readcount;        // 조회수
   private Date regdate;      	 // 등록일
   private String content;       // 내용
   private String ip;         	 // IP주소
   private int ref;         	 // *** 그룹
   private int step;         	 // *** 그룹내 순번
   private int depth;            // *** 깊이
 
   // DB칼럼 아님
   private boolean newImg; // 컬럼 추가

}
