$(window).resize(function() {
	drawChart();
	drawChart1();
	drawChart2();
});

$(document).ready(function() {
	
	$('#locationPriceList').hide();
	
	var loader = $("div.loaderbase");
	loader.hide();
	
	$('.post_item a').click(function(){
		loader.show();
	});
	
	 $("label.btn").click(function() {
		 var btnId = $(this).children('input[type="radio"]').attr('id');
		 if(btnId == 'option1'){
			 $('#storePriceList').show();
			 $('#locationPriceList').hide();
		 }
		 else{
			 $('#locationPriceList').show();
			 $('#storePriceList').hide();
		 }
	 })
	


});