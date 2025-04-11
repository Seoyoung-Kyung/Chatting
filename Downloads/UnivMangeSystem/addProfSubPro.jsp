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

   String s_id = request.getParameter("sub_id");
   String p_id = request.getParameter("prof_id");
%>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##ysu", "1234");
    
    String sql = "insert into prof_subject(sub_id, prof_id) values (?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,s_id);
    pstmt.setString(2,p_id);

    pstmt.executeUpdate();	
%>
<script>
    alert("추가되었습니다.");
    location.href="deptProfSub.jsp";
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
