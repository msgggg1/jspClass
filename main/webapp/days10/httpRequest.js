var httpRequest = null; 

// 비동기처리 객체 만들어주는 함수
function getXMLHttpRequest(){ //xhr
   if(window.ActiveXObject){  
      try {
         return new ActiveXObject("Msxml2.XMLHTTP");
      } catch (e) {
         try {
            return new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e) {
            return null;
         }

      }
   }else if(window.XMLHttpRequest){
      return new XMLHttpRequest();       
   }else {
      return null;
   }
}

// ajax 요청 하러가는 함수
function sendRequest(url,params,callback,method){
	//1 ) 비동기처리 객체 가져오기     
   httpRequest = getXMLHttpRequest(); // xhr
   // 2) 매개변수로 callback 함수 받음        
   httpRequest.onreadystatechange = callback;  // 질문
   // ajax 요청 시 GET/POST 뭘로 요청할 건지
   var httpMethod= method?method:'GET';        // 질문   
   if(httpMethod!='GET' && httpMethod!='POST') httpMethod='GET';
   
   var httpParams = (params==null||params=="")?null:params;
   var httpUrl = url;
   if(httpMethod=='GET' && httpParams != null){
      httpUrl= httpUrl +"?"+httpParams;
   }     
   httpRequest.open(httpMethod,httpUrl,true);  
   httpParams = (httpMethod=='POST'?httpParams:null );
   httpRequest.send( httpParams );  
}