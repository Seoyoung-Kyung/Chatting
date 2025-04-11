<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
      String url = "jdbc:oracle:thin:@localhost:1521:XE"; %>
<%

   request.setCharacterEncoding("utf-8");

    String d_id = (String) session.getAttribute("dept_id");
    String d_name = request.getParameter("dept_name");
    String d_tel = request.getParameter("dept_tel");
    String d_location = request.getParameter("dept_location");

try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, "c##ysu", "1234");
	
		String sql = "update department set dept_name =?, dept_tel =?, dept_location=? where dept_id =?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,d_name);
        pstmt.setString(2,d_tel);
        pstmt.setString(3,d_location);
        pstmt.setString(4,d_id);
        session.setAttribute("dept_name",d_name);

        pstmt.executeUpdate();
      
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

<script>
setTimeout(function(){
    alert("수정되었습니다.");
	location.href = 'departmentForm.jsp';
}, 1000);
</script>