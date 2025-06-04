<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<title>2025. 6. 4. 오후 3:33:33</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }   
</style>
<script src="httpRequest.js"></script>
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
   ex06_cd_catalog.xml
   XML 파일을 ajax로 읽어와서 ex06.jsp 처리
  </xmp>
  <input type="button" value="Get my CD Collection" onclick="loadXML();">
  <br>
  <p id="demo"></p>
  
</div>

<script>
  function loadXML(){
     sendRequest("ex06_cd_catalog.xml", null, callback,"GET");
  }
  
  function callback(){
     if( httpRequest.readyState == 4 ){ // 서버 요청 완료
         if( httpRequest.status == 200 ){ // 응답 성공
            let xmlDoc = httpRequest.responseXML; 
         
         	// XML DOM 
         	const cdList = xmlDoc.getElementsByTagName("CD");
         	//alert(cdList.length); //26
         	let tbl_cdlist = ` <table>
         							<tr>
         								<th>TITLE</th>
         								<th>ARTIST</th>
         							</tr>`;
         	for (var i = 0; i < cdList.length; i++) {
				title = cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue;
				artist = cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue;
				tbl_cdlist += `
								<tr>
									<td>\${title}</td><td>\${artist}</td>
								</tr>
								`;
			} // for
			
			tbl_cdlist += '</table>'
         	
            $("#demo") .html( tbl_cdlist); 
         } else{
        	 alert("Ajax 실패 : " + httpRequest.status)
         }
      }
  }
  
  </script>
</body>
</html>