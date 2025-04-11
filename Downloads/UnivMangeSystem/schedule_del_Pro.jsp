<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
	request.setCharacterEncoding("utf-8");
  String sid = (String)session.getAttribute("s_id");
  String subid = request.getParameter("sub_id");
  String state = request.getParameter("state");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
  %>

 <%
  
  Class.forName("oracle.jdbc.driver.OracleDriver");
  conn = DriverManager.getConnection(url, "c##ysu", "1234");
  String sql = "update REGISTRATION set reg_state = ? where s_id= '"+sid+"' and sub_id = '"+subid+"'";
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1,state);
  rs = pstmt.executeQuery();
  response.sendRedirect("schedule.jsp");

%> 