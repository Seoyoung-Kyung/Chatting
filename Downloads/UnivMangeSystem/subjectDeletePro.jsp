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

   String sk = request.getParameter("sk");
   String s_id = request.getParameter("sub_id");

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, "c##ysu", "1234");
    
    String sql = "update subject set sub_state='"+sk+"'where sub_id='"+s_id+"'";
    pstmt = conn.prepareStatement(sql);

    pstmt.executeUpdate();	
%>
<script>
    alert("수정되었습니다.");
    location.href="deptSubjectForm.jsp";
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
