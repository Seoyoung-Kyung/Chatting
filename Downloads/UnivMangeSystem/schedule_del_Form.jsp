<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");  
String sid = (String)session.getAttribute("s_id");
String sub_id = request.getParameter("sub_id");
String s_photo = (String)session.getAttribute("s_photo");
String sub_name = request.getParameter("sub_name");


    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
%>


<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel = "stylesheet" href="../assets/fontawesome-free-5.15.4-web/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
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
    section {
        text-align: center;

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
    text-align: center;
    }

    /*.topnav a:hover{
      color:#93c47d;
    } */

    /* Change color on hover */
    /* .topnav a:hover {
    background-color: #ddd;
    color: black;
    } */


    

    /* Style the topnav lin
    /* Create two unequal columns that floats next to each other */
    /* Left column 
    .rightcolumn {   
    float: right;
    width: 82%;
    } */

    /* Right column 
    .leftcolumn {
    float: left;
    width: 17%; */
    /* background-color: #f1f1f1; */
    /* padding-left: 20px;
    } */

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
    /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
    @media screen and (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
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
  overflow: hidden;
  border-collapse: collapse;
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

  p{
    background-color: rgb(181,220,16);  
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
  /*
  .active {
    background-color:#D5D5D5;
    position:relative;
    right:100px;
    font-size:14px;
    weight:30px;
    border-radius:5px;
  } */
  
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
  form{
    font-family: 'IBM Plex Sans KR', sans-serif;
  }
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

    #del{
		margin-top : 30px;
		
	}
	input[type="text"], span{
      	    all: unset;
      	    text-align : center;
      	    font-size : 20px;
      	    font-weight : bold;
            margin-left: -75px;
      }
      input[type="submit"]{
	    color: #000000;
		  border: 1px solid #808080;
		  font-size: 17px;
		  text-align : center;
		  padding: 7px 12px;
      margin-top: 10px;
      margin-bottom: 50px;
		  margin-left: 50px;
      margin-right: 50px;
		  display: inline-block;
      font-family: 'IBM Plex Sans KR', sans-serif;
		  width: 80px;
      }
    input[type="submit"]:hover{
      	font-weight : bold;
      	color : #000000;
      	background : #D5D5D5;
        font-family: 'IBM Plex Sans KR', sans-serif;
      }

    #text {
      margin-top:20px;
      margin-bottom:10px;
      text-align : center;
    }

strong{
  font-size: 20px;
}

#icon{
  color: red;
}


.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.0);
    text-decoration: none;
    font-weight: 600;
    transition: 0.2s;
}
  #state{
    background-color: #ffffff;
    border:none;
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
</style>
</head>
<body style="overflow-x: hidden">
<title>학사 관리 시스템</title>
  <div>
    <p><a>| <%=session.getAttribute("dept_name")%> | <%=session.getAttribute("s_name")%> (학생) | &nbsp<a href="login.jsp"></a></p>
  </div>
<div class= "p">
    <img src="sc.png" width="100%" height="200px">
</div>

<div class="topnav">    
    <img src="logo.jpg">
      <ul id ="fromInsideOut">
          <li><a href ="studentForm.jsp">정보관리</a></li>
          <li><a href ="subjectForm.jsp">수강신청</a></li>
          <li class="active"><a href ="schedule.jsp">수강 시간표</a></li>
          <li><a href="studentScoreForm.jsp">성적열람</a></li>
          <a href="login.jsp" class="signup">Logout</a>
        </ul>
</div>


     <div class="card" style="overflow: scroll;">
        <section>
            <article>
                <br>
                <strong><div id="icon" class="fas fa-exclamation-triangle"></div> 수강 상태 변경 <div id="icon" class="fas fa-exclamation-triangle"></div></strong>
                <hr>
                <form id="del" action="schedule_del_Pro.jsp?sub_id=<%=sub_id%>">
                <input type="text" name=sub_id value=<%=sub_id%> readonly><span><%=sub_name%></span>
                <div id="text" style="font-family: 'IBM Plex Sans KR', sans-serif;"> 이 강의 수강 상태를        
                  <select id="state" name="state">
                  <option value="수강">수강</option>
                  <option value="철회">철회</option>
                </select> (으)로 바꾸겠습니까?</div>
                <input type="submit" class="w-btn" value="YES">
            </form>  
            </article>
        </section>

  </div>
  <div class="footer">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
</div>
</body>

</html>