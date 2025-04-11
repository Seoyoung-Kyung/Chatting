<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;
  	PreparedStatement pstmt = null;
  	ResultSet rs = null;
  	String url = "jdbc:oracle:thin:@localhost:1521:XE";

    request.setCharacterEncoding("utf-8");

    String d_id = (String) session.getAttribute("dept_id");
	  String sk = request.getParameter("sk");
    String sv = request.getParameter("sv");
 %>

<!DOCTYPE html>
<html>
<head>
  <title>학사 관리 시스템</title>
<title>학사 관리 시스템</title>
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
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
  font-family: 'Nanum Gothic Coding', monospace;
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
background-color:white;
font-size:15px;
margin-top:8px;
margin-bottom:10px;
}

#img {    
  display: inline-block;
  position: relative;
  vertical-align:middle;
  top: 5px;
  left: 15px;
}

#sk{
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

#input1{
width: 300px;
height: 29px;
border-top:none;
border-left: none;
border-right: none;
border-bottom: none;
border-radius: 10px;
outline:0;
padding-left:10px;
padding-top:2px;
font-size:13px;
}
</style>
</head>
<body style="overflow-x: hidden">
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
      <li><a href ="profTimeTable.jsp">강의 시간표</a></li>
      <li><a href ="testManage.jsp">성적 관리</a></li>
      <li class="active"><a href="seeTest.jsp">성적 열람</a></li>
      <li><a href="profClass.jsp">담당 학급</a></li>
  
      <a href="Logout.jsp" class="signup">Logout</a>
    </ul>
  
  </div>
  
  <div class="card" style="overflow:scroll; height:550px; overflow-x: hidden;">
  <div style="width:100%; float:center;">
    <h3 style="font-weight:bold;">&nbsp; 성적 열람
    <a href ="seeTest.jsp"><i class="fas fa-arrow-left" style="font-size:28px; color:rgb(54, 54, 54); float:right;">&nbsp;&nbsp;&nbsp;</i></a>
    </h3><hr>
  </div>
  <form action="scoreSearch.jsp" method="post" style="float:left;">
	&nbsp;
  <select id="sk" name="sk">
		<option value="s_id">학번</option>
		<option value="s_name">이름</option>
	</select>
	<input id="input1" type="text" name="sv" autocomplete="off">
	<input id="input2" type="submit" value="검색">
</form>
  <table class="type11">
		<thead>
			<tr>
        <th scope="cols">학생사진</th>
        <th scope="cols">학생코드</th>
        <th scope="cols">학년</th>
        <th scope="cols">반</th>
        <th scope="cols">학생이름</th>
        <th scope="cols">과목이름</th>
        <th scope="cols">중간고사 성적</th>
        <th scope="cols">기말고사 성적</th>
        <th scope="cols">출석 성적</th>   
        <th scope="cols">기타 성적</th>  
			</tr>
		</thead>
		<tbody>
<%

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, "c##ysu", "1234");
	
		String sql = "select s.s_photo, s.s_id, s.s_grade, s.s_class, s.s_name, st.sub_name, r.middle_score, r.final_score, r.attendance, r.other_score, r.attendance, r.other_score from registration r inner join student s on r.s_id=s.s_id inner join subject st on r.sub_id = st.sub_id where s.dept_id=? and s."+sk+"=?";

    pstmt = conn.prepareStatement(sql);
    if(sk != null & sv != null){
        pstmt.setString(1,d_id);
        pstmt.setString(2,sv);
    }
		rs = pstmt.executeQuery();

		while(rs.next()){
        String s_photo = rs.getString("s_photo");
        String s_id = rs.getString("s_id");
        String s_grade = rs.getString("s_grade");
        String s_class = rs.getString("s_class");
        String s_name = rs.getString("s_name");
        String sub_name = rs.getString("sub_name");
        String middle_score = rs.getString("middle_score");
        String final_score = rs.getString("final_score");
        String attendance = rs.getString("attendance");
        String other_score = rs.getString("other_score");
	
	%>
			<tr>
          <td><img src="<%=s_photo%>" style="width:100px;"></td>
          <td><%=s_id%></td>
          <td><%=s_grade%></td>
          <td><%=s_class%></td>
          <td><%=s_name%></td>
          <td><%=sub_name%></td>
          <td><%=middle_score%></td>
          <td><%=final_score%></td>
          <td><%=attendance%></td>
          <td><%=other_score%></td>
			</tr>
<%  } 
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
		</tbody>
	</table>
	</table>
</div>
  <div class="footer">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</body>
</html>