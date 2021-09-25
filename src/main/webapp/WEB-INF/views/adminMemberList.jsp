<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>adminGetMember</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('.memberListID').hover(function() {
			$(this).css("color", "#ff8d1e");
		}, function() {
			$(this).css("color", "black");
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
				<h1 class="display-1" style="text-align: center;">관리자 페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />

				<div class="container" style="margin-top: 30px">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="text-align:center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link active" id="navList"
									href="adminMemberList.do">회원 목록</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="adminShowBoard.do">전체 글 목록
										조회</a></li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="adminShowReply.do">전체 댓글 목록</a>
								</li>
								<li class="nav-item"><a class="nav-link active" id="navList" href="wishList.do">관심 물품</a>
								</li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-8">
							<h2>관리자 권한으로 회원의 개인정보를 관리하는 공간입니다.</h2>

							<hr style="height: 5px;">
							<div id="container_box">

				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>회원 아이디</th>
							<th>회원 이름</th>
							<th>회원 나이</th>
							<th>회원 연락처</th>
							<th>회원 가입일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList }" var="member">
							<tr>
								<td><a href="adminGetMember.do?user_id=${member.user_id}" style="color:black" class="memberListID">${member.user_id}</a></td>
								<td>${member.member_name}</td>
								<td>${member.member_age}</td>
								<td>${member.member_phone}</td>
								<td>${member.regdate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
							
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