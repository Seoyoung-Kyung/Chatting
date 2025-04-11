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

   String prof_id = request.getParameter("prof_id");
   String prof_name = request.getParameter("prof_name");
   String prof_jumin = request.getParameter("prof_jumin");  
   String prof_address = request.getParameter("prof_address");
   String prof_tel = request.getParameter("prof_tel");  
   String prof_email = request.getParameter("prof_email");
%>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##ysu", "1234");
    
    String sql = "insert into professor(dept_id, prof_id, prof_name, prof_jumin, prof_address, prof_tel, prof_email) values (?,?,?,?,?,?,?) ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,d_id);
    pstmt.setString(2,prof_id);
    pstmt.setString(3,prof_name);
    pstmt.setString(4,prof_jumin);
    pstmt.setString(5,prof_address);
    pstmt.setString(6,prof_tel);
    pstmt.setString(7,prof_email);

    pstmt.executeUpdate();	
%>
<script>
    alert("추가되었습니다.");
    location.href="profMgt.jsp";
</script>

<%
    rs.close();
        pstmt.close();
        conn.close();
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
