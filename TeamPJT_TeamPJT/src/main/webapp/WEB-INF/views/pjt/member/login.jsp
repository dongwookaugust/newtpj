<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header.jsp"%>

  
</head>
<body>
  <br><br><br>
	<body class="text-center">
    
<main class="form-signin w-100 m-auto">
 <div align="center">
  <form class ="user" action="loginForm" method="post" >
<table class="align-items: center;">
<tr>
   <td colspan="2" align="center"> <h1 class="h3 mb-3 fw-normal">Login</h1></td> </tr>
   <tr>
      <td><input type="text" class="form-control form-control-user" name="user_id" id="id" placeholder="ID"></td>
    </tr>
    <tr>
    <td><input type="password" class="form-control form-control-user"  name="user_pw" id="pw" placeholder="PW"></td>
    </tr>
      </table>
      <br>
      <input type="checkbox" value="remember-me"> Remember me
      <br><br>
    <input type="submit" class="btn-primary" value="login" >
    <button class="btn-primary" type="button" onclick="location.href='/member/join'">Join</button>
<!-- <p class="mt-5 mb-3 text-muted">2022</p>-->
  </form>
  </div>
  
  	<script type="text/javascript">
			$(document).ready(function(){
				var msg = '${msg}''
				if(msg !=''){
					alert(msg)
				}
			});
		</script>
		
</main>
</body>
<%@include file="../footer.jsp"%>
</html>