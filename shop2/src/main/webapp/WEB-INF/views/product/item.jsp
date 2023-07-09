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
	<link href="../resources/review/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
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

<script>
	$(document).ready(
		function(){
			$(".addCart_btn").click(
				function(){ //var 들어오는 값에 따라 자동으로 데이터형이 변환
					<c:choose>
						<c:when test="${sessionScope.member.mid == null }">
							alert("로그인 하신 후 사용해 주세요."); //알림창->확인버튼을 클릭 후
							location.href="${path}/member/login";  //로그인 페이지로 이동
						</c:when>
						<c:otherwise>
							alert('카트에 담겼습니다.');
							document.form1.submit(); //폼을 전송
						</c:otherwise>
					</c:choose>
					//제목과 내용이 존재하면
					
				}		
			
			);
			
		}		
	);
</script>


</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>


<form name="form1" action="${path}/product/addCart" method="post" >




<div class="preloader_hide">

	<!-- PAGE -->
	<br>
	<div id="page" class="single_page">

		
		<!-- BREADCRUMBS -->

		
		
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
						<div class="single_portfolio_post clearfix" data-animated="fadeInUp">
							
							<!-- PORTFOLIO SLIDER -->
							<div class="flexslider portfolio_single_slider">
								<ul class="slides">
									<li><img src="https://anjoimages.s3.amazonaws.com/${dto.pdimg1 }" alt="" /></li>
									<li><img src="https://anjoimages.s3.amazonaws.com/${dto.pdimg2 }" alt="" /></li>
									<li><img src="https://anjoimages.s3.amazonaws.com/${dto.pdimg3 }" alt="" /></li>									
								</ul>
							</div><!-- //PORTFOLIO SLIDER -->
						</div><!-- //SINGLE PORTFOLIO POST -->
					</div><!-- //PORTFOLIO BLOCK -->
					<div class="sidebar col-lg-4 col-md-4 pull-right padbot50">
						<!-- TEXT WIDGET -->
						<div class="sidepanel widget_text">
							<div class="single_portfolio_post_title">${dto.pdname }</div>
							<p>
							<div class="product__item__text">
								<c:choose>
		                        	<c:when test="${dto.ratingavg==null or dto.ratingavg==0}">
		                        		
		                        	</c:when>
		                        	<c:otherwise>
		                        		<div class="rating">
		                         		<c:forEach begin="1" end="${dto.ratingavg }">
		                         			<i class="fa fa-star" style="color:red"></i>
		                         		</c:forEach>
		                         		<c:forEach begin="1" end="${5-dto.ratingavg }">
		                         			<i class="fa fa-star-o"></i>
		                         		</c:forEach>
		                        		</div>
		                        	</c:otherwise>
		                        </c:choose>		                        
		                    </div>
							</p>
						</div><!-- //TEXT WIDGET -->
						
						<hr>
						
						<!-- INFO WIDGET -->
						<div class="sidepanel widget_info">
							<ul class="work_info">
							<c:choose>
								<c:when test="${dto.pdcnt==0 }">
									<li><div class="single_portfolio_post_title" style="color:#DF0101">SOLD OUT</div></li>
								</c:when>
								<c:otherwise>
									<li>Price: <div class="single_portfolio_post_title" style="color:#DF0101">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.pdprice }" /></div></li>
								</c:otherwise>
							</c:choose>								
								<li>Detail: <pre>${dto.pdcontent }<br />상품번호: ${dto.pdnu }</pre></li>
								
							</ul>
							<c:choose>
								<c:when test="${dto.pdcnt==0 }">
									
								</c:when>
								<c:otherwise>
									주문수량: <input type="number" name="ctcnt" min="1" max=${dto.pdcnt } value="1">							
									<button type="button" class="addCart_btn">카트에 담기</button>
								</c:otherwise>
							</c:choose>	
							
							
							
							
						</div><!-- //INFO WIDGET -->
					</div><!-- //SIDEBAR -->
				</div><!-- //ROW -->
			</div><!-- //CONTAINER -->
			
			
			<!-- CONTAINER -->
			<div class="container">
				<h2><b>제품상세</b> </h2>
				<img src="https://anjoimages.s3.amazonaws.com/${dto.pddtimg }" alt="" />
			</div><!-- //CONTAINER -->
			
			
		</section><!-- //PORTFOLIO -->
	</div><!-- //PAGE -->
<hid>
	<!--  아이디-->
	<input type="hidden" name="mid" value=${member.mid }><br>
	
	
	<!-- 상품번호 -->
	<input type="hidden" name="pdnu" value=${dto.pdnu }><br>
	
	<!-- 상품명 -->
	<input type="hidden" name="pdname" value=${dto.pdname }>
	
	<!-- 상품가격 -->
	<input type="hidden" name="pdprice" value=${dto.pdprice }><br>
	
	<!-- 상품설명 -->
	<input type="hidden" name="pdcontent" value="${dto.pdcontent }">

	<!-- 본문이미지 -->
 	<input type="hidden" name="pddtimg" value=${dto.pddtimg }>
	<input type="hidden" name="pdimg1" value="${dto.pdimg1 }">

	<!-- 재고수량 -->
	<input type="hidden" name="pdcnt" value=${dto.pdcnt }><br>
	<!-- 판매개수 -->
	<input type="hidden" name="soldcnt" value=${dto.soldcnt }><br>

</hid>
	

	


</div>




</form>
</body>
</html>