<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<style>
.main-view{
	margin: auto;
	margin-bottom: 20px;
	margin-top: 50px;
	text-align: center;
}

.main-view{width:1500px;height:450px;overflow:hidden;}
	.main-view ul{width:calc(100% * 3);display:flex;animation:slide 8s infinite;}
}
 	.main-view li{width:calc(100% / 3);height :300px;}
	
	@keyframes slide {
	   0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-40%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-40%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-90%;}
      60% {margin-left:-90%;}
      100% {margin-left:0;}
	}



</style>
<!-- Page Content-->
<div class = "container">
	<div class="main-view">
		<ul>
			<li><img src="/resources/img/movie2.jpg" width=100%></li>
			<li><img src="/resources/img/movie4.jpg" width=100%></li>
			<li><img src="/resources/img/movie.jpg" width=100%></li>
		</ul>
	</div>
</div>

<div class="container px-4 px-lg-5">
	<!-- Heading Row-->
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-lg-7">
		<c:choose>
			<c:when test="${!empty img0.img_uploadPath}">
				<img class="img-fluid rounded mb-4 mb-lg-0"
				src="/board/display?filename=${img0.img_uploadPath}/${img0.img_uuid}_${img0.img_fileName}" alt="..." />
			</c:when>
			<c:otherwise>
				<img class="img-fluid rounded mb-4 mb-lg-0"
				src="/resources/img/noimg.png" alt="..." />
			</c:otherwise>
		</c:choose>
		</div>
			
		<div class="col-lg-5">
			<h1 class="font-weight-light">전체 게시물 조회수 top</h1>
			<h5 class="card-title">${ls[0].board_title} </h5>
			<h5 class="card-title"> ${img0.img_uploadPath} </h5>
			<a class="btn btn-primary" href="/board/detaile?board_num=${ls[0].board_num }">더보기</a>
		</div>
	</div>
	<!-- Call to Action-->
	<div class="card text-white bg-secondary my-5 py-4 text-center">
		<div class="card-body">
			<h1 class="text-white m-0">조회수 Ranking Top4.</h1>
		</div>
	</div>
	<!-- Content Row-->

	<div class="row gx-4 gx-lg-5">
		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
			<c:choose>
				<c:when test="${!empty img1.img_uploadPath}">
					<img src="/board/display?filename=${img1.img_uploadPath}/${img1.img_uuid}_${img1.img_fileName}" class="card-img-top" alt="...">
				</c:when>
				<c:otherwise>
					<img src="/resources/img/noimg.png" class="card-img-top" alt="...">
				</c:otherwise>
			</c:choose>
				
				<div class="card-body">
					<h5 class="card-title">${ls[1].board_title} </h5>
					<h5 class="card-title"> ${img1.img_uploadPath} </h5>
					<a href="/board/detaile?board_num=${ls[1].board_num }" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>

		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<c:choose>
				<c:when test="${!empty img2.img_uploadPath}">
					<img src="/board/display?filename=${img2.img_uploadPath}/${img2.img_uuid}_${img2.img_fileName}" class="card-img-top" alt="...">
				</c:when>
				<c:otherwise>
					<img src="/resources/img/noimg.png" class="card-img-top" alt="...">
				</c:otherwise>
			</c:choose>
				<div class="card-body">
					<h5 class="card-title">${ls[2].board_title}</h5>
					<h5 class="card-title"> ${img2.img_uploadPath} </h5>
					<a href="/board/detaile?board_num=${ls[2].board_num }" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>


		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<c:choose>
				<c:when test="${!empty img3.img_uploadPath}">
					<img src="/board/display?filename=${img3.img_uploadPath}/${img3.img_uuid}_${img3.img_fileName}" class="card-img-top" alt="...">
				</c:when>
				<c:otherwise>
					<img src="/resources/img/noimg.png" class="card-img-top" alt="...">
				</c:otherwise>
			</c:choose>
				<div class="card-body">
					<h5 class="card-title">${ls[3].board_title}</h5>
					<h5 class="card-title"> ${img3.img_uploadPath} </h5>
					<a href="/board/detaile?board_num=${ls[3].board_num }" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
			$(document).ready(function(){
				var msg = '${msg}'
				if(msg !=''){
					alert(msg)
				}
			});
		</script>

<%@include file="footer.jsp"%>
</body>
</html>