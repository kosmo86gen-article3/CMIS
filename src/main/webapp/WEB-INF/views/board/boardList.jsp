<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>테스트</title>

</head>
<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->

		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->

		<main>
			<!--? Hero Start -->


			<div
				class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light" style="margin-bottom: 50px !important;">
				<div class="col-md-5 p-lg-5 mx-auto my-5">
					<h1 class="display-4 font-weight-normal">자유게시판</h1>
					<p class="lead font-weight-normal">마음껏 소통하세요</p>
				</div>
				<div class="product-device shadow-sm d-none d-md-block"></div>
				<div
					class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
			</div>



			<!--? Start Align Area -->
			<div class="whole-wrap">
				<div class="container box_1170">

					<table class="table">
						<thead class="table-orange">
							<tr style="text-align: center;">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList }" var="board"
								begin="${pageMap.min }" end="${pageMap.max }">
								<tr style="text-align: center;">
									<td>${board.board_num }</td>
									<td><a class="freeboardAtag"
												href="boardDetail.do?board_num=${board.board_num}" style="color:#212529;">${board.board_title }</a></td>
									<td>${board.board_writer }</td>
									<td>${board.board_date }</td>
									<td>${board.board_hits }</td>
									
									
								</tr>
							</c:forEach>
						</tbody>
					</table>


					<div style="float: right; padding: 10px;">
						<a href="boardWrite.do" class="genric-btn orange radius">글쓰기</a>
					</div>
<div class="pagination-area text-center" style="padding-bottom: 50px;">
								<div class="container">
									<div class="row">
										<div class="col-xl-12">
											<div class="single-wrap d-flex justify-content-center">
												<nav aria-label="Page navigation example">
													<ul class="pagination justify-content-start " id="myDIV">

														<c:if test="${pageMap.minPage ne 1 }">
															<!-- pageMap의 minpage가 1이 아닐때  -->
															<li class="page-item"><a class="page-link"
																href="board.do?page=${pageMap.currentPage-5} ">
																	<span class="ti-angle-left"></span>
															</a></li>
														</c:if>

														<c:forEach var="i" begin="${pageMap.minPage }"
															end="${pageMap.maxPage }">

															<c:if test="${pageMap.currentPage eq i }">
																<li class="page-item active"><a class="page-link"
																	href="#">${i}</a></li>
															</c:if>

															<c:if test="${pageMap.currentPage ne i }">
																<li class="page-item"><a class="page-link"
																	href="board.do?page=${i}">${i}</a></li>
															</c:if>

														</c:forEach>

														<c:if test="${pageMap.maxPage ne pageMap.totPage }">
															<li class="page-item"><a class="page-link"
																href="board.do?page=${pageMap.currentPage+5}"><span
																	class="ti-angle-right"></span></a></li>
														</c:if>
													</ul>
												</nav>
											</div>
										</div>
									</div>
								</div>
							</div>

				</div>

			</div>
			<!-- End Align Area -->

		</main>

		<!-- S: 푸터 영역 시작 -->
		<footer id="footer">
			<div id="footer_box">
				<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
		</footer>
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->

</body>
</html>