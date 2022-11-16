<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
</head>
<body>
	<br>
	<main>
	<form action="modify" id="reg" method="post" onsubmit="hiddenValue();">
		<div class="container text-center"
			style="background-color: graytext; color: white;">
			<div class="row" style="height: 40px;">
				
				<input type="text" class="col-9 bg-light" style="border: 2px solid #888;" value="${list.board_title}" name="board_title" id="board_title"/> 
				<input type="text" class="col-3 bg-light" style="border: 2px solid #888;" value="${list.board_score}" name="board_score" id="board_score"/>
			</div>
			<div class="row">
				<input type="text" class="col bg-light" style="border: 2px solid #888;" value="${list.user_id}" name="user_id" id="user_id" value="${sessionScope.id}" readonly/>
				<input type="text" class="col bg-light"	style="border: 2px solid #888;"	value="${list.board_category}" name="board_category" id="board_category"/> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	value="${list.board_view}"  readonly/> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	value="${list.board_date}"  readonly/>
				<input type="hidden" name ="board_num" value="${list.board_num}"/>
			</div>
		</div>

		<div class="container py-4">

			<!-- p, mb 클래는 마진 관련, bg - 백그라운드, 라운더 - 보더 -->
			<div class="editor-menu">
				<button type="button" id="btn-bold">
					<b>B</b>
				</button>
				<button type="button" id="btn-italic">
					<i>I</i>
				</button>
				<button type="button" id="btn-underline">
					<u>U</u>
				</button>
				<button type="button" id="btn-strike">
					<s>S</s>
				</button>
				<button type="button" id="btn-ordered-list">OL</button>
				<button type="button" id="btn-unordered-list">UL</button>
				<label class="input-file-button" for="input-file">이미지 첨부<input
				type="file" id="input-file" style="display: none" name="uploadFile" /></label>
			</div>
			<div id="editor" contenteditable="true" class="p-5 mb-4 bg-light rounded-3 w-100" >
				${list.board_content}
			</div>
			<input type="hidden" name="board_content" value="" >



			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"  name="board_strength" id="board_strength">${list.board_strength}</textarea>
				</div>

				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"  name="board_weakness" id="board_weakness">${list.board_weakness}</textarea>
				</div>
			</div>

			<br>
			
		<div align="center">
			<button type="button" class="btn btn-secondary" onclick="check()">등록</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='list'">취소</button>
		</div>
			
		</div>
		</form>
		<%@include file="../footer.jsp"%>
	</main>


	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	
<script type="text/javascript">


// 에디터 버튼     
const editor = document.getElementById('editor');
const btnBold = document.getElementById('btn-bold');
const btnItalic = document.getElementById('btn-italic');
const btnUnderline = document.getElementById('btn-underline');
const btnStrike = document.getElementById('btn-strike');
const btnOrderedList = document.getElementById('btn-ordered-list');
const btnUnorderedList = document.getElementById('btn-unordered-list');

btnBold.addEventListener('click', function () {
    setStyle('bold');
});

btnItalic.addEventListener('click', function () {
    setStyle('italic');
});

btnUnderline.addEventListener('click', function () {
    setStyle('underline');
});

btnStrike.addEventListener('click', function () {
    setStyle('strikeThrough')
});

btnOrderedList.addEventListener('click', function () {
    setStyle('insertOrderedList');
});

btnUnorderedList.addEventListener('click', function () {
    setStyle('insertUnorderedList');
});

function setStyle(style) {
    document.execCommand(style);
    focusEditor();
}

// 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
function focusEditor() {
    editor.focus({preventScroll: true});
}

<!--검증-->
function check() {
	if($("#board_title").val()==""){
		alert("제목을 입력해주세요");
	}else if($("#board_score").val()==""){
		alert("별점을 입력해주세요");
	}else if($("#board_score").val()>5){
		alert("별점은 1~5사이로 입력해주세요");
	}else if($("#board_category").val()==""){
		alert("카테고리를 입력해주세요");
	}else if(document.getElementById("editor").innerHTML==""){
		alert("내용을 입력해주세요");
	}else if($("#board_strength").val()==""){
		alert("장점을 입력해주세요");
	}else if($("#board_weakness").val()==""){
		alert("단점을 입력해주세요");
	}else{
		$("#reg").submit();
	}
}



</script>


</body>
</html>
