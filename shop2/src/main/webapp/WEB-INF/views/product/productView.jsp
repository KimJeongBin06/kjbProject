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


</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<c:if test="${sessionScope.member.verify==2}">

<form action="${path }/product/productUpdate" method="post" enctype="multipart/form-data">

<div class="preloader_hide">




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
										 <img src="https://anjoimages.s3.amazonaws.com/${dto.pdimg1 }" />
										 <input type="hidden" name="pdimg1" value="${dto.pdimg1 }" />
										 </div>
									</li>
									<li>
										 <div class="select_img2">
										  <img src="https://anjoimages.s3.amazonaws.com/${dto.pdimg2 }" />
										  <input type="hidden" name="pdimg2" value="${dto.pdimg2 }" />
										 </div>
									</li>
									<li>
										<div class="select_img3">
										 <img src="https://anjoimages.s3.amazonaws.com/${dto.pdimg3 }" />
										 <input type="hidden" name="pdimg3" value="${dto.pdimg3 }" />
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
							<div class="single_portfolio_post_title"><input type="text" name="pdname" value="${dto.pdname }"></div>
							<p>별점 넣을수도 안넣을수도</p>
						</div><!-- //TEXT WIDGET -->
						
						<hr>
						
						<!-- INFO WIDGET -->
						<div class="sidepanel widget_info">
							<ul class="work_info">
								<li>Price: <div class="single_portfolio_post_title"><input type="number" name="pdprice" value="${dto.pdprice }"></div></li>
								<li>Detail: <textarea rows="10" cols="50" name="pdcontent" >${dto.pdcontent }</textarea></li>
								<li>재고수량: <input type="number" name="pdcnt" value="${dto.pdcnt }"></li>
								<li>판매개수: <input type="number" name="soldcnt" value="${dto.soldcnt }" readonly="readonly"></li>
								<li>상품코드: <input type="number" name="pdnu" value="${dto.pdnu }"></li>
								<li>카테고리: 
									<input type="radio" name="catecode" id="radioButton" class="show-check" value="1" <c:out value="${dto.catecode == '1'?'checked':''}" /> >
									<label for="radioButton">안경테</label>
									<input type="radio" name="catecode" id="radioButton" class="show-check" value="2" <c:out value="${dto.catecode == '2'?'checked':''}" /> >
									<label for="radioButton">선글라스</label>											
							 	</li>
							 	<li>종류:
							 		<input type="radio" name="pdtype" id="radioButton" class="show-check" value="1" <c:out value="${dto.pdtype == '1'?'checked':''}" /> >
									<label for="radioButton">뿔테</label>
									<input type="radio" name="pdtype" id="radioButton" class="show-check" value="2" <c:out value="${dto.pdtype == '2'?'checked':''}" /> >
									<label for="radioButton">금테</label>					 	
							 	</li>
							 	<li>모양:
							 		<input type="radio" name="pdshape" id="radioButton" class="show-check" value="1" <c:out value="${dto.pdshape == '1'?'checked':''}" /> >
									<label for="radioButton">원형</label>
									<input type="radio" name="pdshape" id="radioButton" class="show-check" value="2" <c:out value="${dto.pdshape == '2'?'checked':''}" /> >
									<label for="radioButton">사각형</label>
									<input type="radio" name="pdshape" id="radioButton" class="show-check" value="3" <c:out value="${dto.pdshape == '3'?'checked':''}" /> >
									<label for="radioButton">사각라운드</label>
									<input type="radio" name="pdshape" id="radioButton" class="show-check" value="4" <c:out value="${dto.pdshape == '4'?'checked':''}" /> >
									<label for="radioButton">캣츠형</label>	
							 		<input type="radio" name="pdshape" id="radioButton" class="show-check" value="5" <c:out value="${dto.pdshape == '5'?'checked':''}" /> >
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
				  <img src="https://anjoimages.s3.amazonaws.com/${dto.pddtimg }" />
				  <input type="hidden" name="pddtimg" value="${dto.pddtimg }" />
				  <input class="contact_btn pull-right" id="revreplyWrite" type="submit" value="수정하기" />
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

	


</div>




</form>
</c:if>
</body>
</html>