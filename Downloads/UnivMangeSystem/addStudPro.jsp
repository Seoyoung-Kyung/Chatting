<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
%>
<%
   request.setCharacterEncoding("utf-8");

   String d_name = (String) session.getAttribute("dept_name"); 
   String d_id = (String) session.getAttribute("dept_id"); 

   String s_id = request.getParameter("s_id");
   String s_name = request.getParameter("s_name");
   String prof_id = request.getParameter("prof_id");  
   String s_jumin = request.getParameter("s_jumin");
   String s_address = request.getParameter("s_address");  
   String s_tel = request.getParameter("s_tel");
   String s_email = request.getParameter("s_email");
   String s_grade = request.getParameter("s_grade");
   String s_class = request.getParameter("s_class");
%>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##ysu", "1234");
    
    String sql = "insert into student(s_id, s_name, prof_id, s_jumin, s_address, s_tel, s_email, s_grade, s_class, dept_id) ";
    sql += "values (?,?,"+prof_id+",?,?,?,?,?,?,?) ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,s_id);
    pstmt.setString(2,s_name);
    pstmt.setString(3,s_jumin);
    pstmt.setString(4,s_address);
    pstmt.setString(5,s_tel);
    pstmt.setString(6,s_email);
    pstmt.setString(7,s_grade);
    pstmt.setString(8,s_class);
    pstmt.setString(9,d_id);

    pstmt.executeUpdate();	
%>
<script>
    alert("추가되었습니다.");
    location.href="studMgt.jsp";
</script>

<%

  }catch(Exception e){ 
      e.printStackTrace();
  }finally{
      
      if(rs != null) 
             try{rs.close();}catch(SQLException sqle){}
      if(pstmt != null) 
             try{pstmt.close();}catch(SQLException sqle){}
      if(conn != null) 
             try{conn.close();}catch(SQLException sqle){}
}
%>
