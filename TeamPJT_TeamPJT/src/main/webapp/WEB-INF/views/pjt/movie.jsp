<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: auto ;
}


</style>
</head>
<body>
<div class="row" style="width:1000px" align="center">
<h3>무비차트</h3><br><hr>
<c:forEach items="${list }" var="vo">
	<div class="col-xl-2 col-md-3 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
             <div class="card-body">
                  <div class="row no-gutters align-items-center">
                       <div class="col mr-2 mvtitle">
                             <img style="margin:10px;" 
                                      alt="${vo.title }" src="${vo.img }" width="80%">
                            <hr> 
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><a href="movieView?mvnum=${vo.mvnum}">${vo.title }</a></div>
                            ${vo.mvopen } 개봉
                            <hr>
                            <!-- 새창띄우기 안되면 a태그 href로 -->
                            <button class="btn btn-google btn-block" onclick="location.href='http://www.cgv.co.kr/ticket/?MOVIE_CD=20031149&MOVIE_CD_GROUP=20031149'" target="_blank">예매하기</button>
                        </div>
                    </div>
               </div>
           </div>
       </div>
</c:forEach>
</div>
<%@include file="footer.jsp"%>
</body>
</html>