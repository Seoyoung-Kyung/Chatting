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
   
   String d_id = (String)session.getAttribute("dept_id");
   String prof_id = (String)session.getAttribute("prof_id");
   String prof_name = request.getParameter("prof_name");
   String prof_jumin = request.getParameter("prof_jumin");  
   String prof_address = request.getParameter("prof_address");
   String prof_tel = request.getParameter("prof_tel");  
   String prof_email = request.getParameter("prof_email");
   String prof_photo = request.getParameter("prof_photo");  
  
%>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##ysu", "1234");
    
    String sql = "update professor set prof_address=?,prof_tel=?, prof_email=? where prof_id=?";
    pstmt = conn.prepareStatement(sql);
 
    pstmt.setString(1,prof_address);
    pstmt.setString(2,prof_tel);
    pstmt.setString(3,prof_email);  
    pstmt.setString(4,prof_id);    
    pstmt.executeUpdate();	
%>
<script>
    alert("수정되었습니다.");
    location.href="professorForm.jsp";
  </script>
<%
    rs.close();
    pstmt.close();
    conn.close();
  }catch(Exception e){ 
      e.printStackTrace();
  }finally{
	try{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}catch(Exception e){
		e.printStackTrace();
    }
}
%>
