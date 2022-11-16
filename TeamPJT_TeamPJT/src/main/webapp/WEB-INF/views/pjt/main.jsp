<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<!-- Page Content-->
<div class="container px-4 px-lg-5">
	<!-- Heading Row-->
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-lg-7">
		<c:choose>
			<c:when test="${!empty img0.img_uploadPath}">
				<img class="img-fluid rounded mb-4 mb-lg-0"
				src="/img/${img0.img_uploadPath}/${img0.img_uuid}_${img0.img_fileName}" alt="..." />
			</c:when>
			<c:otherwise>
				<img class="img-fluid rounded mb-4 mb-lg-0"
				src="/resources/img/noimg.png" alt="..." />
			</c:otherwise>
		</c:choose>
		</div>
		<div class="col-lg-5">
			<h1 class="font-weight-light">전체 게시물 조회수 top</h1>
			<p>${ls[0].board_title} ${img0.img_uploadPath}ww</p>
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
					<img src="/img/${img1.img_uploadPath}/${img1.img_uuid}_${img1.img_fileName}" class="card-img-top" alt="...">
				</c:when>
				<c:otherwise>
					<img src="/resources/img/noimg.png" class="card-img-top" alt="...">
				</c:otherwise>
			</c:choose>
				
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					
					<a href="#" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>

		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<c:choose>
				<c:when test="${!empty img2.img_uploadPath}">
					<img src="/img/${img2.img_uploadPath}/${img2.img_uuid}_${img2.img_fileName}" class="card-img-top" alt="...">
				</c:when>
				<c:otherwise>
					<img src="/resources/img/noimg.png" class="card-img-top" alt="...">
				</c:otherwise>
			</c:choose>
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					
					<a href="#" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>


		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<c:choose>
				<c:when test="${!empty img3.img_uploadPath}">
					<img src="/img/${img3.img_uploadPath}/${img3.img_uuid}_${img3.img_fileName}" class="card-img-top" alt="...">
				</c:when>
				<c:otherwise>
					<img src="/resources/img/noimg.png" class="card-img-top" alt="...">
				</c:otherwise>
			</c:choose>
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					
					<a href="#" class="btn btn-primary">더보기</a>
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