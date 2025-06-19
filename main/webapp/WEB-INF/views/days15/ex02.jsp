<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 13. 오전 9:03:08</title>
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
	 <a href="/jspPro/days15/replyboard/list.do">목록보기</a>
  <br>

  <xmp class="code"> 
  	[답변형 게시판 (== 계층형 게시판)]
  
   days15.replyboard.command            패키지   
       ㄴ CommandHandler.java
       ㄴ ListHandler.java 
    days15.replyboard.controllor         패키지
       ㄴ DispatcherServlet.java           
    days15.replyboard.domain            패키지
       ㄴ ReplyBoardDTO.java    
    days15.replyboard.persistence         패키지 
       ㄴ IReplyBoard.java    인터페이스
       ㄴ ReplyBoardDAO.java  클래스 
    days15.replyboard.service            패키지  
       ㄴ ListService.java
       
       days15
     ㄴ replyboard
         ㄴ list.jsp  
         
       CREATE TABLE "SCOTT"."REPLYBOARD" 
   (   
    "NUM" NUMBER NOT NULL ENABLE,     -- 글번호
   "WRITER" VARCHAR2(12 BYTE) NOT NULL ENABLE,  --작성자 
   "EMAIL" VARCHAR2(30 BYTE) NOT NULL ENABLE,   --이메일
   "SUBJECT" VARCHAR2(50 BYTE) NOT NULL ENABLE,  --제목
   "PASS" VARCHAR2(10 BYTE) NOT NULL ENABLE,  --비밀번호
   "READCOUNT" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,  --조회수 
   "REGDATE" DATE DEFAULT sysdate NOT NULL ENABLE,   --작성일
   "CONTENT" CLOB NOT NULL ENABLE,  --글내용
   "IP" VARCHAR2(20 BYTE) NOT NULL ENABLE, --IP주소 
   
   "REF" NUMBER(5,0) DEFAULT 0 NOT NULL ENABLE,  --그룹 
   "STEP" NUMBER(3,0) DEFAULT 1 NOT NULL ENABLE,  --순번
   "DEPTH" NUMBER(3,0) DEFAULT 0 NOT NULL ENABLE,  --깊이
   
    PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
       
CREATE SEQUENCE SEQ_REPLYBOARD;
 
 
	[ MVC ]
	C 컨트롤러 - 모든 요청	*.do
  </xmp>
</div>
</body>
</html>