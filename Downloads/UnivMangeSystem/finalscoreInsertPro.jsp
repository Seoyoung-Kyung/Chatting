<!-- insertPro.jsp -->

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>City List</title>
</head>
<body>
<%
// POST 방식의 한글처리
request.setCharacterEncoding("UTF-8");

// 파라미터 정보 가져오기
String s_id = request.getParameter("s_id");
String sub_id = request.getParameter("sub_id");
String prof_id = request.getParameter("prof_id");
int final_score = Integer.parseInt(request.getParameter("final_score"));



// JDBC 참조 변수 준비
Connection con = null; 
PreparedStatement pstmt = null; 

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "c##ysu", pw = "1234";

// 1) JDBC 드라이버 로딩
Class.forName("oracle.jdbc.OracleDriver");

// 2) DB연결(DB url, DB id, DB pw)
con = DriverManager.getConnection(url, user, pw);

// 3) SQL문 준비
String sql = "update REGISTRATION set final_score="+final_score+", total_score=(middle_score+final_score+attendance+other_score) WHERE s_id=? and sub_id=?";

pstmt = con.prepareStatement(sql);
pstmt.setString(1, s_id);
pstmt.setString(2,sub_id);

// 4) 실행
pstmt.executeUpdate();

// JDBC 자원 닫기
pstmt.close();
con.close();
%>
<script>
alert("저장되었습니다.");
location.href = 'testManage.jsp';
</script>
</body>
</html>