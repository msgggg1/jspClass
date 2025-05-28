<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>2025. 5. 27. 오전 9:27:03</title>
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
   /days05/board/list.jsp
  </xmp>

	<h2>목록 보기</h2>
	<a href="<%=contextPath%>/cstvsboard/write.htm">글쓰기</a>
	
	<select id="cmbNumberPerPage" name="cmbNumberPerPage" style="margin:10px"></select>
	<script>
		for (var i = 10; i <= 50; i+=5) {
			$("#cmbNumberPerPage").append(`<option>\${i}</option>`);
		}
		$("#cmbNumberPerPage").on("change", function(){
			let npp = $(this).val(); // 10, 15, 20, ...
			location.href=`<%=contextPath%>/cstvsboard/list.htm?numberPerPage=\${npp}`;
		});	
	</script>
	
	<table>
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="17%">작성자</th>
				<th width="20%">등록일</th>
				<th width="10%">조회</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}"><!-- List.java의 list  -->
					<tr>
						<td colspan = "5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ list }" var="dto">
						<tr>
							<td>${ dto.seq }</td>
							<td><a class="title" href="<%= contextPath%>/cstvsboard/view.htm?seq=${ dto.seq }">${ dto.title }</a></td>
							<td>${ dto.writer }</td>
							<td>${ dto.writedate }</td>
							<td>${ dto.readed }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<script>
				$("a.title").attr("href", function(index, oldHref){
					let npp = ${pvo.numberPerPage};
					return `\${oldHref}&currentPage=${param.currentPage}&numberPerPage=\${npp}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
				});
			</script>			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
					<!-- [1] 2 3 4 5 6 7 8 9 10 next -->
					<div class="pagination">
					<c:if test="${pvo.prev }">
						<a href="${pvo.start -1 }">&lt;</a>
					</c:if>
					<c:forEach begin="${pvo.start }" end="${pvo.end }" step ="1" var="i">
						<c:choose>
							<c:when test="${pvo.currentPage eq i }">
								<a href="${i}" class="active">${i}</a>					
							</c:when>
							<c:otherwise>
								<a href="${i}">${i}</a>					
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pvo.next}">
						<a href="${pvo.end + 1 }">&gt;</a>
					</c:if>
					</div>
					<script>
						$(".pagination a:not(.active)").attr("href", function(index, oldHref){
							let npp = ${pvo.numberPerPage};
							let sc = '${param.searchCondition}';
							let sw = '${param.searchWord }';
							//alert("["  +sw + "]");
							
							return `/jspPro/cstvsboard/list.htm?currentPage=\${oldHref}&numberPerPage=\${npp}&searchCondition=\${sc}&searchWord=\${sw}`;							
							<%--if (${param.searchWord} == null && ${param.searchWord} =="") {
								return `/jspPro/cstvsboard/list.htm?currentPage=\${oldHref}&numberPerPage=\${npp}`;							
							} else {
							} --%>
						});
						
						$(".pagination a.active").on("click", function(){
								event.preventDefault();
						});
					</script>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<form>
						<select name="searchCondition" id="searchCondition">
							<option value="t">title</option>
							<option value="c">content</option>
							<option value="w">writer</option>
							<option value="tc">title+content</option>
						</select>
						<input type="text" id="searchWord" name="searchWord">
						<input type="submit" value="search">
					</form>
				</td>
			</tr>			
		</tfoot>
	</table>

</div>
<script>
<c:if test='${param.write eq "success"}'>
	alert("글 쓰기 성공");
</c:if>
<c:if test='${param.write eq "fail"}'>
	alert("글 쓰기 실패");
</c:if>
</script>

<script>
// list.htm?searchCondition=w&searchWord=
$("#searchCondition").val("${empty param.searchCondition ? "t" : param.searchCondition}");
$("#searchWord").val("${param.searchWord}");	
	
</script>
</body>
</html>