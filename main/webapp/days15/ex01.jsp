<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 12. 오전 9:05:22</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">msg HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code"> 
  	days15.ex01.jsp
  	답변형 게시판
      [1] 게시판 DB 테이블 ***
   글번호 제목           작성자 ...   등등 컬럼... 
   1      첫번째게시글   홍길동(새글)
   2      두번째게시글   서영학(새글)
   3      세번째게시글   정창기(새글)
   4      2-1 답글     정창기(답글)
   5      2-1-1 답글   홍길동(답글)
   6      네번째게시글   정창기(새글)
   7      6-1 답글     홍길동(답글)
   
   2. 뷰(list.jsp) 출력 ***  
   ORDER BY 글번호 DESC 
   글번호 제목           작성자 ...   등등 컬럼...
   6      네번째게시글   정창기(새글)
     7      6-1 답글       홍길동(답글)
   3      세번째게시글   정창기(새글)
   2      두번째게시글   서영학(새글) 
     4      2-1 답글     정창기(답글)
       5      2-1-1 답글     홍길동(답글)
   1      첫번째게시글   홍길동(새글)  
   
   -----------------------------
   1) 컬럼 3개 추가
   		ㄱ. 글을 그룹으로 묶어주는 칼럼(ref)
   		ㄴ. 그룹 안에서의 순서(step)
   		ㄷ. 깊이(depth) 답글, 답답글, 답답답글
   		 
   2) 컬럼 2개 추가 1컬럼=2컬럼 역할
   		A. RS ㄱ+ㄴ
   		B. 깊이 (depth)
   		글번호 제목           작성자 ...   글 그룹(REF)+그룹순서(STEP) 깊이(DEPTH) 
   		1      첫번째게시글   홍길동(새글)        1000                   0					글그룹 <1000 정한것
   		1      첫번째게시글   홍길동(새글)        2000                   0					글그룹 <1000 정한것
   		1      첫번째게시글   홍길동(새글)        3000                   0					글그룹 <1000 정한것
   
  </xmp>
  <xmp>
  	[1] 게시판 DB 테이블 ***
   글번호 제목           작성자 ...   글 그룹(REF)  그룹순서(STEP) 깊이(DEPTH) 
   1      첫번째게시글   홍길동(새글)      1            1              0
   2      두번째게시글   서영학(새글)      2            1              0
   3      세번째게시글   정창기(새글)      3            1              0
   4      2-1 답글       정창기(답글)      2            3->4              1
   5      2-1-1 답글     홍길동(답글)      2            4->5              2
   6      네번째게시글   정창기(새글)      6            1              0
   7      6-1 답글       홍길동(답글)      6            2              1
   8      2-2 답글       서영학(답글)      2            2              1
   9      2-2-1 답글     서영학(답글)      2            3              2

 	규칙1) 새 글의 글 그룹은 글번호로 설정한다. 
 	규칙2) 새 글의 그룹순서는 1기본값으로 설정한다. 
 	규칙3) 새 글의 그룹순서는 0기본값으로 설정한다. 
 	
 	답글은 반드시 부모글이 있다. (부모글그룹, 부모그룹순서, 부모깊이)반드시 알아야 함.
 	규칙4) 답글의 글 그룹은 부모글그룹(ref)로 설정한다.
 	규칙5) 
 		(1)같은 글그룹내에서 부모글그룹순서보다 큰 답글은 그룹순서 +1 UPDATE 쿼리 실행
 		(2)답글의 그룹순서는 부모글그룹순서+1 로 설정한다. 
 	규칙6) 답글의 깊이는 부모깊이+1 로 설정한다. 
   
   2. 뷰(list.jsp) 출력 ***  
   ORDER BY ref DESC, step ASC 
   글번호 제목           작성자 ...   글 그룹(REF)  그룹순서(STEP) 깊이(DEPTH) 
   6      네번째게시글   정창기(새글)      6            1              0
   7      6-1 답글       홍길동(답글)      6            2              1
   3      세번째게시글   정창기(새글)      3            1              0  
   2      두번째게시글   서영학(새글)      2            1              0   
   8      2-2 답글       서영학(답글)      2            2              1
   4      2-1 답글       정창기(답글)      2            3              1
   5      2-1-1 답글     홍길동(답글)      2            4              2
   1      첫번째게시글   홍길동(새글)      1            1              0
   
  </xmp>
  
</div>
</body>
</html>