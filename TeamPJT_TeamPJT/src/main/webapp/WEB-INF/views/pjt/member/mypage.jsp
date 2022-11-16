<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<head>
	
</head>
<body>
	<main>
		<div align="center">
		<br><br>
			<h2>My Page</h2><br>
			<svg xmlns="http://www.w3.org/2000/svg" width="180" height="180" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  	<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  	<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
			<br><br>
				<h3>${vo.user_nickname}님</h3>
				<h4>가입날짜 : ${vo.user_regdate}</h4>
			<br>
				<input type="button" value="내 정보 변경" class="btn btn-dark" onclick="location.href='update_member'">
				<input type="button" value="비밀번호 변경" class="btn btn-secondary" onclick="location.href='update_pw'">
				<input type="button" value="회원탈퇴" class="btn btn-secondary" onclick="location.href='delete'">
			<br><br><br><br>
		</div>
	</main>
</body>
<%@include file="../footer.jsp"%>
</html>