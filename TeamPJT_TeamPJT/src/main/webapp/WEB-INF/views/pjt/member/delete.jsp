<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form id="regform" action="delete_form" method="post">
				<br><br><br>
				<h2>My Page</h2><br>
				<table>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pwcheck" id="pwcheck" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="회원탈퇴" class="btn btn-dark" onclick="Check()">
				<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='mypage'">
			</form>
			<br><br><br><br>
		</div>
	
	
	</section>
</body>
<script type="text/javascript">
function Check(){
	 if($("pwcheck").val() != "${vo.user_pw}"){
		 alert("비밀번호 확인 요청");
	 }else if(confirm("탈퇴 하시겠습니까?")){
		 $("#regform").submit();
		}
}
</script>
<%@include file="../footer.jsp"%>
</html>