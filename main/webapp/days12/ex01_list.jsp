<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 9. 오전 9:26:11</title>
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
   	ex01_list.jsp
  </xmp>
  
    
  <table  align="center">
    <tr>
     <td align="right" colspan="4">
          <a href="write.ss">WRITE</a>
     </td>
   </tr>
   <tr>
      <td align="center" width="50">글번호</td>
      <td align="left" >제목</td>
      <td align="center" width="200">첨부파일</td>
      <td align="center" width="50">삭제</td>
    </tr>
    <c:if test="${ empty list }">
      <tr>
        <td  colspan="4">
           게시글이 존재 X
        </td>
      </tr>
    </c:if>
    <c:if test="${ not empty list }">
      <c:forEach items="${ list }" var="dto">
        <tr>
          <td align="center" width="50">${ dto.num }</td>
          <td align="left" >${ dto.subject }</td>
          <td align="center" width="200">
            <a href="#">${ empty dto.originalfilename ? "없음" :dto.originalfilename}</a>
          </td>
          <td align="center" width="50">
            <a href="delete.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
            <a href="update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
          </td>
        </tr>
      </c:forEach>
    </c:if>
  </table>
</div>
</body>
</html>