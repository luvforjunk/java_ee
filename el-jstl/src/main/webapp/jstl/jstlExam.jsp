<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jstl.PersonDTO"%>
<%
// 자바 파일의 역할 ---> 페이지를 이동해야 하니 여기서 실행하세요

List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("사자");
list.add("기린");
list.add("코끼리");
list.add("타조");
list.add("코알라");
list.add("여우");

PersonDTO aa = new PersonDTO("홍길동", 25);
PersonDTO bb = new PersonDTO("네  오", 23);
PersonDTO cc = new PersonDTO("프로도", 30);

List<PersonDTO> list2 = new ArrayList<PersonDTO>();
list2.add(aa);
list2.add(bb);
list2.add(cc);

//데이터
request.setAttribute("list", list);
request.setAttribute("list2", list2);

//페이지 이동
// response.sendRedirect("jstlTest.jsp"); 
/* 
데이터가 가지 않아 아무것도 뜨지 않는다
왜? jstlExam.jsp에서의 request와 jstlTest.jsp의 request가 다르기 때문
*/

//forward
RequestDispatcher dispatcher = request.getRequestDispatcher("jstlTest.jsp");
dispatcher.forward(request, response);

%>
<%-- <jsp:forward page="jstlTest.jsp" /> --%>