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
<div id = "root"> <!-- S: Index(Home).jsp 의 div 총괄 시작 -->

<!-- S: 헤더 부분 시작 -->
   <header id= "header">
      <div id = "header_box">
         <jsp:include page="/WEB-INF/views/include/header.jsp"/>
      </div>
   </header>
   <!-- E: 헤더 부분 끝 -->
   
      <main>
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height3  hero-overly hero-bg4 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap2 pt-20 text-center">
                                <h2>자유 게시판</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<!--? Start Sample Area -->
		<section class="sample-text-area">
			<div class="container box_1170">
				<h3 class="text-heading">자유 게시판</h3>
				<p class="sample-text">
					자유 게시판입니다. 마음껏 소통하세요.
				</p>
				<a href="boardWrite.do" class="genric-btn primary-border radius">글쓰기</a>
			</div>
		</section>
		<!-- End Sample Area -->
		
		<!--? Start Align Area -->
		<div class="whole-wrap">
			<div class="container box_1170">
			
				<div class="section-top-border">
					<h3 class="mb-30">글 목록</h3>
					<div class="progress-table-wrap">
						<div class="progress-table">
							<div class="table-head">
								<div class="serial">번호</div>
								<div class="country">제목</div>
								<div class="visit">작성자</div>
								<div class="freeboardDate">작성일자</div>
								<div class="freeboardCnt">조회수</div>
							</div>
							<c:forEach items="${boardList }" var="board">
								<div class="table-row">
								<div class="serial">${board.board_num }</div>
								<div class="country"><a class="freeboardAtag" href="boardDetail.do?board_num=${board.board_num}">${board.board_title }</a></div>
								<div class="visit">${board.board_writer }</div>
								<div class="freeboardDate">${board.board_date }</div>
								<div class="freeboardCnt">${board.board_hits }</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- End Align Area -->
		
    </main>
    
   <!-- S: 푸터 영역 시작 -->
   <footer id = "footer">
      <div id = "footer_box">
         <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
      </div>
   </footer>
</div> <!-- E: Index(Home).jsp 의 div 총괄 끝  -->

</body>
</html>