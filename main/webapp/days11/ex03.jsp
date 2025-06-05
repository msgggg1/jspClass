<%@page import="com.util.DBConn"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
<%
	String contextPath = request.getContextPath();
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   String sql =  " SELECT * " 
		       + " FROM dept";
   ResultSet rs = null;   
   int deptno;
   String dname, loc;   
   
   DeptVO dvo = null;
   ArrayList<DeptVO> dlist = null;
   Iterator<DeptVO> dir = null;
   
   try{
	   conn = DBConn.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   rs = pstmt.executeQuery();
	   if( rs.next() ){
		   dlist = new ArrayList<>();
		   do{
			   deptno = rs.getInt("deptno");
			   dname = rs.getString("dname");
			   loc = rs.getString("loc");
			   
			 dvo = new DeptVO().builder()
			        .deptno(deptno).dname(dname).loc(loc)
			        .build(); 
			        
			   dlist.add(dvo);
			   
		   }while( rs.next() );
	   } // if
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		 pstmt.close();  
		   rs.close();
	     //DBConn.close();
	   }catch(Exception e){
		   e.printStackTrace();
	   }
   } // try 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 23. 오전 10:16:57</title>
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
   
  </xmp>
  
  <select id="deptno" name="deptno">
    <%
        dir = dlist.iterator();
        while( dir.hasNext() ){
        	dvo = dir.next();
        	deptno = dvo.getDeptno();
        	dname = dvo.getDname();
   %>
 		<option value="<%= deptno %>"><%= dname %></option> 
   <%        	
        } // while
    %>
  </select>
  
  <h2>emp list</h2>
  <table>
  	<thead>
  	  <tr>
  		<th><input type="checkbox" id="ckbAll" name="ckbAll"></th>
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
  	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<span class="badge left red">x명</span>
				<a href="javascript:history.back()">뒤로가기기</a>
				<button>선택한 empno 확인</button>
			</td>
		</tr>
	</tfoot>
  </table>
  
  <p id="demo"></p>
</div>

<script>
	$("#deptno").on("change", function(){
		let deptno = $(this).val()
		
		$.ajax({
				url: "ex03_empjson_lib.jsp"
				, type : "GET"
				, data : {deptno:deptno}
				, cache: false  
				, dataType: "json"
				, success : function(data, textStatus, jqXHR){ 
					// console.log( data.emp );                  
	                  $("span.badge").text( `\${data.emp.length} 명` );
	                  
	                  $("table tbody").empty();
	                  
	                  if(data.emp.length == 0 ){
	                     $("table tbody").append(
	                           `<tr>
	                           <td colspan="9">사원이 존재 X</td>
	                         </tr>`
	                           );
	                  } else{                      
	                   $(data.emp).each(function (index, emp ){
	                     $("table tbody").append(
	                        `<tr>
	                             <td><input type="checkbox" id="ckb-\${ emp.empno } %>"
	                              name="" 
	                              data-empno="\${ emp.empno }"
	                              value="\${ emp.ename }"></td>
	                           <td>\${ emp.empno }</td>
	                           <td>\${ emp.empno }</td>
	                           <td>\${ emp.job }</td>
	                           <td>\${ emp.mgr }</td>
	                           <td>\${ emp.hiredate }</td>
	                           <td>\${ emp.sal }</td>
	                           <td>\${ emp.comm }</td>
	                           <td>\${ emp.deptno }</td>         
	                          </tr>`
	                           );                     
	                  });                   
	                  } 
				}
				, error: function(){
					alert("에러")
				}
			});

	});
	
	// 이벤트 트리거 == change 이벤트 select 태그에 발생시키는 코딩
	$("#deptno").change(); 
	
	//EL(표현언어) request.getParameter("deptno") -> ajax 상태 관리 필요 없음
	// $("#deptno").val(${param.deptno}); 
</script>
<script>

	//모두 선택 체크박스
	$("#ckbAll").on("click", function(){
		$("table tbody tr")
			.find("td:first-child :checkbox")
				.prop("checked", $(this).prop("checked"));
	});
	
	$("table tbody tr")
	.find("td:first-child :checkbox").on("click", function(){
		let flag = $("tbody :checkbox").length == $("tbody :checkbox:checked").length ; 
		$("#ckbAll").prop("checked", flag);
	});
	
	//선택한 empno 버튼 클릭
	/* 
	// 풀이 [1]
	$("tfoot button").on("click", function(){
		let empnoArr = [];
		
		$("tbody :checkbox:checked").each(function (index, element){
			let empno = element.parentElement.nextElementSibling.innerText;
			empnoArr.push(empno);
		});
		
		location.href = `ex01_02.jsp?empno=\${empnoArr.join("/")}`;
		
	});
	*/
	
	//풀이 2
	$("tfoot button").on("click", function(){
		
		let empnoArr = [];
		
		$("tbody :checkbox:checked").each(function (index, element){
			// data-속성명="속성값"
			let empno = $(element).data("empno");
			empnoArr.push(empno);
		});
		
		location.href = `ex01_02.jsp?empno=\${empnoArr.join("&empno=")}`;
		
	});
</script>
</body>
</html>
























