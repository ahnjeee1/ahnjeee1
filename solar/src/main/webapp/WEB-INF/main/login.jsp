<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="/solar/static/lib/jquery-3.2.1.js"></script>
<script src="/solar/static/lib/jquery.serializeJSON.js"></script>
<style>

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}


.loginbtn{
 	width: auto;
 	color : white;
 	font-weight:bold;
 	margin-left : 25%;
    padding: 10px 18px;
    background-color: #00802b;
}
.joinbtn {
	width: auto;
 	color : white;
 	font-weight:bold;
    padding: 10px 18px;
    background-color: #b30000;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    margin-top: 8%;
}

.container {
	border: 3px solid #f1f1f1;
    padding: 16px;
    width : 20%;
    margin-left: 40%;

}


/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SOLAR MAIN</title>
</head>
<body>

<form id="loginForm" action="/solar/login/process" method="POST" >
  <div class="imgcontainer name="imgDiv">
    <img src="/solar/static/images/logo.png" >
  </div>

  <div class="container">

    <label><b>Username</b></label>
    <input type="text" name="id" placeholder="아이디" />

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name = "pw" required>
    
  </div>
  <div class="container" style="background-color:#f1f1f1">
    <input type="button" value="log in" class="loginbtn" name="login" />
    <a href="/solar/joinForm"><input type="button" value="join" class="joinbtn" name="join" /></a>
  </div>
</form>
</body>

<script>
$(function(){

 $("input[type='button'][name='login']").click(function(){
  var $json = JSON.stringify($('#loginForm').serializeJSON());
  
   $.ajax({
   type:"POST",
   url:"/solar/login/auth",
   data:$json,
   success:function(data,status,xhr){
    console.log("성공");
    $("#loginForm").submit();
   },
   async: false,
   error:function(xhr,status,error){
    console.log("error : "+xhr.status);
    if(xhr.status==404)
     alert("아이디를 찾을수 없습니다.");     
    else if(xhr.status==400)
     alert("비밀번호를 확인해주세요"); 
    else
     alert("error : "+xhr.status+" 통신에 실패하였습니다.");
   },
   contentType:"application/json"
  });   
  
 });
  
  
});
</script>
</html>