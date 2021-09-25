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
                                <h2>자유 게시판 글 수정</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<!--? Start Sample Area -->
		<section class="sample-text-area">
			<div class="container box_1200">
				<h3 class="text-heading">자유 게시판</h3>
				<p class="sample-text">
					자유 게시판 글 수정 페이지입니다.
				</p>
				<a href="board.do" class="genric-btn info-border radius">글 목록으로 돌아가기</a>
			</div>
		</section>
		<!-- End Sample Area -->
		
		<!--? Start Align Area -->
		<div class="whole-wrap">
			<div class="container box_1170">
				
				<div class="section-top-border">
					<div class="row">
						<div class="col-lg-12">
							<h3 class="mb-30">글 작성</h3>
							<form action="boardModifyDo.do?board_num=${boardDetail.board_num }" method="post" enctype="multipart/form-data" name="boardInput" id="boardInput">
								<div class="mt-10">
									<input type="text" name="board_title" placeholder="제목"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '제목'" required
										class="single-input" value="${boardDetail.board_title}">
								</div>
								<div class="mt-10">
									<textarea class="single-textarea" name="board_content" placeholder="내용" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '내용'" required>${boardDetail.board_content}</textarea>
								</div>
  								<div class="mt-20">
  									<button type="button" id="btn-freeboard-upload" class="genric-btn success-border radius">이미지 업로드</button>
									<input id="input-freeboard-file" name="board_img" type="file" style="display:none;">
									<input type="hidden" name="board_img_name" value="${boardDetail.board_img_name }">
									<input type="text" id='input-freeboard-txt' class="single-input mt-10" value="이미지 이름" disabled>
								</div>
  								<div class="mt-30">
									<img style="width: 400px; height: 400px;" id="preview-image" src="resources/upload/${boardDetail.board_img_name}">
								</div>
							</form>
								<div class="mt-30">
									<button class="genric-btn primary-border radius" type="submit" form="boardInput">글 수정</button>
								</div>
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

<script type="text/javascript">
 $(function() { 
	$('#btn-freeboard-upload').click(function (e) {
	    e.preventDefault();
	    $('#input-freeboard-file').click();
	});
 
	$("#input-freeboard-file").on('change',function() {
		var fileValue = $("#input-freeboard-file").val().split('\\');
		var fileName = fileValue[fileValue.length-1];
		$("#input-freeboard-txt").val(fileName);
	});
 }); 
 
function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if(input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
	        
		// FileReader 인스턴스 생성
		const reader = new FileReader();
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			const previewImage = document.getElementById("preview-image");
			previewImage.src = e.target.result;
		}
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0]);
	}
}
 
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-freeboard-file");
inputImage.addEventListener("change", e => {
	readImage(e.target);
});
</script> 

</body>
</html>