<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<%@ include file="../include/shop_header.jsp" %>
<link rel="stylesheet" href="../resources/css/member/login.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>

<body>
<!-- Page Preloder -->
<%@ include file="../include/shop_menu.jsp" %>
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Shop</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<!-- Breadcrumb Section End -->
<script>
	function list(page){
		var locationPath="${path}/product/list?catecode=${map.catecode}"+"&curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}"
		for (var pdtype of ${map.pdtypes}){
		    var locationPath=locationPath+"&pdtypes="+pdtype;
		}
		for (var pdshape of ${map.pdshapes}){
		    var locationPath=locationPath+"&pdshapes="+pdshape;
		}
		location.href=locationPath;
	}
	
	$(document).ready(function() {
	      $("#type_chkAll").click(function() {
	         if ($("#type_chkAll").is(":checked")) {
	            $("input[name=pdtypes]").prop("checked", true);
	         } else {
	            $("input[name=pdtypes]").prop("checked", false);
	         }
	      });

	      $("input[name=pdtypes]").click(function() {
	         var total = $("input[name=pdtypes]").length;
	         var checked = $("input[name=pdtypes]:checked").length;

	         if (total != checked) {
	            $("#type_chkAll").prop("checked", false);
	         } else {
	            $("#type_chkAll").prop("checked", true);
	         }
	      });
	   });
	$(document).ready(function() {
	      $("#shape_chkAll").click(function() {
	         if ($("#shape_chkAll").is(":checked")) {
	            $("input[name=pdshapes]").prop("checked", true);
	         } else {
	            $("input[name=pdshapes]").prop("checked", false);
	         }
	      });

	      $("input[name=pdshapes]").click(function() {
	         var total = $("input[name=pdshapes]").length;
	         var checked = $("input[name=pdshapes]:checked").length;

	         if (total != checked) {
	            $("#shape_chkAll").prop("checked", false);
	         } else {
	            $("#shape_chkAll").prop("checked", true);
	         }
	      });
	   });
	
	
</script>

<div id="page" class="single_page">
<form name="form1" method="get" action="${path}/product/list">

    <section class="product spad">
    <div class="container">
    
    	<!-- 필터링 파트 -->
        <%@ include file="../include/item_filter.jsp" %>
             
			<div style="padding-top:20px">
				<select name="searchOption" style="height:30px; width:70px; border-radius:10px">
					<option value="pdname" <c:out value="${map.searchOption == 'pdname'?'selected':''}" /> >제품명</option>
				</select>
				<input name="keyword" value="${map.keyword }" style="height:30px; width:300px; border-radius:10px">
				<input type="hidden" name="catecode" value="${map.catecode }">
				<input type="submit" value="검색" style="height:30px; width:50px; border-radius:10px">
			</div>
			<br>	
            <div class="row product__filter">

            <c:forEach var="row" items="${map.list }">
	                <div class="col-lg-3">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="../resources/img/product/product-1.jpg">
	                        <a href="${path }/product/item?pdnu=${row.pdnu }&catecode=${map.catecode }&curPage=${map.productPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
	                        	<img src="https://anjoimages.s3.amazonaws.com/${row.pdimg1 }">
	                        </a>
	                            <span class="label"></span>
	                            <ul class="product__hover">
	                                <li><a href="${path}/review/reviewList?searchOption=pdname&keyword=${row.pdname}"><img src="../resources/img/icon/search.png" alt=""></a></li>
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
                
  
  

        <div class="container">
            <div class="row">
            
                <div class="col-lg-8">
                    <ul class="pagination clearfix">
						<c:if test="${map.productPager.curPage > 1 }">
							<li class="page-item"><a href="javascript:list('1')" style="color:#585858">《</a></li>
						</c:if>
						<c:if test="${map.productPager.curBlock > 1}">
							<li class="page-item"><a href="javascript:list('${map.productPager.prevPage }')" style="color:#585858">〈</a></li>
						</c:if>			
						<c:forEach var="num" begin="${map.productPager.blockBegin }" end="${map.productPager.blockEnd }">
							<c:choose>
								<c:when test="${num == map.productPager.curPage }">
									<li class="page-item"><span style="color:#BDBDBD">${num}</span>&nbsp;</li>	
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="javascript:list('${num }')" style="color:#585858">${num }</a>&nbsp;</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					
						<c:if test="${map.productPager.curBlock <= map.productPager.totBlock }">
							<li class="page-item"><a href="javascript:list('${map.productPager.nextPage }')" style="color:#585858">〉</a></li>
						</c:if>
						<c:if test="${map.productPager.curBlock <= map.productPager.totPage }">
							<li class="page-item"><a href="javascript:list('${map.productPager.totPage }')" style="color:#585858">》</a></li>
						</c:if>					
					</ul><!-- //PAGINATION -->  
                </div>
            </div>
        </div>       
    	 </div>          
	</div>
</section>
</form>
</div>



</body>
</html>

