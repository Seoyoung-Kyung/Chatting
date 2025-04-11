<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");

   String sub_id = (String) session.getAttribute("sub_id");
   String name = (String) session.getAttribute("dept_name");
   String d_id = (String) session.getAttribute("dept_id");

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String url = "jdbc:oracle:thin:@localhost:1521:XE";

   %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<title>학사 관리 시스템</title>
<head>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300;400&display=swap');
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

  table { 
    font-family: 'IBM Plex Sans KR', sans-serif;
    width: 99%; 
    border-collapse: collapse; 
    border-spacing: 1px; 
    text-align: center; 
    line-height: 1.5; 
    margin: 1px 5px; 
    border-bottom: 1px solid #DDD;
  }

  table th { 
    padding: 8px; 
    font-weight: bold; 
    vertical-align: top; 
    border-left:3px solid #f783c0; 
    background-color:#ffe6f3; 
    border-bottom: 1px solid #DDD; 
  }

  table td { 
    padding: 8px; 
    vertical-align: top; 
    border-bottom: 1px solid #DDD; 
    background-color:white; 
  }

  .btn-group .button {
    background-color: #a8a8a8; /* Green */
    border: 1px solid rgb(155, 155, 155);
    color: white;
    padding: 3px 3px;
    text-align: center;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
    width: 235px;
    height: 50px;
    display: block;
  }

  .btn-group .button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
  }

  .btn-group .button:hover {
  background-color:#808080;
  }

  .button a {
  text-decoration: none;
  color:#ffffff
  }

  /* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
  @media screen and (max-width: 400px) {
    .topnav a {
        float: none;
        width: 100%;
    }
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
  }

  li a {
    display: block;
    color: white;
    text-align: center;
    text-decoration:none;
    padding: 14px 16px;
  }

  p {
    background-color:rgb(239,35,142);  
    width:100%;
    height:40px;
    color:#ffffff;
    font-size:14px;
    margin-bottom:0px;
  }
  p a {
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
    border-bottom : 3px solid rgb(239,35,142); 
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
    color:#16537e;
  }

  .active{
    border-bottom: 3px solid rgb(239,35,142);
    border-collapse:separate;
    color:#93c47d;
    
  }

#input2{
  font-family: 'IBM Plex Sans KR', sans-serif;
  width: 200px;
  height: 40px;
  border-top: none;
  border-left: none;
  border-right: none;
  border-bottom: none;
  border-radius: 20px;
  background-color:white;
  position:relative;
  left:670px;
  font-size:17px;
  margin-top:10px;
}

#img {    
    display: inline-block;
    position: relative;
    vertical-align:middle;
    top: 5px;
    left: 15px;
}

#sk{
  font-family: 'IBM Plex Sans KR', sans-serif;
    background-color: white;
    border: 1px solid white;
    border-radius: 10px;
    display: inline-block;
    font: inherit;
    font-size: 13px;
    line-height: 1.5em;
    padding: 0.3em 2.5em 0.3em 1em;
    outline:0;

    margin: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    -webkit-appearance: none;
    -moz-appearance: none;

    background-image:
    linear-gradient(45deg, transparent 50%, gray 50%),
    linear-gradient(135deg, gray 50%, transparent 50%),
    radial-gradient(#ddd 0%, transparent 0%);
    background-position:
    calc(100% - 20px) calc(0.8em + 2px),
    calc(100% - 15px) calc(0.8em + 2px),
    calc(100% - .5em) .5em;
    background-size:
    5px 5px,
    5px 5px,
    1.5em 1.5em;
    background-repeat: no-repeat;
}
#sub_id, #sub_name, #credits, #sub_info, #sub_time {
  font-family: 'IBM Plex Sans KR', sans-serif;
  width: 180px;
  height: 29px;
  border-top:none;
  border-left: none;
  border-right: none;
  border-bottom: 2px solid gray;
}

</style>
</head>
<body style="overflow-x: hidden">
  <div>
    <p><a>| <%=session.getAttribute("dept_name")%> (학과) |</a></p>
  </div>
<div class= "p">
  <img src="sc.png" width="100%" height="200px">
</div>
<div class="topnav">    
    <img src="logo.jpg">
      <ul id ="fromInsideOut" style="font-weight:bold;">
          <li><a href ="deptMgt.jsp">학과 관리</a></li>
          <li class="active"><a href="deptSubjectForm.jsp">개설 과목</li></a>
          <li><a href ="profMgt.jsp">교수 정보</a></li>
          <li><a href="studMgt.jsp">학생 정보</a></li>
          <li><a href="deptProfSub.jsp">과목별 담당 교수 </a></li>
          <a href="Logout.jsp" class="signup">Logout</a>
        </ul>
    </div>
    <div class="card" style="overflow:scroll; height:410px; overflow-x: hidden;">   
    <div style="width:100%; float:center;">
    <h3 style="font-weight:bold;">&nbsp; 개설 과목 추가 
    <a href ="deptSubjectForm.jsp"><i class="fas fa-arrow-left" style="font-size:28px; color:rgb(54, 54, 54); float:right;">&nbsp;&nbsp;&nbsp;</i></a>
    </h3>
    <hr>
  </div>
  <form method="post" action="subjectInsertPro.jsp">
        <table class="type11">
        &nbsp;
            <tr>
              <th scope="cols">과목 코드</th>
              <td><input type="text" id = "sub_id" name="sub_id" placeholder="과목 코드" autocomplete="off"></td>
            </tr>
              <th scope="cols">과목명</th>
              <td><input type="text" id = "sub_name" name="sub_name" placeholder="과목명" autocomplete="off"></td>
            </tr>   
               <th scope="cols">학점</th>
               <td><input type="text" id = "credits" name="credits" placeholder="학점" autocomplete="off"></td>
            </tr>
              <th scope="cols">강의 시간</th>
              <td><input type="text" id = "sub_time" name="sub_time" placeholder="강의 시간" autocomplete="off"></td>
            </tr>
              <th scope="cols">강의실</th>
              <td><input type="text" id = "sub_info" name="sub_info" placeholder="강의실" autocomplete="off"></td>
            </tr>
      </table>
    <input id="input2" type="submit" value="입력완료">       
  </form>
</div>
  <div class="footer">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</body>
</html>


