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
<%	
	String pDeptno = request.getParameter("deptno");
	int pdeptno = 10;
	try{
		pdeptno = deptno = Integer.parseInt(pDeptno);
	} catch(Exception e){
		pdeptno = deptno = 10; // 안넘어오면 10번으로 처리
	}
	
   sql =  " SELECT empno, ename, job, mgr,  "
		   	+ " TO_CHAR(hiredate, 'yyyy-MM-dd') hiredate, sal, comm, deptno "
		    + " FROM emp "
		    + "  WHERE deptno = ? ";
   
   	int empno, mgr;
	String ename, job;
	Date hiredate;
	double sal, comm ;
	   
   EmpVO evo = null;
   ArrayList<EmpVO> elist = null;
   Iterator<EmpVO> eir = null;
   
   try{
	   conn = DBConn.getConnection();
	   //System.out.println("> conn = " + conn);
	   //System.out.println("> isClosed = " + conn.isClosed() );
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, deptno);
	   rs = pstmt.executeQuery();
	   if( rs.next() ){
		   elist = new ArrayList<>();
		   do{
				empno = rs.getInt("empno");
				ename = rs.getString("ename");
				job = rs.getString("job");				
				mgr = rs.getInt("mgr");
				hiredate =  rs.getDate("hiredate");
				sal = rs.getDouble("sal");
				comm = rs.getDouble("comm");
			   	deptno = rs.getInt("deptno");
				
				evo = new EmpVO().builder()
						.empno(empno).ename(ename).job(job).mgr(mgr).hiredate(hiredate).sal(sal).comm(comm).deptno(deptno)
						.build(); 
				
				
			   elist.add(evo);
		   }while( rs.next() );
	   } // if
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		 pstmt.close();  
		 rs.close();
	     DBConn.close();
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
<%--    <option value="<%= deptno %>"<%= (deptno == pdeptno ) ? "selected" : "" %>>
   					<%= dname %></option> 
 --%>   
 		<option value="<%= deptno %>"><%= dname %></option> 
   <%        	
        } // while
    %>
  </select>
  
  <h2>emp list - <%= deptno %></h2>
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
  		<!-- list == null  사원존재 x -->
  		<%
  			if(elist == null){
  		%>
  		
  		<tr>
  			<td colspan="9">사원이 존재 X</td>
  		</tr>
  		
  		<%
  			}else{
  				eir = elist.iterator();
  				while(eir.hasNext()){
  					evo = eir.next();
  		%>	
  		<tr>
  		  <td><input type="checkbox" id="ckb-<%= evo.getEmpno()%>" 
  		  		name=""
  		  		data-empno="<%= evo.getEmpno() %>"
  		  		value="<%= evo.getEmpno() %>"></td>
  		  <td><%= evo.getEmpno() %></td>
  		  <td><%= evo.getEname() %></td>
  		  <td><%= evo.getJob() %></td>
  		  <td><%= evo.getMgr() %></td>
  		  <td><%= evo.getHiredate() %></td>
  		  <td><%= evo.getSal() %></td>
  		  <td><%= evo.getComm() %></td>
  		  <td><%= evo.getDeptno() %></td>
  		</tr>
  		
  		<%
  				} //while
  			}// if
  		%>
  	</tbody>
	<tfoot>
		<tr>
			<td colspan="9">
				<span class="badge left red"><%= elist==null ? 0 : elist.size()%>명</span>
				<a href="javascript:history.back()">뒤로가기기</a>
				<button>선택한 empno 확인</button>
			</td>
		</tr>
	</tfoot>
  </table>
  
</div>

<script>
	$("#deptno").on("change", function(){
		let deptno = $(this).val()
		//					/jspPro
		location.href = `<%= contextPath%>/days03/ex01.jsp?deptno=\${deptno}`;
	});
	
	//EL(표현언어) request.getParameter("deptno")
	$("#deptno").val(${param.deptno}); 
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
























