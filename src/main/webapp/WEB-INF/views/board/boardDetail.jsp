<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                              <h2>자유 게시판 상세 글 페이지</h2>
                           </div>
                     </div>
                  </div>
               </div>
         </div>
      </div>
      <!-- Hero End -->
      <!--? Blog Area Start -->
      <section class="blog_area single-post-area section-padding">
      
         <div class="container">
         
            <div class="row">
            
               <div class="col-lg-12 posts-list">
               
                  <div class="single-post">
                  
                  	 <div class="feature-img">
                        <img class="img-fluid" src="resources/upload/${boardDetail.board_img_name}" alt="">
                     </div>
                     
                     <div class="blog_details">
                        <h2 style="color: #2d2d2d;">${boardDetail.board_title }</h2>
                        <ul class="blog-info-link mt-3 mb-4">
                           <li><i class="fa fa-user"></i> ${boardDetail.board_writer }</li>
                           <li><a href="#"><i class="fa fa-comments"></i> ${fn:length(commentsAll)} Comments </a></li>
                        </ul>
                        <p>
                           ${boardDetail.board_content }
                        </p>
                     </div>
                     
                  </div>
                  
                  <div class="navigation-top" style="padding-bottom:15px;">
                     <div class="navigation-area">
                        <div class="row">
                           
                           <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                              <a href="board.do" class="genric-btn info-border radius">글 목록으로 돌아가기</a>
                           </div>
                           
                           <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                              <a href="boardModify.do?board_num=${boardDetail.board_num }" class="genric-btn success-border radius mr-30">수정</a>
                              <form action="boardDeleteDo.do" method="post" id="boardDelete">
                                <input type="hidden" name="board_img_name" value="${boardDetail.board_img_name }">
                                <input type="hidden" name="board_num" id="board_num" value="${boardDetail.board_num }">          
                     		    <button type="submit" class="genric-btn danger-border radius">삭제</button>
                           	  </form>
                           </div>
                           
                        </div>
                     </div>
                  </div>
                  
                  <div class="comments-area" style="margin-top:20px;">
                     <h4>${fn:length(commentsAll)} Comments</h4>
                     <c:forEach items="${commentsAll }" var="comment">
                      <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="desc" id="desc">
                                   <p class="comment">${comment.comment_content }</p>
								   <div class="d-flex justify-content-between">
								     <div class="d-flex align-items-center">
									   <h5 id="commentWriter">${comment.comment_writer }</h5>
									   <p class="date">${comment.comment_date }</p>
									 </div>
									 <div class="reply-btn">
									   <input type="hidden" value="${comment.comment_writer }">
                                       <a href="#" id="brdrpldltatag" class="btn-reply text-uppercase">삭제</a>
									   <input type="hidden" value="${comment.comment_num }">
                                     </div>
								   </div>
                              </div>
                           </div>
                        </div>
                      </div>
				     </c:forEach>
                  </div>
                  
                  <div class="comment-form">
                     <h4>댓글 달기</h4>
                        <div class="row">
                           <div class="col-12">
                              <div class="form-group">
                                 <textarea class="form-control w-100" name="comment_content" id="comment_content" cols="30" rows="9" placeholder="댓글 내용을 입력하세요"></textarea>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <button type="button" class="button button-contactForm btn_1 boxed-btn" id="boardCommentBtn">댓글 달기</button>
                        </div>
                  </div>
                  
               </div>
               
            </div>
            
         </div>
         
      </section>
      <!-- Blog Area End -->
     
</main>

<script type="text/javascript">
			$(function(){
				$('#boardCommentBtn').click(writeComment);
				
				function writeComment() {
					$.ajax({
						url:"boardReplyDo.do", 
						type:"post", 
						contentType:"application/x-www-form-urlencoded;charset=UTF-8",
						data:{board_num:$('#board_num').val(), comment_content:$('#comment_content').val()}, 
						dataType: 'json', 
						success:function(result){
							document.getElementById("comment_content").value='';
							
							$("#desc *").remove();
							
							var content = "";

							for (var i=0; i<result.length; i++) {
								content += '<div class="comment-list"> ' 
									 + '<div class="single-comment justify-content-between d-flex">'
		                             + '<div class="user justify-content-between d-flex">'
		                             + '<div class="desc" id="desc">'
									 + '<p class="comment">' + result[i].comment_content + '</p> '
									 + '<div class="d-flex justify-content-between"> ' 
									 + '<div class="d-flex align-items-center">'
									 + '<h5> ' + result[i].comment_writer + ' </h5> ' 
									 + '<p class="date">' + result[i].comment_date + '</p> ' 
									 + '<div class="reply-btn"> '
                                     + '<a href="#" class="btn-reply text-uppercase">삭제</a> '
                                  	 + '</div> '
									 + '</div> ' 
									 + '</div> ' 
									 + '</div> ' 
									 + '</div> ' 
									 + '</div> ' 
									 + '</div> '; 
							}
							
							$('#desc').append(content);
							
							location.reload();
						}, 
						error: function(request, status, error) {
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					}) // ajax 끝
				} // function 끝
				
				$(document).on("click","a[id='brdrpldltatag']",function(e){
			        e.preventDefault(); // 추가이벤트를 막아서 #의 최상위이동막음
			        
			        $.ajax({
					url:"boardReplyDeleteDo.do", 
					type:"post", 
					contentType:"application/x-www-form-urlencoded;charset=UTF-8", 
					data:{board_num:$('#board_num').val(), comment_num:$(this).next().val(), comment_writer:$(this).prev().val()}, 
					dataType: 'json', 
					success:function(result){
						$("#desc *").remove();
						
						var content = "";

						for (var i=0; i<result.length; i++) {
							content += '<div class="comment-list"> ' 
								 + '<div class="single-comment justify-content-between d-flex">'
	                             + '<div class="user justify-content-between d-flex">'
	                             + '<div class="desc" id="desc">'
								 + '<p class="comment">' + result[i].comment_content + '</p> '
								 + '<div class="d-flex justify-content-between"> ' 
								 + '<div class="d-flex align-items-center">'
								 + '<h5> ' + result[i].comment_writer + ' </h5> ' 
								 + '<p class="date">' + result[i].comment_date + '</p> ' 
								 + '<div class="reply-btn"> '
                                 + '<a href="#" class="btn-reply text-uppercase">삭제</a> '
                              	 + '</div> '
								 + '</div> ' 
								 + '</div> ' 
								 + '</div> ' 
								 + '</div> ' 
								 + '</div> ' 
								 + '</div> '; 
						}
						
						$('#desc').append(content);
						
						location.reload();
					}, 
					error: function(request, status, error) {
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}); // ajax 끝
				}); // function 끝
				
			}); // document ready 끝
</script>
   
   <!-- S: 푸터 영역 시작 -->
   <footer id = "footer">
      <div id = "footer_box">
         <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
      </div>
   </footer>
   
</div> <!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>