<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="resources/img/favicon.png" type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<title>등록 댓글 조회</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#navList').hover(function() {
			$(this).css("color", "gray");
		}, function() {
			$(this).css("color", "white");
		});
	})
</script>

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


		<!-- S: 본문 영역 시작 -->
		<section id="section-feature" class="container" style="margin-bottom: 100px;">
			<div id="container">
				<h1 class="display-1" style="text-align: center;">마이페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />
			</div>
			<div class="container" style="margin-top: 30px">
				<div class="row">
					<div class="col-sm-3">
						<h3 style="text-align: center">Menu</h3>
						<ul class="nav nav-pills flex-column">
							<li class="nav-item"><a class="nav-link orange" id="navList"
								href="modifyMember.do">회원 정보 수정</a></li>
							<li class="nav-item"><a class="nav-link orange" id="navList"
								href="showBoard.do">등록글 조회</a></li>
							<li class="nav-item"><a class="nav-link orange" id="navList"
								href="showReply.do">등록 댓글 보기</a></li>
							<li class="nav-item"><a class="nav-link orange" id="navList"
								href="wishList.do">관심 물품</a></li>
						</ul>
						<hr class="d-sm-none">
					</div>
					<div class="col-sm-9">
						<h2>회원이신 고객님의 댓글을 관리하는 공간입니다.</h2>

						<hr style="height: 5px;">
						<div id="container_box">

							<table class="table">
								<thead class="table-orange">
									<tr style="text-align: center">
										<th>번호</th>
										<th>댓글 내용</th>
										<th>작성일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commentList }" var="commentList">
										<tr style="text-align: center">
											<td class="board">${commentList.comment_num}</td>
											<td class="board">${commentList.comment_content }</td>
											<td class="board">${commentList.comment_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- E :본문 목록  -->

		<!-- E: 본문 영역 끝 -->

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