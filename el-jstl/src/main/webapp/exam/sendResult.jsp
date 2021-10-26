<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String apple = (String)request.getAttribute("apple"); 
//Attribute에서 apple이라는 변수를 꺼내와라
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 = <%=apple %>
</body>
</html>

<!-- 
sendProc에서의 request와 sendResult에서의 request는 다른 것이다. 
같은 것이 절대 아니다. 
-->