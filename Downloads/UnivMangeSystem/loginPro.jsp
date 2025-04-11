<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
      String url = "jdbc:oracle:thin:@localhost:1521:XE"; %>
<%

   request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   session.setAttribute("id",id);
   String pass = request.getParameter("passwd");

try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, "c##ysu", "1234");
	
		String sql = "select s.s_id, substr(s.s_jumin,1,6) s_birthday, p.prof_id ,substr(p.prof_jumin,1,6) p_birthday, ";
      sql += "d.dept_id ,substr(d.dept_tel, 9,4) d_tel, s.s_name, p.prof_name,d.dept_name ";
      sql += "from student s right join professor p on (s.prof_id = p.prof_id) inner join department d on (p.dept_id =d.dept_id) ";
      sql += "where s.s_id=? or p.prof_id =? or d.dept_id = ?";

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,id);
      pstmt.setString(2,id);
      pstmt.setString(3,id);
      rs = pstmt.executeQuery();
      
      while (rs.next()) {
         String s_bd = rs.getString("s_birthday");
			String p_bd = rs.getString("p_birthday");
			String d_telnum = rs.getString("d_tel");
         String s_name = rs.getString("s_name");
         String prof_name = rs.getString("prof_name");
         String dept_name = rs.getString("dept_name");
         String dept_id = rs.getString("dept_id");
         String prof_id = rs.getString("prof_id");
         String s_id = rs.getString("s_id");

         if (p_bd.equals(pass) && prof_id.equals(id)) {
            session.setAttribute("dept_name", dept_name);
            session.setAttribute("prof_name", prof_name);
            session.setAttribute("prof_id", prof_id);
            session.setAttribute("dept_id", dept_id);
            response.sendRedirect("professorForm.jsp");
         } 
         
         if (d_telnum.equals(pass) && dept_id.equals(id)) {
            session.setAttribute("dept_id", dept_id);
            session.setAttribute("dept_name", dept_name);
            session.setAttribute("prof_id", prof_id);
            response.sendRedirect("departmentForm.jsp");
         } 
         
         if (s_bd.equals(pass) && s_id.equals(id)) {
            session.setAttribute("dept_name", dept_name);
            session.setAttribute("s_name", s_name);
            session.setAttribute("dept_id", dept_id);
            session.setAttribute("prof_id", prof_id);
            session.setAttribute("s_id", s_id);
            response.sendRedirect("studentForm.jsp");
         }
      }
%>
<script>
    alert("로그인에 실패했습니다. 아이디/비밀번호를 다시 확인하세요");
    location.href="login.jsp";
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