<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

	String d_id = (String) session.getAttribute("dept_id");
  String d_name = (String) session.getAttribute("dept_name"); 
  String dept_tel= request.getParameter("dept_tel");
  String dept_location= request.getParameter("dept_location");
  %>

<!DOCTYPE html>
<html>
<head>
<title>학사 관리 시스템</title>
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
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
  float:right; 
  width:50%; 
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


  p{
    background-color:rgb(239,35,142);  
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

#dept_name, #dept_tel, #dept_location{
  width: 180px;
  height: 29px;
  border-top:none;
  border-left: none;
  border-right: none;
  border-bottom: 2px solid gray;
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
  left:290px;
  font-size:17px;
  margin-top:10px;
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
          <li class="active"><a href ="deptMgt.jsp">학과 관리</a></li>
          <li><a href ="deptSubjectForm.jsp">개설 과목</a></li>
          <li><a href ="profMgt.jsp">교수 정보</a></li>
          <li><a href="studMgt.jsp">학생 정보</a></li>
          <li><a href="deptProfSub.jsp">과목별 담당 교수 </a></li>
          <a href="Logout.jsp" class="signup">Logout</a>
        </ul>
</div>
<div class="card" style="overflow:scroll; height:420px; overflow-x: hidden;">
<div style="width:100%; float:center;">
    <h3 style="font-weight:bold;">&nbsp; 학과 정보 수정
    <a href ="deptMgt.jsp"><i class="fas fa-arrow-left" style="font-size:28px; color:rgb(54, 54, 54); float:right;">&nbsp;&nbsp;&nbsp;</i></a>
    </h3><hr>
  </div>
<div class="rightcolumn">
<form method="post" action="deptUpdatePro.jsp">
  <table>
  <div id="map" style="width:49%; height:350px; float:left;"></div>
    <tr>
      <th scope="row">학과 번호</th>
		  <td><%=session.getAttribute("dept_id")%></td>
    </tr>
    <tr>
      <th scope="row">학과명</th>
		  <td><input type="text" id = "dept_name" name="dept_name" autocomplete="off" value="<%=d_name%>"></td>
    </tr>
    <tr>
        <th scope="row">전화번호</th>
        <td><input type="text" id = "dept_tel" name="dept_tel" autocomplete="off" value="<%=dept_tel%>"></td>
    </tr>
    <tr>
        <th scope="row">건물 위치</th>
		    <td><input type="text" id = "dept_location" name="dept_location" autocomplete="off" value="<%=dept_location%>"></td>
	  </tr>
   </table>
  <input id="input2" type="submit" value="입력완료">
  </form>
</div>
</div>
  <div class="footer">
      <p><b>14011 경기도 안양시 만안구 양화로 37번길 34 연성대학교 <br>TEL. 031-441-1100 | FAX. 031-442-4400<b></p>
  </div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8aa98a65921e1bc62a14f5834e379c7"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.396987213941735, 126.90930218494661), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '식품과학관', 
        latlng: new kakao.maps.LatLng(37.39716612423367, 126.90763053298593)
    },
    {
        title: '문화2관', 
        latlng: new kakao.maps.LatLng(37.39606669342191, 126.907394722409)
    },
    {
        title: '공학1관', 
        latlng: new kakao.maps.LatLng(37.39637270362781, 126.9069651978619)
    },
    {
        title: '공학2관',
        latlng: new kakao.maps.LatLng(37.396814514124976, 126.9073599220238)
    },
    {
        title: '평생교육관',
        latlng: new kakao.maps.LatLng(37.397942762058115, 126.90991088816813)
    },
    {
        title: '연곡문화센터',
        latlng: new kakao.maps.LatLng(37.39811374052191, 126.9096283427285)
    },
    {
        title: '창조관',
        latlng: new kakao.maps.LatLng(37.39736648638421, 126.91040849278937)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });

    marker.setMap(map);

}
</script>
</body>
</html>