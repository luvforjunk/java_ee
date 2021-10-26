package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/HelloServlet") 
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("실행하자마자 제일 먼저 호출되는 함수 - init()");
	} // Servlet은 브라우저 결과를 찾을 때 init을 가장 먼저 찾는다
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		System.out.println("클라이언트 요청이 있을 때마다 호출하는 함수 - service()");
		
		response.setContentType("text/html"); // 이제부터 쓰는 모든 문서를 html로 인식해라
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("Hello Servlet!!");
		out.println("</body>");
		out.println("</html>");
	}
	@Override
	public void destroy() {
		System.out.println("서블릿 종료될 때 호출된다 - destroy()");
	}
}

