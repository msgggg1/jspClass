<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = application.getInitParameter("path");
	//	/days06
	// 실제 물리적으로 웹 서버(톰켓) + 배포 경로(실제 배포된 경로)
	String realPath = application.getRealPath(path);
	// >realPath :C:\Class\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days06
	// System.out.println(">realPath :" + realPath);
	
	// 폴더와 파일을 다루는 객체 클래스
	File dir = new File(realPath);
	File [] listFiles = dir.listFiles();
	ArrayList<String> list = new ArrayList();
	for(int i=0; i <listFiles.length;i++){
		File f = listFiles[i];
		if(f.isFile()){
			String fileName = f.getName();
			list.add(fileName);
		}
	}
	
	// el표현에서 접근하려면 적당한 스코프에 저장해야함
	// pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 5. 29. 오전 11:14:11</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>
<style>
  .demo{
     border: 1px solid gray;
     padding: 5px;
     margin-top:10px;
     max-height: 500px;
     overflow: auto; 
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
   web.xml
   path : /days06 -> application 객체 경로 얻어와서
   그 경로(폴더) 속에 있는 파일명을 얻어와서 
   select 태그에 option으로 추가.
   
  </xmp>
  
 <form>
  <select id="file" name="file">
<%-- <c:forEach items="${list}" var="fileName"> --%>
  	 <c:forEach items="<%=list %>" var="fileName">
  		<option>${fileName}</option>
  	</c:forEach>
  </select>
 </form> 

  
  <%
  	String pFileName = request.getParameter("file");
  	pFileName = pFileName == null ? list.get(0) : pFileName;
  	
  	String fileName = pFileName;
  			
  	String content = "";
  	
  	fileName = String.format("%s\\%s", realPath, fileName);
  	try(
  			FileReader fr = new FileReader(fileName);
  			BufferedReader br = new BufferedReader(fr);		
  			){
  		String line = null;
  		while( (line = br.readLine())!= null){
  			line = line
  					.replaceAll("<", "&lt;")
  					.replaceAll(">", "&gt;")
  					// .replaceAll("\r\n", "<br>");
  					+"<br>";
  			content += line;
  		}// while
  	}catch(Exception e){
  		e.printStackTrace();
  	}finally{
  		
  	}
  %>
  
  <div class="demo">
  <code>
  	<%= content %>
  </code>
  </div>
</div>
  <script>
  	$("#file").on("change", function(){
  		$(this).parent().submit();
  	});
  	
  	$("#file").val("<%=pFileName%>");
  </script>
</body>
</html>