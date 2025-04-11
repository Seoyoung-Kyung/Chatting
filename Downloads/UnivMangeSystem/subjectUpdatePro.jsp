<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE"; %>
<%

    request.setCharacterEncoding("utf-8");

    String p_id = (String) session.getAttribute("p_id");
    String sub_id = request.getParameter("sub_id");
    String credits = request.getParameter("credits");
    String sub_name = request.getParameter("sub_name");
    String sub_time = request.getParameter("sub_time");
    String sub_info = request.getParameter("sub_info");

try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, "c##ysu", "1234");
	
		String sql = "update subject set sub_name='"+sub_name+"',sub_time='"+sub_time+"',sub_info='"+sub_info+"',credits='"+credits+"' where sub_id='"+sub_id+"'";
        pstmt = conn.prepareStatement(sql);

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
	location.href = 'deptSubjectForm.jsp';
}, 1000);
</script>