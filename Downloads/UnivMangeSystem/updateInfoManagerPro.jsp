<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
%>

<%// 변수 선언
	request.setCharacterEncoding("utf-8");

	String s_name = request.getParameter("s_name");
	String s_id = (String) session.getAttribute("s_id");
	String s_tel = request.getParameter("s_tel");
    String s_address = request.getParameter("s_address");
 	String s_email = request.getParameter("s_email");
%>

<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, "c##ysu", "1234");
		
		String sql = "update student set s_name=?, s_tel=?, s_address=?, s_email=? where s_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, s_name);
		pstmt.setString(2, s_tel);
		pstmt.setString(3, s_address);
		pstmt.setString(4, s_email);
		pstmt.setString(5, s_id);

		pstmt.executeUpdate();
%>

<script>
	alert("수정되었습니다.");
	location.href="studentForm.jsp";
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