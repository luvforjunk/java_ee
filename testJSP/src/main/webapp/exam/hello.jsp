<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%! 
//전역 - 딱 한번, init()
String name = "홍길동";
int age = 25;
%>

<%
//지역 - 요청시마다 매번 처리, service()
age++; //26...27...28...쭉쭉 증가한다
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Hello JSP!!<br> ..HTML 주석--> 
<%--안녕하세요 JSP!!<br> ..JSP 주석 --%>
나의 이름은 <%=name %> 입니다.<br>
<!--내 나이는 <%=age %>살 입니다.<br>  -->
<%-- <% out.println("내 나이는 " + age + "살 입니다."); %> --%>
</body>
</html>