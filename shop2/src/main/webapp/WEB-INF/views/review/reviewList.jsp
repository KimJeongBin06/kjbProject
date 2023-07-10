<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../include/shop_header.jsp" %>
	<meta charset="utf-8">
	<title>White | responsive bootstrap3 html5 one page template</title>
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

	
</head>
<body>
<%@ include file="../include/shop_menu.jsp" %>
<script>
	$(document).ready(
		function(){
			$("#btnWrite").click(
				function(){ //var 들어오는 값에 따라 자동으로 데이터형이 변환
					<c:choose>
						<c:when test="${sessionScope.member.mid == null }">
							alert("로그인 하신 후 사용해 주세요."); //알림창->확인버튼을 클릭 후
							location.href="${path}/member/login";  //로그인 페이지로 이동
						</c:when>
						<c:otherwise>
							location.href = "${path }/review/reviewWrite"; //폼을 전송
						</c:otherwise>
					</c:choose>
					//제목과 내용이 존재하면
					
				}		
			
			);
			
		}		
	);
</script>
<script>	
	function list(page){
		location.href="${path}/review/reviewList?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
	}
	
</script>
<form name="form1" method="get" action="${path}/review/reviewList">
<div class="preloader_hide">
<br>
<br>
<br>

	<!-- PAGE -->
	<div id="page" class="single_page">
	
		<!-- BREADCRUMBS -->
		<section class="breadcrumb-option">
		    <div class="container">
		        <div class="row">
		            <div class="col-lg-12">
		                <div class="breadcrumb__text">
		                    <h4>Review</h4>
		                    <div class="breadcrumb__links">
		                        <a href="/">Home</a>
		                        <span>Review</span>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</section>
		<br>
		
		
		<div style="text-align: center; padding:10px">
			<select name="searchOption" style="height:30px; width:70px; border-radius:10px">
				<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}" /> >전체</option>
				<option value="revtitle" <c:out value="${map.searchOption == 'revtitle'?'selected':''}" /> >제목</option>
				<option value="mname" <c:out value="${map.searchOption == 'mname'?'selected':''}" /> >작성자</option>
				<option value="pdname" <c:out value="${map.searchOption == 'pdname'?'selected':''}" /> >상품명</option>
				<option value="review.pdnu" <c:out value="${map.searchOption == 'review.pdnu'?'selected':''}" /> >상품코드</option>
			</select>
			<input name="keyword" value="${map.keyword }" style="height:30px; width:300px; border-radius:10px">
			<input type="submit" value="검색" style="height:30px; width:50px; border-radius:10px">
		</div>	
				
		
		
		<!-- BLOG -->
		<section id="blog">
			
			<!-- CONTAINER -->
			<div class="container">
				<!-- 글쓰기 버튼 -->
				<button type="button" id="btnWrite" style="float:right; height:30px; border-radius:10px">글쓰기</button>
				
				<!-- ROW -->
				<div class="row">
				
					<!-- BLOG BLOCK -->
					<div class="blog_block col-lg-9 col-md-9 padbot50">
						
						<!-- BLOG POST -->
						<c:forEach var="row" items="${map.list}">
						<div class="blog_post margbot50 clearfix" data-animated="fadeInUp">
							<div class="blog_post_img">
								<img src="https://anjoimages.s3.amazonaws.com/${row.revimg }" alt="" />
								<a class="zoom" href="${path }/review/reviewView?revnum=${row.revnum }&curPage=${map.productPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" ></a>
							</div>
							<div class="blog_post_descr">
								<div class="blog_post_date"><fmt:formatDate value="${row.revdate }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
								<a href="${path }/review/reviewView?revnum=${row.revnum }&curPage=${map.productPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.revtitle }</a>
								<ul class="blog_post_info">
									<li>${row.mname }</li>
									
									<li><c:out value="${fn:substring(row.pdname, 0, 10)}" /></li>
								</ul>
								<hr>
								<div class="blog_post_content"><c:out value="${fn:substring(row.revcontent, 0, 51)}" />...</div>
								
								<a class="read_more_btn" href="${path }/review/reviewView?revnum=${row.revnum }&curPage=${map.productPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}" >Read More</a>
								<hr>
							</div>
						</div><!-- //BLOG POST -->
						</c:forEach>
						
						<!-- PAGINATION -->
				<ul class="pagination">
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
				
				
				
			</div><!-- //BLOG BLOCK -->
					
		
				<hr>
						
				</div>
				</div>
				</section>
				
				</div>	
	

</div>
</form>
</body>
</html>