<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/member/login.css">
<%@ include file="../include/shop_header.jsp" %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Best</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>Best</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<br>
<div class="preloader_hide">

	<!-- PAGE -->
	<div id="page" class="single_page">

		
		<!-- BREADCRUMBS -->

		
		
		
		<!-- PORTFOLIO -->
		<section id="portfolio">
<div class="container">
	<div class="row product__filter">

		<c:forEach var="row" items="${list }">
		   <div class="col-lg-3">
		       <div class="product__item">
		           <div class="product__item__pic set-bg" data-setbg="../resources/img/product/product-1.jpg">
			           <a href="${path }/product/item?pdnu=${row.pdnu }">
			           	<img src="https://anjoimages.s3.amazonaws.com/${row.pdimg1 }">
			           </a>
		               <span class="label"></span>
		               <ul class="product__hover">
		                   <li><a href="${path}/review/reviewList?searchOption=review.pdnu&keyword=${row.pdnu}"><img src="../resources/img/icon/search.png" alt=""></a></li>
		               </ul>
		           </div>
		           <div class="product__item__text">
		               <h6>${row.pdname }</h6>
		               <c:choose>
                        	<c:when test="${row.ratingavg==null or row.ratingavg==0}">
                        		
                        	</c:when>
                        	<c:otherwise>
                        		<div class="rating">
                         		<c:forEach begin="1" end="${row.ratingavg }">
                         			<i class="fa fa-star" style="color:red"></i>
                         		</c:forEach>
                         		<c:forEach begin="1" end="${5-row.ratingavg }">
                         			<i class="fa fa-star-o"></i>
                         		</c:forEach>
                        		</div>
                        	</c:otherwise>
                       </c:choose>
		               <c:choose>
							<c:when test="${row.pdcnt==0 }">
								<h5 style="color:#DF0101">SOLD OUT</h5>
							</c:when>
							<c:otherwise>
								<h5 style="color:#DF0101">￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.pdprice }" /></h5>	                          
							</c:otherwise>
						</c:choose>	
		           </div>
		       </div>
		   </div> 
		</c:forEach> 
	</div>
	</div>
	</section>
	</div>
</div>


</body>
</html>