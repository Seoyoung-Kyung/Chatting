<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");

   String p_id = (String) session.getAttribute("prof_id");

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String url = "jdbc:oracle:thin:@localhost:1521:XE";

   %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
    <link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">

    <style>
      @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;400&display=swap');
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
      margin-top: 20px;
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
      background-color: rgb(80,176,209); 
      width:100%;
      height:40px;
      color:#ffffff;
      font-size:14px;
      margin-top:10px;
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
  
    .active {
    position:relative;
    right:100px;
    border-bottom : 3px solid rgb(124, 196, 219);
  }
   li.active {
       color: rgb(124, 196, 219);
   }
  
   #fromInsideOut li::after {
    border-collapse: collapse;
    position: absolute;
    content:""; 
    display: block; 
    bottom:-3px;
    border-bottom : 3px solid rgb(124, 196, 219);
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
      }
      #company table th {
          font-weight: 500;
          font-weight: bold;
          width: 150px;
      }
      .blue {
          color: #2D3437;
          font-weight: 500;
          padding-top: 30px;
      }
  
  .card photo {   
        display: inline-block;
        position: relative;
        vertical-align:middle;
        top: 90px;
        left: 25px;
      }
  
      .card t {  
          position: absolute;
          left: 200px;
          top:30px;
      }
      .signup{
     text-decoration: none;
    margin-top:25px;
    margin-right:70px;
    font-size:14px;
    font-weight: bold;

     }
  
     .signup:hover{
     text-decoration: underline;
    color:#16537e;
     }

  
table { 
  width:98%; 
  border-collapse: separate;
   border-spacing: 1px; 
   text-align: center; 
   line-height: 1.5; 
   margin: 20px 10px;
    border-bottom: 1px solid #DDD;
    }
table th { 
  padding: 8px;
   font-weight: bold; 
   vertical-align: top; 
   border-top:5px solid rgb(146, 188, 202);
    background-color:rgb(208, 234, 243);
     border-bottom: 1px solid #DDD; 
    }
table td { 
  font-family: 'IBM Plex Sans KR', sans-serif;
    padding: 8px; 
  vertical-align: top; 
  border-bottom: 1px solid #DDD;
   background-color:white;
   
   }
   #input2{
    font-family: 'IBM Plex Sans KR', sans-serif;
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
  }
  </style>
</head>
<title>학사 관리 시스템</title>
<body>
  <%
  try {
  Class.forName("oracle.jdbc.driver.OracleDriver");
  conn = DriverManager.getConnection(url, "c##ysu", "1234");
  String sql = "select s.sub_id, s.sub_name, s.sub_time, s.sub_info from subject s inner join prof_subject ps on s.sub_id=ps.sub_id inner join professor p on ps.prof_id=p.prof_id where p.prof_id=? and semester='1'";

  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1,p_id);
  rs = pstmt.executeQuery();
%>
<div>
  <p><a> | <%=session.getAttribute("dept_name")%> | <%=session.getAttribute("prof_name")%> (교직원) | </a></p>
</div>
<div class= "p">
  <img src="sc.png" width="100%" height="200px">
</div>

<div class="topnav">    
  <img src="logo.jpg">
 <ul id ="fromInsideOut">
    <li><a href ="professorForm.jsp">정보관리</a></li>
    <li class="active"><a href ="profTimeTable.jsp">강의 시간표</a></li>
    <li><a href ="testManage.jsp">성적 관리</a></li>
    <li><a href="seeTest.jsp">성적 열람</a></li>
    <li><a href="profClass.jsp">담당 학급</a></li>
    <a href="Logout.jsp" class="signup">Logout</a>
  </ul>
</div>

<div class="card" style="height:394px; overflow: scroll;">
  <div style="width:100%;">
  <h3 class='blue'><b>&nbsp; 강의 시간표>> 1학기</b></h3><hr></div>
  <div style="margin-left: 1px;">
    <a href="profTimeTable_1.jsp"><button id="input2"><b>1학기</b></button></a>
    <a href="profTimeTable.jsp"><button id="input2">2학기</button></a>
</div>
  <table>
          <thead>
               <tr>
               <th scope="cols">과목코드</th>
               <th scope="cols">과목명</th>
               <th scope="cols">강의시간</th>
               <th scope="cols">강의실</th>         
         </tr>
        </div>
         <%
            while (rs.next()) {
         %>
         <tr>
            <td><%=rs.getString("sub_id")%></td>
            <td><%=rs.getString("sub_name")%></td>
            <td><%=rs.getString("sub_time")%></td>
            <td><%=rs.getString("sub_info")%></td>
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
    </table>


  </div>




  </div>
  <div class="footer" style="font-size:11px">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</body>

</html>


