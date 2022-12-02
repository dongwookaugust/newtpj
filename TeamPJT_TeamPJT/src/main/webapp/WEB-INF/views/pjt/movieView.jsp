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
.row2 {
   margin: auto ;
   align : center;  
   overflow-x: auto;
   overflow-y: auto;
   min-width : 1000px;
}
</style>
</head>

<body>
<div class="row2" style="width:1000px" align="center">
<h3>영화 상세정보</h3><br><hr>      
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