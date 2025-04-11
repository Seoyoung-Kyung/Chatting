<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ page import="java.sql.*"%>
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");

  request.setCharacterEncoding("utf-8");

  String s_name = (String) session.getAttribute("s_name");
  String s_id = (String) session.getAttribute("s_id");
  String dept_name = request.getParameter("dept_name");
  String s_jumin = request.getParameter("s_jumin");
  String s_tel = request.getParameter("s_tel");
  String s_address = request.getParameter("s_address");
  String s_email = request.getParameter("s_email");
  String s_grade = request.getParameter("s_grade");
  String s_class = request.getParameter("s_class");  
  String prof_name = request.getParameter("prof_name"); 
  String s_photo = request.getParameter("s_photo");
  String s_state = request.getParameter("s_state");
 
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<meta charset="UTF-8">
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
    }
    .topnav a:hover{
      color:#000000;
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
    font-family: 'IBM Plex Sans KR', sans-serif;
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
    table {
        
        font-size: 18px;
        float: left;
        width: 460px;
        color: #5a5a5a;
        font-family: 'IBM Plex Sans KR', sans-serif;
    }
    table th {
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
   input{
     weight:10px;
     
   }
   input[type="button"]{
    font-family: 'IBM Plex Sans KR', sans-serif;
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: none;
    border-radius: 20px;
    background-color:white;
   }
   input[type="submit"]{
    width: 200px;
    height: 40px;
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: none;
    border-radius: 20px;
    background-color:white;
    position:relative;
    left:250px;
    font-size:17px;
   }
</style>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  function kakaopost() {
      new daum.Postcode({
          oncomplete: function(data) {
             document.querySelector("#address").value =  data.address
          }
      }).open();
  }
  </script>
</head>
<title>학사 관리 시스템</title>
<body style="overflow-x: hidden">

<div>
  <p><a>| <%=session.getAttribute("dept_name")%> | <%=session.getAttribute("s_name")%> (학생) |</a></p>
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
      <a href="Logout.jsp" class="signup"><b>Logout</b></a>
    </ul>
</div>

  <div class="card" style="height:394px; overflow: scroll;">
 <div class="photo" style="float:left;">
      <photo><img src="<%=s_photo%>" style="width:200px; vertical-align:middle;"></photo>
    </div>
      <div id="company">
      <t>
      <h1 class="blue"><b>정보 관리</b></h1><hr>

      <div style="width:50%;float:left;">
        <table class="table">
          <form method="post" action="updateInfoManagerPro.jsp">
          <tr>
              <th>학번</th>
              <td><%=s_id%></td>
            </tr>
            <tr>
              <th>이름</th>
              <td><input type="text" id="s_name" name="s_name" value="<%=s_name%>" required></td>
            </tr>
            <tr>
              <th>학과</th>
              <td><%=dept_name%></td>
            </tr>
            <tr>
              <th>주민번호</th>
              <td><%=s_jumin%></td>
            </tr>
            <tr>
              <th>연락처</th>
              <td><input type="text" id="s_tel" name="s_tel" value="<%=s_tel%>" required></td>
            </tr>
        </table>
      </div>
      <div style="width:50%;float:left;margin-top:-9px;"> 
        <table class="table">
            <tr>
              <th>주소</th>
              <td style="float: left;">
              <input type="text" name="s_address" id="address" size="70"style="width:150px;"autocomplete="off">
              <input type="button"  class="btn btn-light" value="주소검색" onclick="kakaopost()" ></td>
            </tr>
            <tr>
              <th>이메일</th>
              <td><input type="email" id="s_email" name="s_email" value="<%=s_email%>" required></td>
            </tr>
            <tr>
              <th>학년</th>
              <td><%=s_grade%></td>
            </tr>
            <tr>
              <th>반</th>
              <td><%=s_class%></td>
            </tr>
            <tr>
              <th>전담교수</th>
              <td><%=prof_name%></td>
            </tr>
        </table>
      </div>
      <input type="submit" style="position:relative; right:3em;" value="입력완료">
    </div>


</div></div>
  <div class="footer">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>

</body>
</html>


