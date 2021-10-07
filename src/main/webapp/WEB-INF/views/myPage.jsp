<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CMIS MY PAGE</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

function clip(){
	
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = "http://localhost:8000/zFinalProejct/loginPage.do"
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.")
}

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
		<section id="section-feature" class="container">
			<div id="container">
				<h1 class="display-1" style="text-align: center;">마이페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />

				<div class="container" style="margin-top: 30px">
					<div class="row">
						<div class="col-sm-3">
							<h3 style="text-align: center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link orange" id="navList"
									href="modifyMember.do">회원 정보 수정</a></li>
								<li class="nav-item"><a class="nav-link orange" id="navList" href="showBoard.do">등록글
										조회</a></li>
								<li class="nav-item"><a class="nav-link orange" id="navList" href="showReply.do">등록 댓글 보기</a>
								</li>
								<li class="nav-item"><a class="nav-link orange" id="navList" href="wishList.do">관심 물품</a>
								</li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-9">
							<div class="jumbotron">
								<h1 class="display-4">회원 정보 관리, 내 커뮤니티 활동</h1>
								<p class="lead">개인 정보는 1년간 보관되며 고객에게 먼저 알려드립니다.</p>
								<hr class="my-4">
								<p>아직 저희 사이트를 이용하지 않는 친구가 있다면 초대해주세요 !</p>
								<a class="btn btn-primary btn-lg"  href="loginPage.do" onclick="clip(); return false;"  role="button" id="invitation">초대 링크 복사</a>
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