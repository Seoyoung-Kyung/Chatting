<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");

   String prof_id = (String)session.getAttribute("prof_id");
   String prof_name = (String)session.getAttribute("prof_name");
  
   String prof_address = request.getParameter("prof_address");
   String prof_tel = request.getParameter("prof_tel");
   String prof_email = request.getParameter("prof_email");

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String url = "jdbc:oracle:thin:@localhost:1521:XE";

 %>
<!DOCTYPE html>
<html>
  <link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
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
  <head>
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
<body style="overflow-x: hidden">
<%
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, "c##ysu", "1234");
String sql = "select p.prof_photo,p.prof_id,p.prof_name,d.dept_name,p.prof_jumin,p.prof_address,p.prof_tel,p.prof_email,regexp_replace(LISTAGG(s.sub_name,',') WITHIN GROUP(ORDER BY s.sub_name desc), '([^,]+)(,\1)+', '\1') sub_name, LISTAGG(s.sub_name, ', ')WITHIN GROUP( order by s.sub_name desc)  as sub_name,LISTAGG(s.sub_id, ', ')WITHIN GROUP( order by s.sub_id desc)as sub_id,prof_state from professor p INNER JOIN prof_subject ps ON p.prof_id=ps.prof_id INNER JOIN subject s ON ps.sub_id=s.sub_id INNER JOIN department d ON d.dept_id=p.dept_id where p.prof_id=? group by p.prof_photo, p.prof_id, p.prof_name, d.dept_name, p.prof_jumin, p.prof_address, p.prof_tel, p.prof_email,p.prof_state";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1,prof_id);
rs = pstmt.executeQuery();
%>
    <%
    while (rs.next()) {
    String prof_photo=rs.getString("prof_photo");

%>
<div>
    <p><a> | <%=session.getAttribute("dept_name")%> | <%=session.getAttribute("prof_name")%> (교직원) |</a></p>
  </div>
  <div class= "p">
    <img src="sc.jpg" width="100%" height="300px">
  </div>
  
  <div class="topnav">    
    <img src="logo.jpg">
   <ul id ="fromInsideOut">
    <li class="active"><a href ="professorForm.jsp">정보관리</a></li>
      <li><a href ="profTimeTable.jsp">강의 시간표</a></li>
      <li><a href ="testManage.jsp">성적 관리</a></li>
      <li><a href="seeTest.jsp">성적 열람</a></li>
      <li><a href="profClass.jsp">담당 학급</a></li>
  
      <a href="Logout.jsp" class="signup"><b>Logout</b></a>
    </ul>
  
  </div>

<div class="card" style="height:394px; overflow: scroll;"> 

    <div class="photo" style="float:left;">
      <photo><img src="<%=prof_photo%>" style="width:200px; vertical-align:middle;"></photo>
    </div>
      <div id='company'>
        <t>
        <h3 class='blue'><b>정보 수정</b></h3><hr>

      <form method="post"  action="updateProfPro.jsp">     
        <div style="width:50%;float:left;">                            
            <table class='table'>
                <tr>
                    <th>사번</th>
                    <td><%=rs.getString("prof_id")%></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><%=rs.getString("prof_name")%></td>
                </tr>
                <tr>
                    <th>소속</th>
                    <td><%=rs.getString("dept_name")%></td>
                </tr>
                <tr>
                    <th>주민번호</th>
                    <td><%=rs.getString("prof_jumin")%></td>
                </tr>
            </table>
        </div>
        <div style="width:50%;float:left;">              
        <table class='table'>
                <tr>
                    <th>주소</th>
                    <td style="float: left;">
                    <input type="text" name="prof_address" id="address" size="80"style="width:200px;"autocomplete="off" value="<%=prof_address%>">
                    <button type="button" id="input2" onclick="kakaopost()"  ><b>주소검색</b></button>
   
                </td>
                </tr>

                <tr>
                    <th>연락처</th>
                        <td><input style="width:200px;" type="text" name="prof_tel"autocomplete="off" value="<%=prof_tel%>"></td>
                    </tr>
                <tr>
                    <th>이메일</th>     
                    <td><input style="width:200px;" type="email" name="prof_email"autocomplete="off" value="<%=prof_email%>"></td>
                </tr>
        </form>
    </table>
      <button id="input2" type="submit" style="float:right; margin-right: 30px;"><b>입력완료</b></button>  
  </div>
</div>
      
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