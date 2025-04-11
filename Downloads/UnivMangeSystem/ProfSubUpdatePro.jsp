<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE"; %>
<%

    request.setCharacterEncoding("utf-8");

    //String sub_name = request.getParameter("prof_name");
    String pid = request.getParameter("prof_id");
    String subid = request.getParameter("sub_id");

try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, "c##ysu", "1234");
	
		String sql = "update prof_subject set prof_id = ? where sub_id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,pid);
        pstmt.setString(2,subid);

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
	location.href = 'deptProfSub.jsp';
}, 1000);
</script>