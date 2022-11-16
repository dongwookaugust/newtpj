<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form action="/member/joinForm" method="post" id="regForm">
				<br><br>
				<h2>JOIN</h2><br>
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="user_id" id="id" class="form-control" ></td>
						<td><input type="button" value="check" class="btn btn-dark" onclick="idCheck()"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="user_pw" id="pw" class="form-control"></td>
					</tr>
					<tr>
						<td>PW_CHECK</td>
						<td><input type="password" class="form-control form-control-user" placeholder="비밀번호 체크" id="pwCheck"></td>
					</tr>
					<tr>
						<td>PHONE</td>
						<td>
						<select name="phone1">
						<option>010</option>
						<option>011</option>
						</select>
						-<input type="text" name="user_phone" id="phone" class="form-control"></td>
					</tr>
					<tr>
						<td>ADDRESS</td>
						<td><input type="email" name="user_email" id="address"class="form-control"></td>
					</tr>
					<tr>
						<td>EMAIL</td>
						<td><input type="text" name="user_address" id="email" class="form-control"></td>
					</tr>
					<tr>
						<td>NICKNAME </td>
						<td><input type="text" name="user_nickname" id="nickname" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="가입" class="btn btn-dark" onclick="joinCheck()">
			</form>
			<br><br><br><br>
		</div>
	</section>
	
	<script type ="text/javascript">
	
	 function idCheck(){
	      
	      var id = $("#id").val(); 
	      var user_id ={"user_id":id};  //json
	      
	      
	      $.ajax({
	            type : "post",       // 요청형식
	            url : "checkId",   // 요청할 주소
	            data : user_id,      // 서버에 전송할 테이터 json형식 {key:value}
	            dataType : "text",
	            // datatype : "json", // 서버에서 요청후 리턴해 주는 타입
	            error : function(request, error) {
	               alert(error + "\n" + request.status)
	            },
	            success : function(result){
	               // ajax통신에 성공했을 때, 호출될 자바스크립트 함수, 결과 여부가
	               // result 매개변수로 전달됨.
	               console.log("성공(1) 실패(0) 여부 : " + result);
	               
	               if(result == "<Integer>1</Integer>") {   // 중복된 아이디가 존재함
	                  alert("중복된 아이디가 있습니다.");                    
	               }else if($("#id").val().length <4){
	                  alert("아이디는 네 글자 이상입니다.");
	               }else {
	                  alert("사용가능한 아이디 입니다.");
	                  $("#id").attr("readonly", true);
	               }
	            }
	            
	      });
	 }
	function joinCheck(){
				
		if(!$("#id").attr("readonly")){
			alert("아이디 중복체크를 해야합니다.");
		}else if($("#pw").val().length <1){
			alert("비밀번호를 입력해 주세요");
		}else if($("#pw").val() != $("#pwCheck").val()){
			alert("비밀번호 확인란을 확인하세요");
			$("#pwCheck").focus(); //해당 id태그로 마우스 커서를 위치함.
		}else if($("#phone").val().length <1){
			alert("전화번호를 입력해 주세요");
		}else if($("#email").val().length <1){
			alert("email을 입력해 주세요");
		}else if($("#address").val().length <1){
			alert("주소를 입력해 주세요");
		}else if($("#nickname").val().length <1){
			alert("별명을 입력해 주세요");
		}else if(confirm("회원가입 하시겠습니까?")){
			$("#regForm").submit();
		}
		
	}
</script>
</body>
<%@include file="../footer.jsp"%>
</html>