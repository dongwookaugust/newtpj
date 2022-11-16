<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- SimpleDateFormat --%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Header가 아래 Style sheet때문에 문제 발생 -->
<body>
	<div class="container" align="left">
		<div class="row">
			<h1>전체 게시판</h1>
		
				<div align="right">	
				 <button type="button" class="btn btn-primary btn-sm float-right" onclick="location.href='/board/register'" >글쓰기</button>
				 <br><br>
				 </div>
				
							
				<table class="table table-striped" border="3px solid black"  style="background: white;">
				<tr class="danger">
					<th class="text-center" width=8%>글번호</th>
					<th class="text-center" width=10%>카테고리</th>
					<th class="text-center" width=15%>제목</th>
					<th class="text-center" width=20%>내용</th>
					<th class="text-center" width=10%>아이디</th>
					<th class="text-center" width=6%>평점</th>
					<th class="text-center" width=10%>조회수</th>
					<th class="text-center" width=6%>추천</th>
					<th class="text-center" width=10%>작성일</th>			
				</tr>
				<c:forEach var="list" items="${board_list }">
					<tr>
						<td class="text-center" width=5%>${list.board_num}</td>
						<td class="text-center" width=10%>${list.board_category }</td>
						<td class="text-center" width=15%>
						<a href="detaile?board_num=${list.board_num }&pageNum=${pageMaker.cri.pageNum}&count=${pageMaker.cri.count}" style="color: black;  text-decoration: none;">${list.board_title }</a></td>
						<td class="text-center" width=25%>${list.board_content }</td>
						<td class="text-center" width=10%>${list.user_id }</td>
						<td class="text-center" width=5% style="color: gold;"><c:forEach var="a" begin="1" end="${list.board_score }">★</c:forEach></td>
						<td class="text-center" width=10%>${list.board_view }</td>
						<td class="text-center" width=5%></td>
						<td class="text-center" width=10%>
						<fmt:formatDate	value="${list.board_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 처리 -->
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
					       	<li class="page-item">
								<a class="page-link" href="list?pageNum=${pageMaker.startPage -1 }">Previous</a>
							</li>
					    </c:if>
					    <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage}">
					    	<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }">
						    	<a class="page-link" href="list?pageNum=${num }">${num }</a>
						    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next }">
						    <li class="page-item">
						      <a class="page-link" href="list?pageNum=${pageMaker.endPage +1 }">Next</a>
						    </li>
					    </c:if>
					    
				    </ul>
					
		</div>
		
	</div>

<%@include file="../footer.jsp"%> 
</body>
</html>