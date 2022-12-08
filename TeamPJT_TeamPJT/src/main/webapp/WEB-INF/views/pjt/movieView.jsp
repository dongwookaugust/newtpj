<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hahmlet:wght@400;500&display=swap" rel="stylesheet">
<style>
	*{font-family: 'Black Han Sans', sans-serif; font-family: 'Hahmlet', serif;}
</style>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 100%;
	text-align : center;
	
	
}

h1 {
	text-align: center;
}
</style>

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Small Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
        
        <style type="text/css">
	.input-file-button{
  padding: 6px 25px;
  background-color:silver;
  border-radius: 4px;
  color: white;
  cursor: pointer;
  
 /* 이미지style */
 #result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
  
  
</style>
    </head>
    <body class="d-flex flex-column min-vh-100">
    
	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    	<script type="text/javascript">
    		function search() {
				var title = $('#title').val()
				location.href = "/board/search?board_title="+title
			}
    	</script>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a href="/pjt/main">
               <img src="/resources/img/logo.png" width="130px" height="40px">
               </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    	<li class="nav-item"><input type="text" name="title" id="title" style="padding-left: 10px; padding-top: 10px" placeholder="리뷰 검색" ></li>
                    	<li class="nav-item"><button type="button" class="btn btn-secondary" onclick="search()">검색</button></li>
                    	<li class="nav-item"><a class="nav-link"  href="/movie/list">영화</a></li>
                        <li class="nav-item"><a class="nav-link" href="/board/list">영화 리뷰</a></li>
                        <li class="nav-item"><a class="nav-link" href="/search/movie">주변 검색</a></li>
                        <c:choose >
                        	<c:when test="${empty id}">                      
                        		<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
                        	</c:when>
                        	<c:otherwise>
                        		<li class="nav-item"><a class="nav-link" href="/member/mypage">내정보</a></li>
                        		<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>                        
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>

<style type="text/css">
.row2 {
   margin: auto ;
   align : center;  
   overflow-x: auto;
   overflow-y: auto;
   min-width : 1000px;
}
</style>
</head>
<br>
<body>
<div class="row2" style="width:1000px" align="center">
<h3>영화 상세정보</h3><hr>      
  <div class="row2" align="center">
  <div class="col-lg-7" align="center">
    <div class="card" align="center">
      <div class="card-body" align="center">  
                    <img style="margin:0px;" 
                    alt="${vo.title }" src="${vo.img }" width="70%">
          <div class="form-group" align="center">
          	<br>
            <label>제목</label>
            <input class="form-control" value="${vo.title }" readonly="readonly">
          </div>

          <div class="form-group" align="center">
            <label>감독</label>
            <input class="form-control" readonly="readonly" value="${vo.director }">
          </div>

          <div class="form-group" align="center">
            <label>배우</label>
            <input class="form-control" value="${vo.actors }" readonly="readonly">
          </div>
          
          <div class="form-group" align="center">
            <label>장르</label>
            <input class="form-control" value="${vo.genre }" readonly="readonly">
          </div>
          
          <div class="form-group" align="center">
            <label>상영시간</label>
            <input class="form-control" value="${vo.mvtime }분" readonly="readonly">
          </div>
          
          <div class="form-group" align="center">
            <label>연령</label>
            <input class="form-control" value="${vo.grade }세" readonly="readonly">
          </div>
          
          <button type="button" class="btn btn-dark" onclick="location.href='list'">목록</button>
 

      </div>
    </div>
  </div>
</div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>