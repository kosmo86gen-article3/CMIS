<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>통계 페이지</title>
<link rel="stylesheet" href="resources/css/adminPage.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="./resources/js/admin.js"></script>
<script type="text/javascript">

var colors = ['#007bff',	'#dc3545','#fd7e14','#28a745','#6f42c1','#e83e8c'];

// 최다 조회 상품 그래프
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart1);
function drawChart1() {
  var data = google.visualization.arrayToDataTable([
    ['상품명', '조회수',  { role: 'style' }],
    <c:forEach items="${productViewRank}" var="productList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${productList.product_name}', ${productList.product_views_count}, colors[${status.index}]],
	   		</c:if>
	   <c:if test="${status.last}">
	   ['${productList.product_name}', ${productList.product_views_count}, colors[${status.index}]]
		</c:if>
	</c:forEach>
  ]);

  var options = {
    legend: {position: 'none'}
    /* vAxis: {minValue: 0} */
 };

var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
  chart.draw(data, options);
}

//최다 조회 상품 그래프
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart2);
function drawChart2() {
  var data = google.visualization.arrayToDataTable([
    ['상품명', '관심물품 등록 건수',{ role: 'style' }],
    <c:forEach items="${productWishRank}" var="productList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${productList.product_name}', ${productList.cnt},colors[${status.index}]],
	   		</c:if>
	   <c:if test="${status.last}">
	   ['${productList.product_name}', ${productList.cnt},colors[${status.index}]]
		</c:if>
	</c:forEach>
  ]);

  var options = {
    legend: {position: 'none'}
    /* vAxis: {minValue: 0} */
 };

var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
  chart.draw(data, options);
}


//최다 조회 상품 그래프
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart3);
function drawChart3() {
var data = google.visualization.arrayToDataTable([
  ['회원 아이디', '글 등록 건수',{ role: 'style' }],
  <c:forEach items="${communityRank}" var="communityRankList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${communityRankList.user_id}', ${communityRankList.cnt_sum},colors[${status.index}]],
	   		</c:if>
	   <c:if test="${status.last}">
	   ['${communityRankList.user_id}', ${communityRankList.cnt_sum},colors[${status.index}]]
		</c:if>
	</c:forEach>
]);

var options = {
  legend: {position: 'none'}
  /* vAxis: {minValue: 0} */
};

var chart = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
chart.draw(data, options);
}

//핫딜상품 보유 순위 매장 그래프
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart4);
function drawChart4() {
var data = google.visualization.arrayToDataTable([
  ['매장명', '핫딜 상품 건수',{ role: 'style' }],
  <c:forEach items="${hotPriceShopRank}" var="hotPriceShopRankList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${hotPriceShopRankList.shop_name}', ${hotPriceShopRankList.cnt},colors[${status.index}]],
	   		</c:if>
	   <c:if test="${status.last}">
	   ['${hotPriceShopRankList.shop_name}', ${hotPriceShopRankList.cnt},colors[${status.index}]]
		</c:if>
	</c:forEach>
]);

var options = {
  legend: {position: 'none'}
  /* vAxis: {minValue: 0} */
};

var chart = new google.visualization.ColumnChart(document.getElementById('chart_div4'));
chart.draw(data, options);
}

//회원 연령대 분포
google.load("current", {packages:["corechart"]});
google.setOnLoadCallback(drawChart5);
function drawChart5() {
var data = google.visualization.arrayToDataTable([
  ['연령대', '회원수'],
  <c:forEach items="${memberAge}" var="memberAgeList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${memberAgeList.age}', ${memberAgeList.cnt}],
	   		</c:if>
	   <c:if test="${status.last}">
	   ['${memberAgeList.age}', ${memberAgeList.cnt}]
		</c:if>
	</c:forEach>
]);

var options = {

};

var chart = new google.visualization.PieChart(document.getElementById('chart_div5'));
chart.draw(data, options);
}

//상품 카테고리 분포
google.load("current", {packages:["corechart"]});
google.setOnLoadCallback(drawChart6);
function drawChart6() {
var data = google.visualization.arrayToDataTable([
  ['연령대', '회원수'],
  <c:forEach items="${categoryRatio}" var="categoryRatioList" varStatus="status">
	  		<c:if test="${!status.last}">
	  			['${categoryRatioList.main_category_name}', ${categoryRatioList.cnt}],
	   		</c:if>
	   <c:if test="${status.last}">
	   ['${categoryRatioList.main_category_name}', ${categoryRatioList.cnt}]
		</c:if>
	</c:forEach>
]);

var options = {

};

var chart = new google.visualization.PieChart(document.getElementById('chart_div6'));
chart.draw(data, options);
}

//1주간 신규 회원 가입 수
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawChart7);
function drawChart7() {
var data = new google.visualization.DataTable();

data.addColumn('date');
data.addColumn('number', '가입자 수');

<c:forEach items="${memberWeekJoin}" var="memberJoinList">

data.addRow([new Date(${memberJoinList.regdate}),${memberJoinList.cnt}]);


</c:forEach>


var options = {
		 hAxis: {format: 'M월 d일'}
};

var chart = new google.visualization.LineChart(document.getElementById('chart_div7'));
chart.draw(data, options);
}

</script>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="adminMemberList.do">관리자 페이지 돌아가기</a>
		<a style="max-height: 40px;position: absolute;right: 0%;" target="_blank" class="navbar-brand" href="https://analytics.google.com/analytics/web/?hl=ko#/p287639973/realtime/overview?params=_u..nav%3Dmaui">
		 <img style="max-height: 40px;" ng-src="//www.gstatic.com/analytics-suite/header/suite/v2/ic_analytics.svg" alt="애널리틱스" src="//www.gstatic.com/analytics-suite/header/suite/v2/ic_analytics.svg">
		 애널리틱스</a>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->

			<!-- Icon Cards-->

			<!-- Area Chart Example-->
			<div class="row">
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i> 신규 가입 회원 통계
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-primary">${memberJoinCount.totMem }</div>
									<hr />
									<span>전체 회원 수</span>
								</div>
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-danger">${memberJoinCount.yesterMem }</div>
									<hr />
									<span>어제 신규 가입자</span>
								</div>
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-warning">${memberJoinCount.monthMem }</div>
									<hr />
									<span>이번달 신규 가입자</span>
								</div>
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-success">${memberJoinCount.yaerMem }</div>
									<hr />
									<span>올해 신규 가입자</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i> 커뮤니티 통계
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-primary">${boardCount[0].cnt }</div>
									<hr />
									<span>어제 작성한 자유게시판 글</span>
								</div>
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-danger">${boardCount[1].cnt }</div>
									<hr />
									<span>어제 작성한 자유게시판 댓글</span>
								</div>
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-warning">${boardCount[2].cnt }</div>
									<hr />
									<span>어제 작성한 Q&A 글 </span>
								</div>
								<div class="col-xl-3 col-sm-3 mb-3">
									<div class="h4 mb-0 text-success">${boardCount[3].cnt }</div>
									<hr />
									<span>어제 작성한 Q&A 댓글</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>회원 연령대 분포
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div5" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>커뮤니티 활동 랭킹
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div3" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>조회수 높은 상품
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div1" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>관심물품으로 많이 담긴 상품
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div2" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>상품 카테고리 비율
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div6" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>핫딜 상품이 많은 매장 순위
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div4" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-6">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart"></i>1주간 신규 회원 가입수
						</div>
						<div class="card-body">
							<div class="row" style="text-align: center;">
								<div id="chart_div7" class="chart"
									style="width: 100%; min-height: 400px;"></div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				




				<!-- Card Columns Example Social Feed-->

				<!-- /Card Columns-->


			</div>
			<!-- Example DataTables Card-->
		</div>
	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>

					<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.0.2/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.0.2/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDzY2mBhNbIggaoDccNblTUQodHLRWVOUE",
    authDomain: "cmis-430ec.firebaseapp.com",
    projectId: "cmis-430ec",
    storageBucket: "cmis-430ec.appspot.com",
    messagingSenderId: "636226969812",
    appId: "1:636226969812:web:608e8311e0ff2754781b41",
    measurementId: "G-BFS844XTQ1"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>
					;

					<!--<script src="resources/js/adminPage.js"></script> -->
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>