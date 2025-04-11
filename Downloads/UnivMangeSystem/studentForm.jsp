<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
    request.setCharacterEncoding("UTF-8");

    String s_id = (String) session.getAttribute("s_id");
    String dept_name = (String) session.getAttribute("dept_name");
    String s_name = (String) session.getAttribute("s_name");


    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
%>

<!DOCTYPE html>
<html>
  <link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<title>학사 관리 시스템</title>
<head>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;400&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
    body,.h1,th,td {margin:0px;padding:0px;}
    table{border-collapse:collapse;border-spacing:0px}

    div {
        font-family: 'Gothic A1', sans-serif;
    }
    * {
    box-sizing: border-box;
    }

    body {
        font-family: 'Gothic A1', sans-serif;
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
    font-weight:bold;
    }

    @media screen and (max-width: 400px) {
      .topnav a {
          float: none;
          width: 100%;
      }
      }
    /* Add a card effect for articles R45 / G52 / B55*/
   .card {
    position: relative;
    background-color: #f3f3f3;
    padding:2px;
    overflow:clip;  
    width:100%;
    border:none;
    font-family: 'IBM Plex Sans KR', sans-serif;
  }
  

    /* Clear floats after the columns */
    .row:after {
    content: "";
    display: table;
    clear: both;
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

  ul {
  list-style-type: none;
  text-decoration:none;
  margin-left: 0px;
  padding: 0;
  overflow: hidden;
  background-color: #ffffff;
  height:70px;

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
    margin-bottom:0px;
    position:sticky;
  }
  p a{
    float:right;
    margin-top:10px;
    margin-right:20px;
  }
  i{
  color:#ffffff;
  }

  .active {
    position:relative;
    right:100px;
    border-bottom : 3px solid rgb(181,220,16);
  }
 #fromInsideOut li::after {
    border-collapse: collapse;
    position: absolute;
    content:""; 
    display: block; 
    bottom:-3px;
    border-bottom : 3px solid rgb(181,220,16);
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

    .h1 {
        font-family: inherit;
        font-weight: 300;
        line-height: 1.2;
        color: inherit;
        font-size: 1em;
    }
    h1{
        font-size: 2.3em;
    }
    .container {
        
        width: 80%;
        margin: 0 auto;
        padding: 0 auto;
        clear: both;
    }
    #company table {
        
        font-size: 18px;
        float: left;
        width: 460px;
        color: #5a5a5a;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    #company table th {
        font-weight: 500;
        font-weight: bold;
        width: 150px;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    .blue {
        color: #2D3437;
        font-weight: 500;
    }

.card photo {   
      display: inline-block;
      position: relative;
      vertical-align:middle;
      top: 60px;
      left: 25px;
    }

    .card t {  
        position: absolute;
        left: 270px;
        top:30px;
    }
  .signup {
    text-decoration: none;
    margin-top:25px;
    margin-right:70px;
    font-size:14px;
  }
  
  .signup:hover{
    text-decoration: underline;
    color:#B5DC10;
  }

</style>
</head>
<body style="overflow-x: hidden">
<%
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, "c##ysu", "1234");
        String sql = "select s.s_photo, s.s_name, s.s_id, d.dept_name, s.s_jumin, s.s_address, s.s_tel,s.s_state, s.s_email, s.s_grade, s.s_class, p.prof_name from student s INNER JOIN  department d ON  s.dept_id=d.dept_id INNER JOIN professor p ON s.prof_id=p.prof_id where s.s_id=?";

        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,s_id);
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
      <li class="active"><a href ="studentForm.jsp">정보관리</a></li>
      <li><a href ="subjectForm.jsp">수강신청</a></li>
      <li><a href ="schedule.jsp">수강 시간표</a></li>
      <li><a href="studentScoreForm.jsp">성적열람</a></li>
      <a href="Logout.jsp" class="signup">Logout</a>
    </ul>
</div>

  <%
  while (rs.next()) {
  String s_photo=rs.getString("s_photo");
  String s_grade = rs.getString("s_grade");
  String s_class = rs.getString("s_class");
  session.setAttribute("s_grade", s_grade);
  session.setAttribute("s_class", s_class);
  %>

  <div class="card" style="height:394px; overflow: scroll;">

    <div class="photo" style="float:left;">
      <photo><img src="<%=s_photo%>" style="width:200px; vertical-align:middle;"></photo>
    </div>
   
    <div id="company">
      <t>
      <h2 class="blue"><b>정보 관리</b></h2><hr>

      <div style="width:50%;float:left;">                            
          <table class="table">
              <tr>
                  <th>학번</th>
                  <td><%=rs.getString("s_id")%>
                  </td>
              </tr>
              <tr>
                  <th>이름</th>
                  <td><%=rs.getString("s_name")%></td>
              </tr>
              <tr>
                  <th>학과</th>
                  <td><%=rs.getString("dept_name")%></td>
              </tr>
              <tr>
                  <th>주민번호</th>
                  <td><%=rs.getString("s_jumin")%></td>
              </tr>
              <tr>
                  <th>연락처</th>
                  <td><%=rs.getString("s_tel")%></td>
              </tr>
              <tr>
                  <th>상태</th>
                  <td><%=rs.getString("s_state")%></td>
              </tr>
          </table>
          </div>
          <div style="width:50%;float:left;">              
          <table class="table">
              <tr>
                  <th>주소</th>
                  <td><%=rs.getString("s_address")%></td>
              </tr>
              <tr>
                  <th>이메일</th>
                  <td><%=rs.getString("s_email")%></td>
              </tr>
              <tr>
                <th>학년</th>
                <td><%=rs.getString("s_grade")%></td>
            </tr>             
            <tr>
              <th>반</th>
              <td><%=rs.getString("s_class")%></td>
          </tr>
              <tr>
                  <th>전담교수</th>
                  <td><%=rs.getString("prof_name")%></td>
              </tr>
              <tr>
                  <th>관리</th>
                  <td><a href="updateInfoManagerForm.jsp?s_photo=<%=rs.getString("s_photo")%>&s_id=<%=s_id%>&s_name=<%=s_name%>&dept_name=<%=dept_name%>&s_jumin=<%=rs.getString("s_jumin")%>&s_tel=<%=rs.getString("s_tel")%>&s_address=<%=rs.getString("s_address")%>&s_email=<%=rs.getString("s_email")%>&s_grade=<%=rs.getString("s_grade")%>&s_class=<%=rs.getString("s_class")%>&prof_name=<%=rs.getString("prof_name")%>">
                    <i class="fas fa-edit" style="color:rgb(107, 107, 107)"></a></i></td>
              </tr>
          </table>
      </div>
  </t>
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

</div>
  </div>
  <div class="footer" style="font-size:11px">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</body>

</html>