<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ page import="cos.bean.CosDTO"%>
<%@ page import="cos.dao.CosDAO"%>
<%
//데이터
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String repwd = request.getParameter("repwd");
String gender = request.getParameter("gender");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String zipcode = request.getParameter("zipcode");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");


CosDTO cosDTO = new CosDTO();
cosDTO.setName(name);
cosDTO.setId(id);
cosDTO.setPwd(pwd);
cosDTO.setRepwd(repwd);
cosDTO.setGender(gender);
cosDTO.setEmail1(email1);
cosDTO.setEmail2(email2);
cosDTO.setTel1(tel1);
cosDTO.setTel2(tel2);
cosDTO.setTel3(tel3);
cosDTO.setZipcode(zipcode);
cosDTO.setAddr1(addr1);
cosDTO.setAddr2(addr2);

//DB
CosDAO cosDAO = CosDAO.getInstance();
cosDAO.writeCheck(cosDTO); 

//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h3>회원가입이 완료되었습니다</h3>
	<br>
	<input type="button" id="LoginBtn" value="로그인" onclick="location.href='login.jsp?pg=1'">
</body>
</html>