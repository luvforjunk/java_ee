/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.52
 * Generated at: 2021-10-26 02:13:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class writeForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("#writeForm div {\r\n");
      out.write("	color: red;\r\n");
      out.write("	font-size: 8pt;\r\n");
      out.write("	font-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<form name=\"writeForm\" id=\"writeForm\" method=\"post\" action=\"\">\r\n");
      out.write("								<!-- action에서 member는 namespace로 구분자이다 -->\r\n");
      out.write("	<table border=\"1\" cellspacing=\"0\" cellpadding=\"5\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">이름</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"text\" name=\"name\" id=\"name\" placeholder=\"이름 입력\">\r\n");
      out.write("				<div id= \"nameDiv\"></div>\r\n");
      out.write("			</td>	\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">아이디</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"text\" name=\"id\" id=\"id\" placeholder=\"아이디 입력\">\r\n");
      out.write("				<input type=\"hidden\" id=\"check\" value=\"\">\r\n");
      out.write("				<div id= \"idDiv\"></div>\r\n");
      out.write("			</td>	\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">비밀번호</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"password\" name=\"pwd\" id=\"pwd\" size=\"30\" placeholder=\"비밀번호 입력\">\r\n");
      out.write("				<div id= \"pwdDiv\"></div>\r\n");
      out.write("			</td>	\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">재확인</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"password\" name=\"repwd\" id=\"repwd\" size=\"30\" placeholder=\"비밀번호 입력\">\r\n");
      out.write("				<div id= \"repwdDiv\"></div>\r\n");
      out.write("			</td>	\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">성별</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"radio\" name=\"gender\" value=\"0\" checked>남\r\n");
      out.write("				<input type=\"radio\" name=\"gender\" value=\"1\">여\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">이메일</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"text\" name=\"email1\">\r\n");
      out.write("				@\r\n");
      out.write("				<input type=\"text\" name=\"email2\" list=\"email2\" placeholder=\"직접입력\">\r\n");
      out.write("				<datalist id=\"email2\">\r\n");
      out.write("					<option value=\"naver.com\">naver.com\r\n");
      out.write("					<option value=\"daum.net\">daum.net\r\n");
      out.write("					<option value=\"gmail.com\">gmail.com\r\n");
      out.write("				</datalist>\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">핸드폰</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<select name=\"tel1\" style=\"width: 70px;\">\r\n");
      out.write("					<option value=\"010\" selected>010</option>\r\n");
      out.write("					<option value=\"011\" >011</option>\r\n");
      out.write("					<option value=\"019\" >019</option>\r\n");
      out.write("				</select>\r\n");
      out.write("				-\r\n");
      out.write("				<input type=\"text\" name=\"tel2\" size=\"6\" maxlength=\"4\">\r\n");
      out.write("				-\r\n");
      out.write("				<input type=\"text\" name=\"tel3\" size=\"6\" maxlength=\"4\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"100\" align=\"center\">주소</td>\r\n");
      out.write("			<td>\r\n");
      out.write("				<input type=\"text\" name=\"zipcode\" id=\"zipcode\" readonly>\r\n");
      out.write("				<input type=\"button\" value=\"우편번호 검색\" id=\"zipcodeBtn\"><br>\r\n");
      out.write("				<input type=\"text\" name=\"addr1\" id=\"addr1\" size=\"60\" placeholder=\"주소\" readonly><br>\r\n");
      out.write("				<input type=\"text\" name=\"addr2\" id=\"addr2\" size=\"60\" placeholder=\"상세주소\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td colspan=\"2\" align=\"center\">\r\n");
      out.write("				<input type=\"button\" id=\"writeBtn\" value=\"회원가입\">\r\n");
      out.write("				<input type=\"reset\" value=\"다시작성\">\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("</form>\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://code.jquery.com/jquery-3.6.0.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"../js/member.js\"></script>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
