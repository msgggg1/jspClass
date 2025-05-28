<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// /jspPro
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 27. 오전 11:45:37</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>

 <link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 <script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
  
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
   	view.jsp
  </xmp>
  
    <h2>글 내용 보기</h2>
    
    <table>
    	<tbody>
    		<tr>
    			<td>이름</td>
    			<td>${dto.writer }</td>
    			<td>등록일</td>
    			<td>${dto.writedate }</td>
    		</tr>
    		<tr>
    			<td>Email</td>
    			<td>${dto.email }</td>
    			<td>조회수</td>
    			<td>${dto.readed }</td>
    		</tr>
    		<tr>
    			<td>제목</td>
    			<td colspan="3">${dto.title }</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td colspan="3" class="full" style="height: 200px; verticle-align:top">${dto.title }</td>
    		</tr>
    	</tbody>
    	<tfoot>
    		<tr>
    			<td colspan="4" align="center">
    				<a href="<%= contextPath%>/cstvsboard/edit.htm?seq=${dto.seq}">수정하기</a>
    				<a href="<%= contextPath%>/cstvsboard/delete.htm?seq=${dto.seq}">삭제하기</a>
    				<a href="<%= contextPath%>/cstvsboard/list.htm">Home</a> 
    				<input type="button" id="btnModalDelete" value="모달창 삭제">
    			</td>
    		</tr>
    	</tfoot>
    </table>

   

</div>

<%
	// 목록보기 -> 내용보기 이동  view.htm?seq=156		null
	// 수정하기 -> 내용보기 이동 : view.htm?seq=156&edit=success/fail
	// String edit = request.getParameter("edit");
	// EL 연산자 : empty, !, not, eq, == 
%>
<script>
<c:if test='${param.edit eq "success"}'>
	alert("수정 성공");	
</c:if>
<c:if test='${param.edit eq "fail"}'>
	alert("수정 실패");	
</c:if>
</script>

<!-- 삭제 모달창 -->
<div id="dialog-form" title="삭제 모달창">
 <h2>삭제하기</h2>
  
  <form action="<%=contextPath %>/cstvsboard/delete.htm?seq=${param.seq}" method="post">
    <table>
      <tr>
        <td colspan="2" align="center">
          <b>글을 삭제합니다.</b>
        </td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td>
         <input type="password" name="pwd" size="15" autofocus="autofocus">
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <a href="<%= contextPath%>/cstvsboard/delete.htm?seq=${param.seq}"><input type="submit" value="삭제"></a>
          &nbsp;&nbsp;
          <input type="button" value="취소" id="cancel">
        </td>
      </tr>
    </table>
    <span style="color:red;display:none" id="spn">비밀번호가 잘못되었습니다.</span>
  </form>
</div>

<script>
var dialog, form;
dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 400,
    width: 350,
    modal: true,
    buttons: {
    },
    close: function() {
      form[ 0 ].reset();
    }
  });
  
form = dialog.find( "form" );

$("#btnModalDelete").on( "click", function() {
    dialog.dialog( "open" );
});

$("#cancel").on( "click", function() {
    dialog.dialog( "close" );
});

// 모달창으로 삭제 실패하고 온 경우
if (${param.delete eq 'fail'}) {
	dialog.dialog( "open" );
	$("#spn").show().slideToggle(3000);
}
</script>

<script>
//HOme 버튼 클릭시
$("tfoot a:last-of-type").attr("href", function (index, oldHref){
  return    `\${oldHref}?currentPage=${param.currentPage}&numberPerPage=${param.numberPerPage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
});
//삭제 후 검색결과의 페이지로 이동.
$("#dialog-form form").attr("action", function (index, oldHref){
  return    `\${oldHref}&currentPage=${param.currentPage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
});
</script>
</body>
</html>