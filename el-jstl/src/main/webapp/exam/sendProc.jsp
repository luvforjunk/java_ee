<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//데이터
request.setAttribute("apple", "사과");
// equest라는 영역 안에 apple이라는 변수와 사과라는 데이터를 넣어놓은 것

//페이지 이동
response.sendRedirect("sendResult.jsp");
%>
