<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");

   String s_id = request.getParameter("s_id");
   String s_name= request.getParameter("s_name");
   String sub_id= request.getParameter("sub_id");

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String url = "jdbc:oracle:thin:@localhost:1521:XE";

   %>
<!DOCTYPE html>
<html>
<head>
    <title>학사 관리 시스템</title>
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
    }
      /*.topnav a:hover{
        color:rgb(82, 151, 173);
      }*/
  
      @media screen and (max-width: 400px) {
        .topnav a {
            float: none;
            width: 100%;
        }
        }
      /* Add a card effect for articles R45 / G52 / B55*/
     .card {
      background-color: #f3f3f3;
      overflow:clip;  
      width:100%;
      border:none;
      padding: 20px;
      padding-top:20px;
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
      background-color: rgb(80,176,209); 
      width:100%;
      height:40px;
      color:#ffffff;
      font-size:14px;
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
  
    .active{
    border-bottom: 3px solid rgb(124, 196, 219);
    border-collapse:separate;
    color:#93c47d;
  }
  
    #fromInsideOut li:after {
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
  font-family: 'IBM Plex Sans KR', sans-serif;
  padding: 8px;
  font-weight: bold; 
  vertical-align: top; 
  border-left:5px solid rgb(146, 188, 202);
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
  width: 70px;
  height: 29px;
  border-top: none;
  border-left: none;
  border-right: none;
  border-bottom: none;
  border-radius: 10px;
  background-color:lightblue;
  font-size:15px;
  margin-top:8px;
  margin-bottom:10px;
  font-family: 'IBM Plex Sans KR', sans-serif;
    }

  </style>
</head>
<body >
<div>
  <p><a>| <%=session.getAttribute("dept_name")%> | <%=session.getAttribute("prof_name")%> (교직원) | </a></p>
</div>
<div class= "p">
  <img src="sc.png" width="100%" height="200px">
</div>

<div class="topnav">    
  <img src="logo.jpg">
 <ul id ="fromInsideOut">
    <li><a href ="professorForm.jsp">정보관리</a></li>
    <li><a href ="profTimeTable.jsp">강의 시간표</a></li>
    <li class="active"><a href ="testManage.jsp">성적 관리</a></li>
    <li><a href="seeTest.jsp">성적 열람</a></li>
    <li><a href="profClass.jsp">담당 학급</a></li>
    <a href="Logout.jsp" class="signup"><b>Logout</b></a>
  </ul>
</div>

<div class="card" style="overflow: scroll; overflow-x: hidden">
  <h3 class='blue'><b>&nbsp; 출석성적 입력</b></h3><hr>

  <table>
      <thead>
        <tr>
          <form method="post" action="attendanceInsertPro.jsp?s_id=<%=s_id%>&sub_id=<%=sub_id%>">
          <th scope="row">학번</th>
          <td><%=s_id%></td>
        </tr>
        <tr>
          <th scope="row">학생이름</th>
          <td><%=s_name%></td>
        </tr>
        <tr>
          <th scope="row">과목코드</th>
          <td><%=sub_id%></td>
        </tr>
        <tr>
          <th scope="row">출석성적</th>
          <td><input type="number" max="20" id="attendance" name="attendance" placeholder="20점 만점" autocomplete="off" required></td>
        </tr>
        <tr>
          <th scope="row">버튼</th>
          <td><input id="input2" type="submit" style="float:center;" value="입력완료"></td>
        </tr>
      
    </table>


  </div>




  </div>
  <div class="footer" style="font-size:11px">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</body>

</html>


