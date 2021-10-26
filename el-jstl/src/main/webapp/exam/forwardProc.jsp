<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% 
//데이터
request.setAttribute("apple", "사과");

//페이지 이동
//forward와 같은 의미
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");
//상대 번지만 먹히고, 절대 번지는 형식 자체상의 이유로 쓸 수 없다
dispatcher.forward(request, response); //제어권 넘기기
%>

<%-- <jsp:forward page = "forwardResult.jsp" /> --%>

<!-- 
forwardProc에서의 request와 forwardResult에서의 request는 같은 것이며,
관리는 forwardProc에서 한다. forwardResult의 request는 죽은 것이다
-->