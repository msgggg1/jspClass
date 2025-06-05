<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 5. 오후 3:06:43</title>
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
   ex08_ok.jsp
  </xmp>
  <%
  	// Start -> 
  	String path = "/days11/upload";
  	String saveDir = pageContext.getServletContext().getRealPath(path);
  
  	// 만약에 없으면 생성
  	File f = new File(saveDir);
  	if(!f.exists()) f.mkdirs();
  	
  	int maxSize = 5*1024*1024; // 5MB 	기본단위 byte
  	
  	String encoding = "UTF-8";
  	
  	FileRenamePolicy policy =  new DefaultFileRenamePolicy();
  	
  	// cos.jar
  	MultipartRequest mrequest = new MultipartRequest(
  			request
  			,saveDir
  			,maxSize
  			,encoding
  			,policy
  			);
 // End -> MultipartRequest 객체 생성
 
 // (기억) MultipartRequest 객체 생성할 때 에러가 발생하지 않으면
 // 						벌써 첨부파일은 저장 완료되었다. 따로 저장하는 코딩 필요하지 않음.
 
 		String msg = mrequest.getParameter("msg");
  %>
  
  > 전송된 메세지 : <%= msg %><br>
  <br>
  <br>
  <h3>첨부파일의 정보</h3>
  <%
  Enumeration en = mrequest.getFileNames();
  while(en.hasMoreElements()){
	  // inputFileNameArr : input 태그의 name 속성값 file1, file2
	  String inputFileNameAttr = (String)en.nextElement();
	  File attachFile = mrequest.getFile(inputFileNameAttr);
	  
	  if(attachFile != null){
		  String fileName =  attachFile.getName();
		  long fileSize = attachFile.length();
		  // a.txt			a1.txt  a2.txt 두 개 이름을 다 알고 있어야 함.
		  String originalFileName =  mrequest.getOriginalFileName(inputFileNameAttr);
		  String filesystemName =  mrequest.getFilesystemName(inputFileNameAttr);
	  %>
	  -----------------------------------------------------------<br>
	  > inputFileNameAttr : <%= inputFileNameAttr %><br>
	  > 첨부된 파일명 : <%= fileName %>(<%= fileSize %>bytes)<br>
	  > 첨부된 원래 파일명 : <%= originalFileName %><br>
	  > 실제 저장된 파일명 : <%=  filesystemName%>
	  <%
	  } // if
  }// while
  %>

</div>
</body>
</html>