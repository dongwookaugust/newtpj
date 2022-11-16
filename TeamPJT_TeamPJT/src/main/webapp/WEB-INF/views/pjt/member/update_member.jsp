<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form name="regform" id="regform" action="update_member_form" method="post">
				<br><br><br>
				<h2>My Page</h2><br>
				<table>
					<tr>
					<!-- 세션받아서 value값 채우기 -->
						<td>ID</td>
						<td><input type="text" name="user_id" id="user_id" class="form-control" readonly value="${vo.user_id}"></td>
					</tr>
					
					<tr>
						<td>PHONE</td>
						<td><input type="text" name="user_phone" id="user_phone" value="${vo.user_phone}" class="form-control"></td>
					</tr>
					<tr>
						<td>ADDRESS</td>
						<td><input type="email" name="user_address" id="user_address" value="${vo.user_address}" class="form-control"></td>
					</tr>
					<tr>
						<td>EMAIL</td>
						<td><input type="text" name="user_email" id="user_email" value="${vo.user_email}" class="form-control"></td>
					</tr>
					<tr>
						<td>NICKNAME </td>
						<td><input type="text" name="user_nickname" id="user_nickname" value="${vo.user_nickname}" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="수정" class="btn btn-dark" onclick="updateCheck()">
				<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='mypage'">
			</form>
			<br><br><br><br>
		</div>
	</section>
</body>

	<script type="text/javascript">
		function updateCheck() {			
			if(document.regform.user_phone.value == ''){
				alert("전화번호를 입력해 주세요");
			}else if (document.regform.user_address.value == ''){
				alert("주소를 입력해 주세요")
			}else if (document.regform.user_email.value == ''){
				alert("이메일을 입력해 주세요")
			}else if (document.regform.user_nickname.value == ''){
				alert("닉네임을 입력해 주세요")
			}else if(confirm("수정 하시겠습니까?")){
				document.regform.submit();
			}
		}
	
	
	</script>	
<%@include file="../footer.jsp"%>
</html>