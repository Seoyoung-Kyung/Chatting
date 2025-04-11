<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
    <title>연성대학교</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap');

    html {
		height: 100%;
	  }
	
	body {
      font-family: 'Gothic A1', sans-serif;
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 70px;
  		padding-bottom: 40px;
  		background-repeat: no-repeat;
  		background-image:linear-gradient( rgba(0, 0, 0, 0.03), rgba(0, 0, 0, 0.03) ),url(school.jpg);
      background-size:cover;

      }
	
  .card {
      position:relative;
      top:100px;
      margin: 0 auto; 
      float: none; 
      margin-bottom: 5em;
      opacity:0.8;
	}
	
 .form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
      box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	} 
  .bg-img{
    position: absolute;
    content: '';
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background: rgba(0,0,0,0.6);
  }
    h6{
        float:center;
        font-size:13px;
    }
    h3{
      font-size:20px;
      color:#113366; 
      font-weight:bold;
      position:relative;
      top:1.5em;
    }
    div{
      font-family: 'Gothic A1', sans-serif;
    }

    .input-box{
      position:relative;
      margin-top:10px;
      margin-left:3.3em;
  }
  .input-box > input{
      background:transparent;
      border:none;
      border-bottom: solid 1px #ccc;
      padding:18px 0px 5px 0px;
      font-size:10pt;
      width:90%;
  }
  input::placeholder{
      color:transparent;    /* 불투명도 */
  }
  input:placeholder-shown + label{
      color:#4f4d4e;
      font-size:10pt;
      top:15px;
  }
  input:focus + label, label{
      color:#4f4d4e;
      font-size:7pt;
      font-weight:bold;
      pointer-events: none;     /* 요소들의 마우스/터치 이벤트의 응답 조정*/
      position: absolute;       /* 독립적으로 움직임*/
      left:0px;
      top:0px;
      transition: all 0.2s ease ;   /* 변화 속성 0.2s(초) 변화가 일어나는 시간 */
      /* -webkit-transition: all 0.2s ease;
      -moz-transition: all 0.2s ease;
      -o-transition: all 0.2s ease; */
  }
  input:focus, input:not(:placeholder-shown){
      border-bottom: solid 1px #8aa1a1;   /*  입력 칸 줄*/
      outline:none;
  }
  .signup{
    position:relative;
    left:20em;
    top:2.6em;
    background-color:#3D4453;
    border: none;
    color: white;
    padding: 10px 10px;
    text-align: center;
    font-size: 12px;
    margin: 10px px;
    opacity: 0.7;
    transition: 0.5s;
    display: inline-block;
    text-decoration: none;
    cursor: pointer;
    border-radius:5px 0px 5px 0px;
    width:10em;
  }
  .signup:hover{
    opacity: 1;
  }
    </style>
  </head>

  <body style="background-image:url('ui.png');">
    <div class="bg-img">

    <div class="card align-middle" style="width:40em; height:24em; border-radius:10px;">
      <div class="card-title" style="margin-top:0.0em;">
        <img src="logo2.png" width="115px" style="position:relative; top:1.4em; left:16.5em;" >
        <h3 class="card-title text-center">학사 관리 시스템</h3>
      </div>
      <div class="card-body">
      <form method="post" action="loginPro.jsp">
          <div class="input-box">
            <input type="text" name="id" id="id" placeholder="ID"  maxlength="50" autocomplete="off" required>
            <label input for="id">ID</label>
          </div>
          <div class="input-box">
            <input type="password" name="passwd" id="passwd" placeholder="Password"  maxlength="50" autocomplete="off" required>
            <label for="passwd">Password</label>
          </div>
          <div class="mb-3">
            <input type="submit" class="signup" value="LOGIN">
          </div><br>
      </form>
      <br>
      <br>
		</div>
	</div>
</body>  

