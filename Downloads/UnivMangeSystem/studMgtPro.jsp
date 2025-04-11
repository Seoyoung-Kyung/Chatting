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
   
   String prof_id = (String)session.getAttribute("prof_id");
   String d_id = (String)session.getAttribute("dept_id");
   String p_name = request.getParameter("prof_name");
   String s_id = request.getParameter("s_id");
   String s_name = request.getParameter("s_name");  
   String s_tel = request.getParameter("s_tel");
   String s_email = request.getParameter("s_email");
   String s_grade = request.getParameter("s_grade");
   String s_state = request.getParameter("s_state");
%>
<%
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##ysu", "1234");
    
    String sql = "update student set s_state=? where s_id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,s_state);
    pstmt.setString(2,s_id);

    pstmt.executeUpdate();	
%>
<script>
    alert("수정되었습니다.");
    location.href="studMgt.jsp";
  </script>
<%
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
