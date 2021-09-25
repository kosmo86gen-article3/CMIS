<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>wishList</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.memberListID').hover(function() {
			$(this).css("color", "#717D7E");
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

#navList {
	margin-bottom: 10px;
	background-color: #050d15;
}
tbody a img{
	max-width: 100px; 
	max-height: 100px;
}
tbody a:hover { color: #8c59b9; }
a:link { color:#4b70fd; }
a:visited { color: #8c59b9; }

.buttons-cart a:hover{
	color: #ffffff;
	background-color:#8c59b9;

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
							<h3 style="text-align: center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="adminMemberList.do">회원 목록</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="adminShowBoard.do">전체 글 목록 조회</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="adminShowReply.do">전체 댓글 목록</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="wishList.do">관심 물품</a></li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-8">
							<h2 style="text-align: center">관심 물품 조회</h2>

							<hr style="height: 5px;">
							<div id="container_box">

								<table class="table"  style="text-align: center; " >
									<thead class="thead-dark">
										<tr>
											<th>상품 이미지</th>
											<th>상품명</th>
											<th>평균 가격</th>
											<th>최저 가격</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty wishList }">
											<c:forEach items="${wishList}" var="wish">
											<input type="hidden" value="${wish.member_id}" name="member_id"/>
											<input type="hidden" value="${wish.wish_num}" name="wish_num"/>
												<tr>
													<td class="product-thumbnail"><a
														href="product.do?product_code=${wish.product_code }"><img
															src="resources/img/images/${wish.product_code}.jpg"
															alt="${wish.product_name }"  /></a></td>
													<td class="product-name"><a
														href="product.do?product_code=${wish.product_code }">${wish.product_name }</a></td>
													<td class="product-price"><span class="amount">${wish.product_last_average_price}원</span></td>
													<td class="product-min-price"><span class="amount">${wish.product_last_min_price}원</span></td>
													<td class="product-remove"><a href="#" class="remove"
														id="${wish.wish_num }">X</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<div class="buttons-cart" style="text-align: right">
									<a href="#" onclick="drop_wishlist()">전체 삭제</a>
								</div>
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
