<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String deptno = request.getParameter("deptno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 26. 오후 12:20:03</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">msg HOme</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> </xmp>

		<h2>
			emp list -
			<%=deptno %></h2>
		<table>
			<thead>
				<tr>
					<th>empno</th>
					<th>ename</th>
					<th>job</th>
					<th>mgr</th>
					<th>hiredate</th>
					<th>sal</th>
					<th>comm</th>
					<th>deptno</th>
				</tr>
			</thead>
			<tbody>
				<!-- jstl if else 구문 없음 -> if문 여러개 -->
<%-- 				<c:if test="${list == null }"> --%>
				<c:if test="${empty list}">
					<tr>
						<td colspan="8">사원이 존재 X</td>
					</tr>
				</c:if>
				<%-- <c:if test="${list != null }"> --%>
				<%-- <c:if test="${!empty= null }"> --%>
				<!-- EL 연산자: not, empty 연산자 -->
				<c:if test="${not empty list }">
					<c:forEach items="${list}" var="vo">
						<tr>
							<td> ${vo.empno} </td><!-- getter, setter, 있어야 함. 없으면 오류 -->
							<td> ${vo.ename} </td>
							<td> ${vo.job} </td>
							<td> ${vo.mgr} </td>
							<td> ${vo.hiredate} </td>
							<td> ${vo.sal} </td>
							<td> ${vo.comm} </td>
							<td> ${vo.deptno}</td>
						</tr>
					</c:forEach>
				</c:if>

				<!-- list == null  사원존재 x -->
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8"><span class="badge left red">
						<!-- EL 삼항 연산자 사용 가능 -->
						${empty list ? 0 : list.size()} 명
						</span>
						<a href="javascript:history.back()">뒤로가기기</a></td>
				</tr>
			</tfoot>
		</table>

	</div>
</body>
</html>