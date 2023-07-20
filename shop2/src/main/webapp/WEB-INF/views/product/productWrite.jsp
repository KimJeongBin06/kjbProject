<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="../include/shop_header.jsp" %>
<script src="${path }/resources/jquery/jquery-3.3.1.min.js" ></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link rel="shortcut icon" href="images/favicon.ico">
    
	<!-- CSS -->
	<link href="../resources/review/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../resources/review/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="../resources/review/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../resources/review/css/owl.carousel.css" rel="stylesheet">
	<link href="../resources/review/css/style.css" rel="stylesheet" type="text/css" />
	<link href="../resources/review/css/colors/" rel="stylesheet" type="text/css" id="colors" />
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	
    
	<!-- SCRIPTS -->
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <!--[if IE]><html class="ie" lang="en"> <![endif]-->
	
	<script src="../resources/review/js/jquery.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/superfish.min.js" type="text/javascript"></script>
	<script src="../resources/review/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="../resources/review/js/owl.carousel.js"></script>
	<script src="../resources/review/js/animate.js" type="text/javascript"></script>
	<script src="../resources/review/js/myscript.js" type="text/javascript"></script>

<style>
.show-check {
  -webkit-appearance: radio !important;
  -moz-appearance: radio !important;
  appearance: radio !important;
}
</style>
<script>
	$(document).ready(function(){
		$("#revreplyWrite").click(function(){
			var image1 = document.form1.image1.value;
			var image4 = document.form1.image4.value;
			var pdname = document.form1.pdname.value;
			var pdprice = document.form1.pdprice.value;
			var pdcontent = document.form1.pdcontent.value;
			var pdcnt = document.form1.pdcnt.value;
			var pdnu = document.form1.pdnu.value;
			if(!image1){
				alert("섬네일 이미지1을 등록하세요");
				document.form1.image1.focus();
				return;
			}
			if(!image4){
				alert("본문 이미지를 등록하세요");
				document.form1.image4.focus();
				return;
			}
			if(pdname==""){
				alert("상품명을 등록하세요");
				document.form1.pdname.focus();
				return;
			}
			if(pdprice==""){
				alert("상품 가격을 입력하세요");
				document.form1.pdprice.focus();
				return;
			}
			if(pdcontent==""){
				alert("상세정보를 입력하세요");
				document.form1.pdcontent.focus();
				return;
			}
			if(pdcnt==""){
				alert("재고수량을 입력하세요");
				document.form1.pdcnt.focus();
				return;
			}
			if(pdnu==""){
				alert("상품코드를 입력하세요");
				document.form1.pdnu.focus();
				return;
			}
			if( $('input[type=radio][name=catecode]:checked').length == 0 ) {
			    alert("카테고리를 선택해주세요");
			    return;
			}
			if( $('input[type=radio][name=pdtype]:checked').length == 0 ) {
			    alert("종류를 선택해주세요");
			    return;
			}
			if( $('input[type=radio][name=pdshape]:checked').length == 0 ) {
			    alert("모양을 선택해주세요");
			    return;
			}
			document.form1.submit();
		})
	})
</script>

</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<c:if test="${sessionScope.member.verify==2}">
<form name="form1" action="${path }/product/productInsert" method="post" enctype="multipart/form-data">

	<!-- PAGE -->
	<div id="page" class="single_page">

		
		<!-- BREADCRUMBS -->
		<br>
		<br>
		<br>
		
		
		
		<!-- PORTFOLIO -->
		<section id="portfolio">
			
			<!-- CONTAINER -->
			<div class="container">
				
				<!-- ROW -->
				<div class="row">
					
					<!-- SIDEBAR -->
					
					
					
					<!-- PORTFOLIO BLOCK -->
					<div class="portfolio_block col-lg-8 col-md-8 pull-left padbot50">
						
						<!-- SINGLE PORTFOLIO POST -->
						<label for="gdsImg1">섬네일 이미지1</label>
						<input type="file" id="gdsImg1" name="image1"/>
						
					    <label for="gdsImg2">섬네일 이미지2</label>
					    <input type="file" id="gdsImg2" name="image2"/>
					    
	    				<label for="gdsImg3">섬네일 이미지3</label>
						<input type="file" id="gdsImg3" name="image3"/>
					    			
						<div class="single_portfolio_post clearfix" data-animated="fadeInUp">	
							<!-- PORTFOLIO SLIDER -->
							<div class="flexslider portfolio_single_slider">
							
								<ul class="slides">									
									<li>									
										 <div class="select_img1">
										 <img src="" />
										 </div>
									</li>
									<li>
										 <div class="select_img2">
										  <img src="" />										  
										 </div>
									</li>
									<li>
										<div class="select_img3">
										 <img src="" />										 
										</div>
									</li>									
								</ul>
							</div><!-- //PORTFOLIO SLIDER -->
						</div><!-- //SINGLE PORTFOLIO POST -->
					</div><!-- //PORTFOLIO BLOCK -->
					<div class="sidebar col-lg-4 col-md-4 pull-right padbot50">
						<!-- TEXT WIDGET -->
						<div class="sidepanel widget_text">
							상품명: 
							<div class="single_portfolio_post_title"><input type="text" name="pdname"></div>
							<p></p>
						</div><!-- //TEXT WIDGET -->
						
						<hr>
						
						<!-- INFO WIDGET -->
						<div class="sidepanel widget_info">
							<ul class="work_info">
								<li>Price: <div class="single_portfolio_post_title"><input type="number" name="pdprice"></div></li>
								<li>Detail: <textarea rows="10" cols="50" name="pdcontent" ></textarea></li>
								<li>재고수량: <input type="number" name="pdcnt"></li>
								<li>판매개수: <input type="number" name="soldcnt" value="0" readonly="readonly"></li>
								<li>상품코드: <input type="number" name="pdnu"></li>
								<li>카테고리: 
									<input type="radio" name="catecode" id="radioButton" class="show-check" value="1">
									<label for="radioButton">안경테</label>
									<input type="radio" name="catecode" id="radioButton" class="show-check" value="2">
									<label for="radioButton">선글라스</label>											
							 	</li>
							 	<li>종류:
							 		<input type="radio" name="pdtype" id="radioButton" class="show-check" value="1">
									<label for="radioButton">뿔테</label>
									<input type="radio" name="pdtype" id="radioButton" class="show-check" value="2">
									<label for="radioButton">금테</label>					 	
							 	</li>
							 	<li>모양:
							 		<input type="radio" name="pdshape" id="radioButton" class="show-check" value="1">
									<label for="radioButton">원형</label>
									<input type="radio" name="pdshape" id="radioButton" class="show-check" value="2">
									<label for="radioButton">사각형</label>
									<input type="radio" name="pdshape" id="radioButton" class="show-check" value="3">
									<label for="radioButton">사각라운드</label>
									<input type="radio" name="pdshape" id="radioButton" class="show-check" value="4">
									<label for="radioButton">캣츠형</label>	
							 		<input type="radio" name="pdshape" id="radioButton" class="show-check" value="5">
									<label for="radioButton">스포츠형</label>	
							 	</li>	
							</ul>
							
											
							
						</div><!-- //INFO WIDGET -->
					</div><!-- //SIDEBAR -->
				</div><!-- //ROW -->
			</div><!-- //CONTAINER -->
			
			
			<!-- CONTAINER -->
			<div class="container">
				<h2><b>제품상세</b> </h2>
				<label for="gdsImg4">본문 이미지</label>
				 <input type="file" id="gdsImg4" name="image4"/>
				 <div class="select_img4">
				  <img src="" />
				  <input class="contact_btn pull-right" id="revreplyWrite" type="button" value="등록" />
				 </div>
			</div><!-- //CONTAINER -->

			


			
		</section><!-- //PORTFOLIO -->
	</div><!-- //PAGE -->
<script>
 
  $("#gdsImg1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img1 img").attr("src", data.target.result).width(1000);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  $("#gdsImg2").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img2 img").attr("src", data.target.result).width(1000);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#gdsImg3").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img3 img").attr("src", data.target.result).width(1000);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  $("#gdsImg4").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img4 img").attr("src", data.target.result).width(700);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  
 </script>	

	


</form>
</c:if>
</body>
</html>