<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form name="regform" id="regform" action="update_pw_form" method="post">
				<br><br><br>
				<h2>My Page</h2><br>
				<table>
					<tr>
						<td>기존 비밀번호</td>
						<td><input type="password"  id="user_pw" class="form-control"></td>
					</tr>
					<tr>
						<td>변경 비밀번호</td>
						<td><input type="password" name="user_pw" id="newpw" class="form-control"></td>
					</tr>
					<tr>
						<td>변경 비밀번호 확인</td>
						<td><input type="password"  id="newpwcheck" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="변경" class="btn btn-dark" onclick="check()">
				<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='mypage'">
			</form>
			<br><br><br><br>
		</div>
	
	
	</section>
</body>
<script type="text/javascript">
 function check(){
	 if($("#user_pw").val() != "${vo.user_pw}"){
		 alert("기존 패스워드가 일치하지 않습니다.");
	 }else if($("#newpw").val() != $("#newpwcheck").val()){
		 alert("새로운 비밀번호가 일치하지 않습니다.");
	 }else if(confirm("변경 하시겠습니까?")){
			document.regform.submit();
		}
 }


</script>
<%@include file="../footer.jsp"%>
</html>