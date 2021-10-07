<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>showBoard</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#navList').hover(function() {
			$(this).css("color", "gray");
		}, function() {
			$(this).css("color", "white");
		});
	})
</script>
<style type="text/css">
@import
	url(https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,800)
	;

body {
	font-size: 16px;
	line-height: 22px;
	color: #555;
	font-family: 'Raleway', sans-serif;
	font-weight: 300;
	text-shadow: rgba(0, 0, 0, .01) 0 0 1px;
}

#myPageAtag {
	color: black;
	font-size: 150%;
	display: flex;
}

#navList{
	margin-bottom : 10px;
	background-color : #050d15;
}


</style>


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
		<section id="section-feature" class="container">
			<div id="container">
				<h1 class="display-1" style="text-align: center;">마이페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />

				<div class="container" style="margin-top: 30px">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="text-align:center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link active" id="navList"
									href="modifyMember.do">회원 정보 수정</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="showBoard.do">등록글
										조회</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="showReply.do">등록 댓글 보기</a>
								</li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="wishList.do">관심 물품</a>
								</li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-8">
							<h2>회원이신 고객님의 게시글을 관리하는 공간입니다.</h2>

							<hr style="height: 5px;">
							<div id="container_box">

				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>번호</th>
							<th>글 제목</th>
							<th>조회수</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList }" var="boardList">
							<tr>
								<td class = "board">${boardList.board_num}</td>
								<td class = "board"><a href="boardDetail.do?board_num=${boardList.board_num}" style="color:black" class="memberListID">${boardList.board_title}</a></td>
								<td class = "board">${boardList.board_hits}</td>
								<td class = "board">${boardList.board_date}</td>
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