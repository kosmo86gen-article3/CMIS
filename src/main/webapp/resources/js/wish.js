$(function(){
   // --------------------------------------------------------
   // 하트 이미지 클릭 시작
   $(document).on("click",".heart img",function(){
         var productName = $(this).parents("div.properties__card").find("div.properties__caption a").text();
         var productImgSrc = $(this).parents("div.properties__card").find("div.properties__img a img").attr("src");
         
         
         if( productName == null || productName==""){ 
            productName = $(this).parents("div.container").find("div.heart span").text();
         }
         if( productImgSrc == null || productImgSrc=="undefined"){    
            productImgSrc = $(this).parents("div.container").find("div.feature-img img").attr("src");   
         }   
   // ajax 시작
      $.ajax({
         type:"post",
         url:"ajaxHeartList.do",
         contentType : "application/x-www-form-urlencoded;charset=UTF-8",
         data:{
            product_name : productName, product_imgSrc : productImgSrc   
         },
           success:function(message){   
                   alert(message);
                }
      }) // ajax 종료 
   }) // 하트 이미지 클릭 종료
   
   // x눌렀을 때 찜목록 제거
   $('.remove').click(function(){
      if(confirm("찜 목록에서 제거하시겠습니까?") == true){   
         var member_id = $('input[name="member_id"]').val();
         var wish_num = $('input[name="wish_num"]').val();       
         $.ajax({
                type : "post",
               url : "dropWishlist.do",
               contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
               data : {member_id : member_id, wish_num : wish_num},
               success:function(result){
                            // 성공시 페이지 리로딩
                            alert(result);
                           location.reload();
                           }
         });//ajax종료
      }
    })//찜한개 제거 종료
    
    // 찜 목록 전체 제거
     $('#drop_wishlist').click(function(){
        if(confirm("찜 목록을 전부 삭제하시겠습니까?") == true){
            var member_id = $('input[name="member_id"]').val();

            $.ajax({
             type : "post",
             url : "dropWishlist.do",
             contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
              data : {member_id : member_id},
              success:function(result){
                            // 성공시 페이지 리로딩
                     alert(result);
                     location.reload();
                     }
               });//ajax종료
         }
    })//찜 목록전체 제거 종료 
   
   // 중복으로 하트 누를 때 찜목록에서 제거
    function delete_wish(){
       if(confirm("찜목록에서 제거하시겠습니까?") == true){
          var product_code = $('input[name="product_code"]').val();
          var member_id = $('input[name="member_id"]').val();
          
          $.ajax({
                type : "post",
                url : "deleteWish.do",
                contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
                data : {product_code : product_code, member_id : member_id},
                success:function(result){
                   // 성공시 페이지 리로딩
                   alert(result);
                  location.reload();
                  
                }
          });
       }
    }    
}) // end of function