<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
  request.setCharacterEncoding("utf-8");
  String s_name = (String)session.getAttribute("s_name");
  String dept_name = (String)session.getAttribute("dept_name");
  String dept_id = (String)session.getAttribute("dept_id");
  String s_id = (String)session.getAttribute("s_id");
  String s_class = (String)session.getAttribute("s_class");
  String s_grade = (String)session.getAttribute("s_grade");
 
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String url = "jdbc:oracle:thin:@localhost:1521:XE";
   System.out.println(s_class);
   System.out.println(s_grade);
 %>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;400&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
    div {
        font-family: 'Gothic A1', sans-serif;
        position:relative;
    }
    * {
    box-sizing: border-box;
    }

    body {
    font-family: Arial;
    padding: 10px;
    background: white;
    }
    .p {
        text-align: center;
        filter: brightness(90%); 

    }
    /* Header/Blog Title */
    .header{
        height: 15px;
        float: right;
        background-color: #04AA6D;

    }

    /* Style the top navigation bar */
    .topnav {
    overflow: hidden;
    background-color: #ffffff;
    height:80px;
    width:100%;
    border: solid 1px;  
    border-color:#d6d6d6;
    position: sticky;
    font-weight:bold;
    }

    .topnav img{
        float:left;
        padding-top:-50px;
        margin-top:20px;
        margin-left:40px; 
        width:150px;
        height:38px;
    }
    .topnav a {
    float: right;
    display: block;
    color: #000000;
    text-align: center;
    }

    /* Fake image */
    .fakeimg {
    background-color: #aaa;
    width: 100%;
    padding: 20px;
    }

    /* Add a card effect for articles R45 / G52 / B55*/
   .card {
    background-color: #f3f3f3;
    padding:2px;
    overflow:clip;  
    width:100%;
    border:none;
    font-family: 'IBM Plex Sans KR', sans-serif;
  }

    /* Footer */
     .footer {
    padding: 20px;
    background: #ddd;
    margin-top: 10px;
    width: 100%;
    height: 90px;
    bottom: 0px;
    border-top: 1px solid #c4c4c4;
    color: #808080;
    padding-top: 25px;
    font-size: 11px;
    }

    .footer p {
    display: inline-block;
    margin: 0 20px 10px 20px;
    color: #808080; font-size: 11px;
    background: #ddd;
    }

    .footer p:visited {
    color: #808080;
    }

    .footer p {
    margin-top: 0; 
    margin-bottom: 0;   
    }

    .footer p span {
    display: inline-block;
    margin-left: 20px;
    }

    table { 
      width:98%; 
      border-collapse: separate;
      border-spacing: 1px; 
      text-align: center; 
      line-height: 1.5; 
      margin: 20px 10px; 
      border-bottom: 1px solid #DDD; 
      font-size:14px;
    }

    table th { 
      padding: 8px; 
      font-weight: bold; 
      vertical-align: top; 
      border-top:5px solid #B5DC10; 
      background-color:#E4F7BA; 
      border-bottom: 1px solid #DDD; 
      font-family: 'IBM Plex Sans KR', sans-serif;
    }

    table td { 
      padding: 8px; 
      vertical-align: top; 
      border-bottom: 1px solid #DDD; 
      background-color:white; 
      font-family: 'IBM Plex Sans KR', sans-serif;
    }

  ul {
  list-style-type: none;
  text-decoration:none;
  margin-left: 0px;
  padding: 0;
  border-collapse: collapse;
  background-color: #;
  height:70px;
  weight:100%;
  }

  li {
    float:left;
    position:relative;
    left:50px;
    top:10px;
    font-weight: bold;
  }

  li a {
    display: block;
    color: white;
    text-align: center;
    text-decoration:none;
    padding: 14px 16px;
  }

  p{
    background-color: rgb(181,220,16);  
    width:100%;
    height:40px;
    color:#ffffff;
    font-size:14px;
    margin-top:0px;
    margin-bottom:0px;
  }

  p a{
    float:right;
    margin-top:10px;
    margin-right:20px;
  }

  i{
  color:#ffffff;
  }

  #fromInsideOut li::after {
    border-collapse: collapse;
    position: absolute;
    content:""; 
    display: block; 
    bottom:-3px;
    border-bottom : 3px solid  rgb(181,220,16);
    transition: all 250ms ease-out; 
    left: 50%; 
    width: 0;
  } 
  #fromInsideOut li:hover::after {
    border-collapse: collapse;
    transition: all 250ms ease-out; 
    margin-top:25px;
    left: 0%; 
    width: 90%;
    margin-left:0.3em;
  }
  .signup{
    text-decoration: none;
    margin-top:25px;
    margin-right:70px;
    font-size:14px;
	}


	.signup:hover{
	text-decoration: underline;
  color:#B5DC10;
	}

  .active {
    position:relative;
    right:100px;
    border-bottom : 3px solid rgb(181,220,16);
  }
  .blue{
    margin-left:0.8em;
    margin-top:0.5em;
  }
/*
 #btn_submit{
   margin-left: 75em;
   margin-top: 13px;
   margin-bottom:-20px;
   font-size:14px;
   width: 10%;
   height: 30px;  
   font-weight:bold;
   font-family: 'Nanum Gothic Coding', monospace;
 }
*/
 input[type="submit"]:hover{
    	text-decoration: none;  
 }
 #btn_submit{
    width: 80px;
    height: 30px;
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: none;
    border-radius: 20px;
    background-color:white;
    position:relative;
    left:10px;
    font-size:15px;
    color:black;
    font-family: 'Nanum Gothic Coding', monospace;
 }
</style>
</head>
<body style="overflow-x: hidden">
<title>학사 관리 시스템</title>
<%
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String sql = "select prof_subject.sub_id, subject.sub_name, subject.credits, subject.sub_time, subject.sub_info, professor.prof_name from professor, subject, prof_subject where professor.prof_id = prof_subject.prof_id and prof_subject.sub_id = subject.sub_id and subject.dept_id = '"+dept_id+"' and substr(subject.sub_id,1,1) = '"+s_grade+"'and substr(subject.sub_id,2,1) = '"+s_class+"'";
    conn = DriverManager.getConnection(url, "c##ysu", "1234");

    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
 %>
  <div>
      <p><a>| <%=session.getAttribute("dept_name")%> | <%=session.getAttribute("s_id")%> <%=session.getAttribute("s_name")%> (학생) |</a></p>
  </div>

<div class= "p">
    <img src="sc.png" width="100%" height="200px">
</div>

<div class="topnav">    
    <img src="logo.jpg">
      <ul id ="fromInsideOut">
          <li><a href ="studentForm.jsp">정보관리</a></li>
          <li class="active"><a href ="subjectForm.jsp">수강신청</a></li>
          <li><a href ="schedule.jsp">수강 시간표</a></li>
          <li><a href="studentScoreForm.jsp">성적열람</a></li>
          <a href="login.jsp" class="signup">Logout</a>
        </ul>
</div>


<div class="card" style="overflow: scroll;">
  <div style="width:100%;">
    <h3 class='blue'><b><%=session.getAttribute("dept_name")%> <%=session.getAttribute("s_grade")%>-<%=session.getAttribute("s_class")%>반 강의</b></h3><hr>
  </div>
  <div class = "form" style="overflow-x: hidden">
      <form action = "subjectPro.jsp" method="post" >
      <div style="margin-left: 10px;">
      <input type="submit" id="btn_submit" value="신청" class="btn btn-outline-secondary">
      </div>
    <div class = "table">
        <table><a style="font-size:25px; font-weight:bold;"></a>
          <thead>
            <tr>
              <th scope="cols">선택</th>
              <th scope="cols">강의 번호</th>
              <th scope="cols">강의 이름</th>
              <th scope="cols">학점</th>
              <th scope="cols">강의 시간</th>
              <th scope="cols">강의실</th>
              <th scope="cols">담당교수</th>
            </tr>
          </thead>
          <tbody>
            <%
              while (rs.next()) {
            	  String subid = rs.getString("sub_id");
              %>
                <tr>
                  <td><input type = "checkbox" name = sub_id value=<%=subid%>></td>
                  <td><%=rs.getString("sub_id")%></td>
                  <td><%=rs.getString("sub_name")%></td>
                  <td><%=rs.getString("credits")%></td>
                  <td><%=rs.getString("sub_time")%></td>
                  <td><%=rs.getString("sub_info")%></td>
                  <td><%=rs.getString("prof_name")%></td>
                </tr>
                
<%
}
} catch (Exception e) {
e.printStackTrace();
} finally {
try {
if (rs != null) {
   rs.close();
}
if (pstmt != null) {
   pstmt.close();
}
if (conn != null) {
   conn.close();
}
} catch (Exception e) {
e.printStackTrace();
}
}
%>
          </tbody>
          </table>
        </div>
      </form>
   </div>
</div>
  </div>
  <div class="footer">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</div>
</body>

</html>