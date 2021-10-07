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
		<!--? Start Sample Area -->	
		<!-- End Sample Area -->
		
		<!--? Start Align Area -->
		<div class="whole-wrap">
			<div class="container box_1170">
				
					<div class="row">
						<div class="col-lg-12">
							<h3 class="mb-30">글 작성</h3>
							<form action="boardModifyDo.do?board_num=${boardDetail.board_num }" method="post" enctype="multipart/form-data" name="boardInput" id="boardInput">
								<div class="mt-10">
									<input type="text" name="board_title" placeholder="제목"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '제목'" required
										class="single-input" value="${boardDetail.board_title}" style="background:#fdece7">
								</div>
								<div class="mt-10">
									<textarea class="single-textarea" name="board_content" placeholder="내용" onfocus="this.placeholder = ''"
										onblur="this.placeholder = '내용'" required style="height: 400px;background:#fdece7">${boardDetail.board_content}</textarea>
								</div>
  								<div class="mt-20">
  									<button type="button" id="btn-freeboard-upload" class="genric-btn orange radius">이미지 업로드</button>
									<input id="input-freeboard-file" name="board_img" type="file" style="display:none;">
									<input type="hidden" name="board_img_name" value="${boardDetail.board_img_name }">
									<input type="text" id='input-freeboard-txt' class="single-input mt-10" value="이미지 이름" disabled style="background:#fdece7">
								</div>
  								<div class="mt-30" style="text-align: center;">
									<img style="width: 400px; height: 400px;" id="preview-image" src="resources/upload/${boardDetail.board_img_name}">
								</div>
							</form>
								<div class="mt-30" style="text-align: center;margin-bottom: 50px;">
									<button class="genric-btn orange radius" type="submit" form="boardInput">글 수정</button>
									<a href="board.do" class="genric-btn orange radius">돌아가기</a>
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