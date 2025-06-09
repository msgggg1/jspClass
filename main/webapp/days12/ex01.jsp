<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 9. 오전 9:02:03</title>
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
  <a href="/jspPro/days12/list.ss">자료실 목록보기</a>
  <br> 


  <xmp class="code"> 
   days12.ex01.jsp
   
   1. 테이블 , 시퀀스 생성
    create table filetest(          
     num number not null primary key  
     , subject varchar2(50) not null     
     
     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
     , filelength number  -- 파일크기
    );
    
   create sequence seq_filetest;   
   
   2. MVC 
   	  commandHandler -> ???Handler
   	  
   	  여기선 간략하게
   	  
   	    실습)
      days12 패키지
         ㄴFileTestDTO.java                         
         ㄴFileTestDAO.java                        
          서블릿 + 컨트롤러 역할
         ㄴFileTestServlet.java   -- Controller 모든 요청 처리         
      days12 폴더
         ㄴ ex01_list.jsp                  list.ss
         ㄴ ex01_write.jsp                 write.ss                
         ㄴ ex01_update.jsp                update.ss 
   
   3. web.xml -> 
  </xmp>
</div>
</body>
</html>